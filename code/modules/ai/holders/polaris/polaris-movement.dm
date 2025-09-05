/datum/ai_holder/polaris
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


/datum/ai_holder/polaris/proc/walk_to_destination()
	polaris_ai_log("walk_to_destination() : Entering.",POLARIS_AI_LOG_TRACE)
	if(!destination)
		polaris_ai_log("walk_to_destination() : No destination.", POLARIS_AI_LOG_WARNING)
		forget_path()
		set_stance(stance == STANCE_REPOSITION ? STANCE_APPROACH : STANCE_IDLE)
		polaris_ai_log("walk_to_destination() : Exiting.", POLARIS_AI_LOG_TRACE)
		return

	var/get_to = min_distance_to_destination
	var/distance = get_dist(holder, destination)
	polaris_ai_log("walk_to_destination() : get_to is [get_to].", POLARIS_AI_LOG_TRACE)

	// We're here!
	if(distance <= get_to)
		give_up_movement()
		set_stance(stance == STANCE_REPOSITION ? STANCE_APPROACH : STANCE_IDLE)
		polaris_ai_log("walk_to_destination() : Destination reached. Exiting.", POLARIS_AI_LOG_INFO)
		return

	polaris_ai_log("walk_to_destination() : Walking.", POLARIS_AI_LOG_TRACE)
	walk_path(destination, get_to)
	polaris_ai_log("walk_to_destination() : Exiting.",POLARIS_AI_LOG_TRACE)

/datum/ai_holder/polaris/proc/should_go_home()
	if(!returns_home || !home_turf)
		return FALSE
	if(get_dist(holder, home_turf) > max_home_distance)
		if(!home_low_priority)
			return TRUE
		else if(!leader && !target)
			return TRUE
	return FALSE
//	return (returns_home && home_turf) && (get_dist(holder, home_turf) > max_home_distance)

/datum/ai_holder/polaris/proc/go_home()
	if(home_turf)
		polaris_ai_log("go_home() : Telling holder to go home.", POLARIS_AI_LOG_INFO)
		lose_follow() // So they don't try to path back and forth.
		give_destination(home_turf, max_home_distance)
	else
		polaris_ai_log("go_home() : Told to go home without home_turf.", POLARIS_AI_LOG_ERROR)

/datum/ai_holder/polaris/proc/give_destination(turf/new_destination, min_distance = 1, combat = FALSE)
	polaris_ai_log("give_destination() : Entering.", POLARIS_AI_LOG_DEBUG)

	destination = new_destination
	min_distance_to_destination = min_distance

	if(new_destination != null)
		polaris_ai_log("give_destination() : Going to new destination.", POLARIS_AI_LOG_INFO)
		set_stance(combat ? STANCE_REPOSITION : STANCE_MOVE)
		return TRUE
	else
		polaris_ai_log("give_destination() : Given null destination.", POLARIS_AI_LOG_ERROR)

	polaris_ai_log("give_destination() : Exiting.", POLARIS_AI_LOG_DEBUG)


