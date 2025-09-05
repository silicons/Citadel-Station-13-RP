//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers          *//

/datum/ai_holder/dynamic/move(cycles)

/**
 * @return TRUE if we can move, FALSE if we cannot move, /datum/ai_dynamic_task if we can fix our motion with a specific method
 */
/datum/ai_holder/dynamic/proc/steering_evaluation()
	#warn impl

/**
 * @return deciseconds predicted to next move, or -1 if failed
 */
/datum/ai_holder/dynamic/proc/steering_move_agent(dir)
	return -1
