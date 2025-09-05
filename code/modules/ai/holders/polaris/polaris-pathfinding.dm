// This handles obtaining a (usually A*) path towards something, such as a target, destination, or leader.
// This interacts heavily with code inside ai_holder_movement.dm

// This clears the stored A* path.
/datum/ai_holder/polaris/proc/forget_path()
	polaris_ai_log("forget_path() : Entering.", POLARIS_AI_LOG_DEBUG)
	if(path_display)
		for(var/turf/T in path)
			T.cut_overlay(path_overlay)
	path.Cut()
	polaris_ai_log("forget_path() : Exiting.", POLARIS_AI_LOG_DEBUG)

/datum/ai_holder/polaris/proc/give_up_movement()
	polaris_ai_log("give_up_movement() : Entering.", POLARIS_AI_LOG_DEBUG)
	forget_path()
	destination = null
	polaris_ai_log("give_up_movement() : Exiting.", POLARIS_AI_LOG_DEBUG)

/datum/ai_holder/polaris/proc/calculate_path(atom/A, get_to = 1)
	polaris_ai_log("calculate_path([A],[get_to]) : Entering.", POLARIS_AI_LOG_DEBUG)
	if(!A)
		polaris_ai_log("calculate_path() : Called without an atom. Exiting.",POLARIS_AI_LOG_WARNING)
		return

	if(!use_astar) // If we don't use A* then this is pointless.
		polaris_ai_log("calculate_path() : Not using A*, Exiting.", POLARIS_AI_LOG_DEBUG)
		return

	get_path(get_turf(A), get_to)

	polaris_ai_log("calculate_path() : Exiting.", POLARIS_AI_LOG_DEBUG)

//A* now, try to a path to a target
/datum/ai_holder/polaris/proc/get_path(var/turf/target,var/get_to = 1, var/max_distance = world.view*6)
	polaris_ai_log("get_path() : Entering.",POLARIS_AI_LOG_DEBUG)
	forget_path()
	var/list/new_path = SSpathfinder.default_ai_pathfinding(src, target, get_to)

	if(new_path && new_path.len)
		path = new_path
		polaris_ai_log("get_path() : Made new path.",POLARIS_AI_LOG_DEBUG)
		if(path_display)
			for(var/turf/T in path)
				T.add_overlay(path_overlay)
	else
		polaris_ai_log("get_path() : Failed to make new path. Exiting.",POLARIS_AI_LOG_DEBUG)
		return 0

	polaris_ai_log("get_path() : Exiting.", POLARIS_AI_LOG_DEBUG)
	return path.len
