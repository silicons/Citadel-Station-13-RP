/**
 * Straight port of polaris AI holders.
 */
/datum/ai_holder/polaris
	//* basics *//
	var/mob/living/holder = null		// The mob this datum is going to control.
	var/stance = STANCE_IDLE			// Determines if the mob should be doing a specific thing, e.g. attacking, following, standing around, etc.
	var/intelligence_level = POLARIS_AI_NORMAL	// Adjust to make the AI be intentionally dumber, or make it more robust (e.g. dodging grenades).
	var/autopilot = FALSE				// If true, the AI won't be deactivated if a client gets attached to the AI's mob.
	var/busy = FALSE					// If true, the SSticker will skip processing this mob until this is false. Good for if you need the
										// mob to stay still (e.g. delayed attacwking). If you need the mob to be inactive for an extended period of time,
										// consider sleeping the AI instead.

	//* combat *//
	var/firing_lanes = TRUE					// If ture, tries to refrain from shooting allies or the wall.
	var/conserve_ammo = FALSE				// If true, the mob will avoid shooting anything that does not have a chance to hit a mob. Requires firing_lanes to be true.
	var/pointblank = FALSE					// If ranged is true, and this is true, people adjacent to the mob will suffer the ranged instead of using a melee attack.

	var/can_breakthrough = TRUE				// If false, the AI will not try to open a path to its goal, like opening doors.
	var/violent_breakthrough = TRUE			// If false, the AI is not allowed to destroy things like windows or other structures in the way. Requires above var to be true.

	var/stand_ground = FALSE				// If true, the AI won't try to get closer to an enemy if out of range.

	//* communication *//
	var/threaten = FALSE				// If hostile and sees a valid target, gives a 'warning' to the target before beginning the attack.
	var/threatening = FALSE				// If the mob actually gave the warning, checked so it doesn't constantly yell every tick.
	var/threaten_delay = 3 SECONDS		// How long a 'threat' lasts, until actual fighting starts. If null, the mob never starts the fight but still does the threat.
	var/threaten_timeout = 1 MINUTE		// If the mob threatens someone, they leave, and then come back before this timeout period, the mob escalates to fighting immediately.
	var/last_conflict_time = null		// Last occurance of fighting being used, in world.time.
	var/last_threaten_time = null		// Ditto but only for threats.
	var/last_target_time = null			// Ditto for when we last switched targets, used to stop retaliate from gimping mobs

	var/speak_chance = 0				// Probability that the mob talks (this is 'X in 200' chance since even 1/100 is pretty noisy)

	//* cooperation *//
	var/cooperative = FALSE						// If true, asks allies to help when fighting something.
	var/call_distance = 14						// How far away calls for help will go for.
	var/last_helpask_time = 0					// world.time when a mob asked for help.
	var/list/faction_friends = list()			// List of all mobs inside the faction with ai_holders that have cooperate on, to call for help without using range().
												// Note that this is only used for sending calls out. Receiving calls doesn't care about this list, only if the mob is in the faction.
												// This means the AI could respond to a player's call for help, if a way to do so was implemented.

	// These vars don't do anything currently. They did before but an optimization made them nonfunctional.
	// It was probably worth it.
	var/call_players = FALSE					// (Currently nonfunctional) If true, players get notified of an allied mob calling for help.
	var/called_player_message = "needs help!"	// (Currently nonfunctional) Part of a message used when above var is true. Full message is "\The [holder] [called_player_message]"

	//* debug *//
	var/path_display = FALSE						// Displays a visual path when A* is being used.
	var/path_icon = 'icons/misc/debug_group.dmi'	// What icon to use for the overlay
	var/path_icon_state = "red"						// What state to use for the overlay
	var/image/path_overlay							// A reference to the overlay

	var/last_turf_display = FALSE					// Similar to above, but shows the target's last known turf visually.
	var/last_turf_icon_state = "green"				// A seperate icon_state from the previous.
	var/image/last_turf_overlay						// Another reference for an overlay.

	var/stance_coloring = FALSE						// Colors the mob depending on its stance.

	var/debug_ai = POLARIS_AI_LOG_OFF						// The level of debugging information to display to people who can see log_debug().

	//* fleeing *//
	var/can_flee = TRUE					// If they're even allowed to flee.
	var/flee_when_dying = TRUE			// If they should flee when low on health.
	var/dying_threshold = 0.3			// How low on health the holder needs to be before fleeing. Defaults to 30% or lower health.
	var/flee_when_outmatched = FALSE	// If they should flee upon reaching a specific tension threshold.
	var/outmatched_threshold = 200		// The tension threshold needed for a mob to decide it should run away.

	//* following *//
	var/atom/movable/leader = null		// The movable atom that the mob wants to follow.
	var/follow_distance = 2				// How far leader must be to start moving towards them.
	var/follow_until_time = 0			// world.time when the mob will stop following leader. 0 means it won't time out.

	//* incapacitation *//
	var/respect_confusion = TRUE // If false, the mob won't wander around recklessly.

	//* movement *//
	// General.
	var/turf/destination = null			// The targeted tile the mob wants to walk to.
	var/min_distance_to_destination = 1	// Holds how close the mob should go to destination until they're done.

	// Home.
	var/turf/home_turf = null			// The mob's 'home' turf. It will try to stay near it if told to do so. This is the turf the AI was initialized on by default.
	var/returns_home = FALSE			// If true, makes the mob go to its 'home' if it strays too far.
	var/home_low_priority = FALSE		// If true, the mob will not go home unless it has nothing better to do, e.g. its following someone.
	var/max_home_distance = 3			// How far the mob can go away from its home before being told to go_home().
										// Note that there is a 'BYOND cap' of 14 due to limitations of get_/step_to().

	// Wandering.
	var/wander = FALSE					// If true, the mob will randomly move in the four cardinal directions when idle.
	var/wander_delay = 0				// How many ticks until the mob can move a tile in handle_wander_movement().
	var/base_wander_delay = 2			// What the above var gets set to when it wanders. Note that a tick happens every half a second.
	var/wander_when_pulled = FALSE		// If the mob will refrain from wandering if someone is pulling it.

	//* pathfinding *//
	// Pathfinding.
	var/use_astar = FALSE				// Do we use the more expensive A* implementation or stick with BYOND's default step_to()?
	var/list/path = list()				// A list of tiles that A* gave us as a solution to reach the target.
	var/list/obstacles = list()			// Things A* will try to avoid.
	var/astar_adjacent_proc = /turf/proc/CardinalTurfsWithAccess // Proc to use when A* pathfinding.  Default makes them bound to cardinals.
	var/failed_steps = 0				// If move_once() fails to move the mob onto the correct tile, this increases. When it reaches 3, the path is recalc'd since they're probably stuck.

	//* targeting *//
	var/hostile = FALSE						// Do we try to hurt others?
	var/retaliate = FALSE					// Attacks whatever struck it first. Mobs will still attack back if this is false but hostile is true.
	var/mauling = FALSE						// Attacks unconscious mobs
	var/handle_corpse = FALSE					// Allows AI to acknowledge corpses (e.g. nurse spiders)

	var/atom/movable/target = null			// The thing (mob or object) we're trying to kill.
	var/atom/movable/preferred_target = null// If set, and if given the chance, we will always prefer to target this over other options.
	var/turf/target_last_seen_turf = null 	// Where the mob last observed the target being, used if the target disappears but the mob wants to keep fighting.

	var/vision_range = 7					// How far the targeting system will look for things to kill. Note that values higher than 7 are 'offscreen' and might be unsporting.
	var/respect_alpha = TRUE				// If true, mobs with a sufficently low alpha will be treated as invisible.
	var/alpha_vision_threshold = 127		// Targets with an alpha less or equal to this will be considered invisible. Requires above var to be true.
	var/max_range = 7 						// Max range a ranged mob will shoot from

	var/lose_target_time = 0				// world.time when a target was lost.
	var/lose_target_timeout = 5 SECONDS		// How long until a mob 'times out' and stops trying to find the mob that disappeared.

	var/list/attackers = list()				// List of strings of names of people who attacked us before in our life.
											// This uses strings and not refs to allow for disguises, and to avoid needing to use weakrefs.
	var/destructive = FALSE					// Will target 'neutral' structures/objects and not just 'hostile' ones.

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

