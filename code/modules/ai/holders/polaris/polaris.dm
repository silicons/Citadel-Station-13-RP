// This is a datum-based artificial intelligence for simple mobs (and possibly others) to use.
// The neat thing with having this here instead of on the mob is that it is independant of Life(), and that different mobs
// can use a more or less complex AI by giving it a different datum.

/datum/ai_holder/polaris
	var/mob/living/holder = null		// The mob this datum is going to control.
	var/stance = STANCE_IDLE			// Determines if the mob should be doing a specific thing, e.g. attacking, following, standing around, etc.
	var/intelligence_level = POLARIS_AI_NORMAL	// Adjust to make the AI be intentionally dumber, or make it more robust (e.g. dodging grenades).
	var/autopilot = FALSE				// If true, the AI won't be deactivated if a client gets attached to the AI's mob.
	var/busy = FALSE					// If true, the SSticker will skip processing this mob until this is false. Good for if you need the
										// mob to stay still (e.g. delayed attacwking). If you need the mob to be inactive for an extended period of time,
										// consider sleeping the AI instead.

/datum/ai_holder/polaris/hostile
	hostile = TRUE

/datum/ai_holder/polaris/retaliate
	hostile = TRUE
	retaliate = TRUE

/datum/ai_holder/polaris/New(var/new_holder)
	ASSERT(new_holder)
	holder = new_holder
	SSai.processing += src
	home_turf = get_turf(holder)
	..()

/datum/ai_holder/polaris/Destroy()
	holder = null
	SSai.processing -= src // We might've already been asleep and removed, but byond won't care if we do this again and it saves a conditional.
	home_turf = null
	return ..()


// Now for the actual AI stuff.

// Makes this ai holder not get processed.
// Called automatically when the host mob is killed.
// Potential future optimization would be to sleep AIs which mobs that are far away from in-round players.
/datum/ai_holder/polaris/proc/go_sleep()
	if(stance == STANCE_SLEEP)
		return
	forget_everything() // If we ever wake up, its really unlikely that our current memory will be of use.
	set_stance(STANCE_SLEEP)
	SSai.processing -= src

// Reverses the above proc.
// Revived mobs will wake their AI if they have one.
/datum/ai_holder/polaris/proc/go_wake()
/*	if(stance != STANCE_SLEEP)
		return
	if(!should_wake())
		return
*/
	set_stance(STANCE_IDLE)
	SSai.processing += src

/datum/ai_holder/polaris/proc/should_wake()
	if(holder.client && !autopilot)
		return FALSE
	if(holder.stat >= DEAD)
		return FALSE
	return TRUE

// Resets a lot of 'memory' vars.
/datum/ai_holder/polaris/proc/forget_everything()
	// Some of these might be redundant, but hopefully this prevents future bugs if that changes.
	lose_follow()
	lose_target()
	lose_target_position()
	give_up_movement()

// 'Tactical' processes such as moving a step, meleeing an enemy, firing a projectile, and other fairly cheap actions that need to happen quickly.
/datum/ai_holder/polaris/proc/handle_tactics()
	if(busy)
		return
	handle_special_tactic()
	handle_stance_tactical()

// 'Strategical' processes that are more expensive on the CPU and so don't get run as often as the above proc, such as A* pathfinding or robust targeting.
/datum/ai_holder/polaris/proc/handle_strategicals()
	if(busy)
		return
	handle_special_strategical()
	handle_stance_strategical()

// Override these for special things without polluting the main loop.
/datum/ai_holder/polaris/proc/handle_special_tactic()

/datum/ai_holder/polaris/proc/handle_special_strategical()

/*
	//AI Actions
	if(!ai_inactive)
		//Stanceyness
		handle_stance()

		//Movement
		if(!stop_automated_movement && wander && !anchored) //Allowed to move?
			handle_wander_movement()

		//Speaking
		if(speak_chance && stance == STANCE_IDLE) // Allowed to chatter?
			handle_idle_speaking()

		//Resisting out buckles
		if(stance != STANCE_IDLE && incapacitated(INCAPACITATION_BUCKLED_PARTIALLY))
			handle_resist()

		//Resisting out of closets
		if(istype(loc,/obj/structure/closet))
			var/obj/structure/closet/C = loc
			if(C.welded)
				resist()
			else
				C.open()
*/

