//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers          *//

/**
 * @return /datum/ai_pathing results, or **null on failure**
 */
/datum/ai_holder/proc/pathfind(
	pathfinder_type = src.ai_pathfinder_type,
	atom/source = src.agent,
	atom/destination,
	limit,
	within,
	slack,
)
	var/datum/ai_pathfinder/pathfinder = SSai_movement.ai_pathfinders[pathfinder_type]
	return pathfinder.search(
		src.agent,
		source,
		destination,
		limit,
		within,
		slack,
	)