// Walk towards whatever.
/datum/ai_holder/polaris/proc/walk_path(atom/A, get_to = 1)
	polaris_ai_log("walk_path() : Entered.", POLARIS_AI_LOG_TRACE)

	if(use_astar)
		if(!path.len) // If we're missing a path, make a new one.
			polaris_ai_log("walk_path() : No path. Attempting to calculate path.", POLARIS_AI_LOG_DEBUG)
			calculate_path(A, get_to)

		if(!path.len) // If we still don't have one, then the target's probably somewhere inaccessible to us. Get as close as we can.
			polaris_ai_log("walk_path() : Failed to obtain path to target. Using get_step_to() instead.", POLARIS_AI_LOG_INFO)
		//	step_to(holder, A)
			if(holder.ai_polaris_move(get_step_to(holder, A)) == POLARIS_AI_MOVEMENT_FAILED)
				polaris_ai_log("walk_path() : Failed to move, attempting breakthrough.", POLARIS_AI_LOG_INFO)
				INVOKE_ASYNC(src, PROC_REF(breakthrough), A)
			return

		if(move_once() == FALSE) // Start walking the path.
			polaris_ai_log("walk_path() : Failed to step.", POLARIS_AI_LOG_TRACE)
			++failed_steps
			if(failed_steps > 3) // We're probably stuck.
				polaris_ai_log("walk_path() : Too many failed_steps.", POLARIS_AI_LOG_DEBUG)
				forget_path() // So lets try again with a new path.
				failed_steps = 0

	else
	//	step_to(holder, A)
		polaris_ai_log("walk_path() : Going to ai_polaris_move().", POLARIS_AI_LOG_TRACE)
		if(holder.ai_polaris_move(get_step_to(holder, A)) == POLARIS_AI_MOVEMENT_FAILED )
			polaris_ai_log("walk_path() : Failed to move, attempting breakthrough.", POLARIS_AI_LOG_INFO)
			breakthrough(A) // We failed to move, time to smash things.

	polaris_ai_log("walk_path() : Exited.", POLARIS_AI_LOG_TRACE)


//Take one step along a path
/datum/ai_holder/polaris/proc/move_once()
	polaris_ai_log("move_once() : Entered.", POLARIS_AI_LOG_TRACE)
	if(!path.len)
		return

	if(path_display)
		var/turf/T = src.path[1]
		T.cut_overlay(path_overlay)

//	step_towards(holder, src.path[1])
	if(holder.ai_polaris_move(get_step_towards(holder, src.path[1])) != POLARIS_AI_MOVEMENT_ON_COOLDOWN)
		if(holder.loc != src.path[1])
			polaris_ai_log("move_once() : Failed step. Exiting.", POLARIS_AI_LOG_TRACE)
			return POLARIS_AI_MOVEMENT_FAILED
		else
			path -= src.path[1]
			polaris_ai_log("move_once() : Successful step. Exiting.", POLARIS_AI_LOG_TRACE)
			return POLARIS_AI_MOVEMENT_SUCCESSFUL
	polaris_ai_log("move_once() : Mob movement on cooldown. Exiting.", POLARIS_AI_LOG_TRACE)
	return POLARIS_AI_MOVEMENT_ON_COOLDOWN

/datum/ai_holder/polaris/proc/should_wander()
	if(HAS_TRAIT(src, TRAIT_AI_PAUSE_AUTOMATED_MOVEMENT))
		return
	else
		return wander && !leader

// Wanders randomly in cardinal directions.
/datum/ai_holder/polaris/proc/handle_wander_movement()
	polaris_ai_log("handle_wander_movement() : Entered.", POLARIS_AI_LOG_TRACE)
	if(isturf(holder.loc) && can_act())
		wander_delay--
		if(wander_delay <= 0)
			if(!wander_when_pulled && (holder.pulledby || holder.grabbed_by.len))
				polaris_ai_log("handle_wander_movement() : Being pulled and cannot wander. Exiting.", POLARIS_AI_LOG_DEBUG)
				return

			var/moving_to = 0 // Apparently this is required or it always picks 4, according to the previous developer for simplemob AI.
			moving_to = pick(GLOB.cardinal)
			holder.setDir(moving_to)
			holder.ai_polaris_move(get_step(holder,moving_to))
			wander_delay = base_wander_delay
	polaris_ai_log("handle_wander_movement() : Exited.", POLARIS_AI_LOG_TRACE)

/datum/ai_holder/polaris/proc/pause_automated_movement(source)
	ADD_TRAIT(src, TRAIT_AI_PAUSE_AUTOMATED_MOVEMENT, source)

/datum/ai_holder/polaris/proc/resume_automated_movement(source)
	REMOVE_TRAIT(src, TRAIT_AI_PAUSE_AUTOMATED_MOVEMENT, source)