// For setting the stance WITHOUT processing it
/datum/ai_holder/polaris/proc/set_stance(var/new_stance)
	polaris_ai_log("set_stance() : Setting stance from [stance] to [new_stance].", POLARIS_AI_LOG_INFO)
	stance = new_stance
	if(stance_coloring) // For debugging or really weird mobs.
		stance_color()

// This is called every half a second.
/datum/ai_holder/polaris/proc/handle_stance_tactical()
	polaris_ai_log("========= Fast Process Beginning ==========", POLARIS_AI_LOG_TRACE) // This is to make it easier visually to disinguish between 'blocks' of what a tick did.
	polaris_ai_log("handle_stance_tactical() : Called.", POLARIS_AI_LOG_TRACE)

	if(stance == STANCE_SLEEP)
		polaris_ai_log("handle_stance_tactical() : Going to sleep.", POLARIS_AI_LOG_TRACE)
		go_sleep()
		return

	if(target && can_see_target(target))
		track_target_position()

	if(stance != STANCE_DISABLED && is_disabled()) // Stunned/confused/etc
		polaris_ai_log("handle_stance_tactical() : Disabled.", POLARIS_AI_LOG_TRACE)
		set_stance(STANCE_DISABLED)
		return

	if(stance in STANCES_COMBAT)
		// Should resist?  We check this before fleeing so that we can actually flee and not be trapped in a chair.
		if(holder.incapacitated(INCAPACITATION_BUCKLED_PARTIALLY) || LAZYLEN(holder.grabbed_by))
			polaris_ai_log("handle_stance_tactical() : Going to handle_resist().", POLARIS_AI_LOG_TRACE)
			handle_resist()

		else if(istype(holder.loc, /obj/structure/closet))
			var/obj/structure/closet/C = holder.loc
			polaris_ai_log("handle_stance_tactical() : Inside a closet. Going to attempt escape.", POLARIS_AI_LOG_TRACE)
			if(C.sealed)
				INVOKE_ASYNC(holder, /mob/living/verb/resist)
			else
				C.open()

		// Should we flee?
		if(should_flee())
			polaris_ai_log("handle_stance_tactical() : Going to flee.", POLARIS_AI_LOG_TRACE)
			set_stance(STANCE_FLEE)
			return
	else if(stance == STANCE_DISABLED)
		if(LAZYLEN(holder.grabbed_by))
			polaris_ai_log("handle_stance_tactical() : Going to resist while disabled due to grab.", POLARIS_AI_LOG_TRACE)
			holder.resist()

	switch(stance)
		if(STANCE_IDLE)
			if(should_go_home())
				polaris_ai_log("handle_stance_tactical() : STANCE_IDLE, going to go home.", POLARIS_AI_LOG_TRACE)
				go_home()

			else if(should_follow_leader())
				polaris_ai_log("handle_stance_tactical() : STANCE_IDLE, going to follow leader.", POLARIS_AI_LOG_TRACE)
				set_stance(STANCE_FOLLOW)

			else if(should_wander())
				polaris_ai_log("handle_stance_tactical() : STANCE_IDLE, going to wander randomly.", POLARIS_AI_LOG_TRACE)
				handle_wander_movement()

		if(STANCE_ALERT)
			polaris_ai_log("handle_stance_tactical() : STANCE_ALERT, going to threaten_target().", POLARIS_AI_LOG_TRACE)
			threaten_target()

		if(STANCE_APPROACH)
			polaris_ai_log("handle_stance_tactical() : STANCE_APPROACH, going to walk_to_target().", POLARIS_AI_LOG_TRACE)
			walk_to_target()

		if(STANCE_FIGHT)
			polaris_ai_log("handle_stance_tactical() : STANCE_FIGHT, going to engage_target().", POLARIS_AI_LOG_TRACE)
			engage_target()

		if(STANCE_MOVE)
			polaris_ai_log("handle_stance_tactical() : STANCE_MOVE, going to walk_to_destination().", POLARIS_AI_LOG_TRACE)
			walk_to_destination()

		if(STANCE_REPOSITION) // This is the same as above but doesn't stop if an enemy is visible since its an 'in-combat' move order.
			polaris_ai_log("handle_stance_tactical() : STANCE_REPOSITION, going to walk_to_destination().", POLARIS_AI_LOG_TRACE)
			walk_to_destination()

		if(STANCE_FOLLOW)
			polaris_ai_log("handle_stance_tactical() : STANCE_FOLLOW, going to walk_to_leader().", POLARIS_AI_LOG_TRACE)
			walk_to_leader()

		if(STANCE_FLEE)
			polaris_ai_log("handle_stance_tactical() : STANCE_FLEE, going to flee_from_target().", POLARIS_AI_LOG_TRACE)
			flee_from_target()

		if(STANCE_DISABLED)
			polaris_ai_log("handle_stance_tactical() : STANCE_DISABLED.", POLARIS_AI_LOG_TRACE)
			if(!is_disabled())
				polaris_ai_log("handle_stance_tactical() : No longer disabled.", POLARIS_AI_LOG_TRACE)
				set_stance(STANCE_IDLE)
			else
				handle_disabled()

	polaris_ai_log("handle_stance_tactical() : Exiting.", POLARIS_AI_LOG_TRACE)
	polaris_ai_log("========= Fast Process Ending ==========", POLARIS_AI_LOG_TRACE)

