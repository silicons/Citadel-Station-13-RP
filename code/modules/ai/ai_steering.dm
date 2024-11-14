//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

/**
 * Datumized steering algorithm.
 *
 * Default implementation pulls from the following:
 *
 * 1. `imm_override_move` is used if it's there, and nulled out when complete
 * 2. `imm_walk_path` is used if it's there, and nulled out when complete
 * 3.
 */
/datum/ai_steering
	/// our holder
	var/datum/ai_holder/holder
	/// global API: override move.
	///
	/// * as number / direction bits: treat as direction bits, do once
	/// * as list: list of direction bits, processed from end to start for speed reasons
	///
	/// when this is 'done', it will be pulled from `imm_override_move_persistent` if it exists.
	var/list/imm_override_move
	/// global API: walk a path
	var/datum/ai_pathing/imm_walk_path

/datum/ai_steering/Destroy()
	holder?.set_steering_handler(null)
	return ..()

/**
 * process movement
 *
 * @return amount of time to next move; 0 or null to stop moving
 */
/datum/ai_steering/proc/move(cycles)
	return 0

/**
 * reset all movement overrides
 */
/datum/ai_steering/proc/reset()
	imm_override_move = null
	imm_walk_path = null

/**
 * Insert a list of directions to move.
 */
/datum/ai_steering/proc/request_override(list/directions, start_moving_with_delay)
	imm_override_move = directions.Copy()
	(!isnull(start_moving_with_delay) && holder?.start_moving(start_moving_with_delay))

/datum/ai_steering/proc/request_walk(datum/ai_pathing/path, start_moving_with_delay)
	imm_walk_path = path
	(!isnull(start_moving_with_delay) && holder?.start_moving(start_moving_with_delay))

#warn impl
