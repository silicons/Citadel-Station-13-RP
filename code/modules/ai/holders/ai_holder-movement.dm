//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

/datum/ai_holder
	/// movement subsystem registered?
	///
	/// warning: we can technically be moving while disabled
	/// make sure you handle this.
	var/movement_ticking = FALSE
	/// bucket position
	var/movement_bucket_position
	/// last datum in bucket
	var/datum/ai_holder/movement_bucket_prev
	/// next datum in bucket
	var/datum/ai_holder/movement_bucket_next
	/// movement cycle
	var/movement_cycle
	/// our steering algorithm, if it exists
	var/datum/ai_steering/steering

/**
 * process movement
 *
 * * by default, tries to use a steering datum.
 *
 * @return amount of time to next move; 0 or null to stop moving
 */
/datum/ai_holder/proc/move(cycles)
	return steering?.move(cycles)

/**
 * register on movement subsystem to move
 *
 * @return TRUE if we are now ticking movement
 */
/datum/ai_holder/proc/start_moving(initial_delay)
	if(movement_ticking)
		return TRUE
	return SSai_movement.register_moving(src)

/**
 * stop moving
 *
 * @return TRUE if we are now not ticking movement
 */
/datum/ai_holder/proc/stop_moving()
	if(!movement_ticking)
		return TRUE
	return SSai_movement.unregister_moving(src)

/datum/ai_holder/proc/set_steering_handler(datum/ai_steering/steering)
	#warn impl