// This is called every two seconds.
/datum/ai_holder/polaris/proc/handle_stance_strategical()
	polaris_ai_log("++++++++++ Slow Process Beginning ++++++++++", POLARIS_AI_LOG_TRACE)
	polaris_ai_log("handle_stance_strategical() : Called.", POLARIS_AI_LOG_TRACE)

	switch(stance)
		if(STANCE_IDLE)

			if(speak_chance) // In the long loop since otherwise it wont shut up.
				handle_idle_speaking()

			if(hostile)
				polaris_ai_log("handle_stance_strategical() : STANCE_IDLE, going to find_target().", POLARIS_AI_LOG_TRACE)
				find_target()
		if(STANCE_APPROACH)
			if(target)
				polaris_ai_log("handle_stance_strategical() : STANCE_APPROACH, going to calculate_path([target]).", POLARIS_AI_LOG_TRACE)
				calculate_path(target)
		if(STANCE_MOVE)
			if(hostile && find_target()) // This will switch its stance.
				polaris_ai_log("handle_stance_strategical() : STANCE_MOVE, found target and was inturrupted.", POLARIS_AI_LOG_TRACE)
		if(STANCE_FOLLOW)
			if(hostile && find_target()) // This will switch its stance.
				polaris_ai_log("handle_stance_strategical() : STANCE_FOLLOW, found target and was inturrupted.", POLARIS_AI_LOG_TRACE)
			else if(leader)
				polaris_ai_log("handle_stance_strategical() : STANCE_FOLLOW, going to calculate_path([leader]).", POLARIS_AI_LOG_TRACE)
				calculate_path(leader)

	polaris_ai_log("handle_stance_strategical() : Exiting.", POLARIS_AI_LOG_TRACE)
	polaris_ai_log("++++++++++ Slow Process Ending ++++++++++", POLARIS_AI_LOG_TRACE)


// Helper proc to turn AI 'busy' mode on or off without having to check if there is an AI, to simplify writing code.
/mob/living/proc/set_AI_busy(value)
	var/datum/ai_holder/polaris/ai_holder = src.ai_holder
	if(istype(ai_holder))
		ai_holder.busy = value

/mob/living/proc/is_AI_busy()
	var/datum/ai_holder/polaris/ai_holder = src.ai_holder
	if(!istype(ai_holder))
		return FALSE
	return ai_holder.busy

// Helper proc to check for the AI's stance.
// Returns null if there's no AI holder, or the mob has a player and autopilot is not on.
// Otherwise returns the stance.
/mob/living/proc/get_polaris_AI_stance()
	var/datum/ai_holder/polaris/ai_holder = src.ai_holder
	if(!istype(ai_holder))
		return null
	if(client && !ai_holder.autopilot)
		return null
	return ai_holder.stance

// Similar to above but only returns 1 or 0.
/mob/living/proc/has_polaris_AI()
	if(!istype(ai_holder, /datum/ai_holder/polaris))
		return FALSE
	return get_polaris_AI_stance() ? TRUE : FALSE

// 'Taunts' the AI into attacking the taunter.
/mob/living/proc/taunt(atom/movable/taunter, force_target_switch = FALSE)
	var/datum/ai_holder/polaris/ai_holder = src.ai_holder
	if(istype(ai_holder))
		ai_holder.receive_taunt(taunter, force_target_switch)
