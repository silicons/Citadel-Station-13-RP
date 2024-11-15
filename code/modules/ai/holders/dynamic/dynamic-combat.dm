//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

/datum/ai_holder/dynamic
	/// the current adapter we're attacking with for ranged
	var/tmp/datum/ai_adapter/dynamic_combat_ranged_adapter
	/// the current adapter we're attacking with for melee
	var/tmp/datum/ai_adapter/dynamic_combat_melee_adapter

/**
 * Schedules an attack.
 *
 * @params
 * * target - thing to attack
 * * adapter - adapter to attack with
 * * time - delay
 * * process_result - allow the result to change our behavior (e.g. telling us to go closer).
 * * process_as_ranged - consider this a ranged attack. as an example, we try to maneuver for melee more than for ranged.
 */
/datum/ai_holder/dynamic/proc/schedule_attack(atom/target, datum/ai_adapter/adapter, time, process_result, process_as_ranged)
	schedule(time, PROC_REF(process_attack), list(target, adapter, process_result, process_as_ranged))

/**
 * Processes an attack.
 *
 * @params
 * * target - thing to attack
 * * adapter - adapter to attack with
 * * process_result - allow the result to change our behavior (e.g. telling us to go closer).
 * * process_as_ranged - consider this a ranged attack. as an example, we try to maneuver for melee more than for ranged.
 */
/datum/ai_holder/dynamic/proc/process_attack(atom/target, datum/ai_adapter/adapter, process_result, process_as_ranged)
	#warn impl

/datum/ai_holder/dynamic/proc/reconsider_ranged_adapter()

/datum/ai_holder/dynamic/proc/reconsider_melee_adapter()

#warn impl
