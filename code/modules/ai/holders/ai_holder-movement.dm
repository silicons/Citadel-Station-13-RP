
//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers          *//

/**
 * process movement
 *
 * @return amount of time to next move; 0 to stop moving
 */
/datum/ai_holder/proc/move(cycles)
	SHOULD_NOT_SLEEP(TRUE)
	. = 0
	CRASH("unimplemented move proc called; what happened here?")

/**
 * register on movement subsystem to move
 */
/datum/ai_holder/proc/start_moving(initial_delay)
	SHOULD_NOT_SLEEP(TRUE)
	return SSai_movement.register_moving(src)

/**
 * stop moving
 */
/datum/ai_holder/proc/stop_moving()
	SHOULD_NOT_SLEEP(TRUE)
	return SSai_movement.unregister_moving(src)
