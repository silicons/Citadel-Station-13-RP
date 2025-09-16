//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers          *//

GLOBAL_LIST_INIT(ai_dynamic_steering_routines, init_ai_dynamic_steering_routines())

/proc/init_ai_dynamic_steering_routines()
	. = list()
	for(var/datum/ai_dynamic_steering/steering_routine_path as anything in typesof(/datum/ai_dynamic_steering))
	#warn impl

/**
 * dynamic AI holder steering routines
 */
/datum/ai_dynamic_steering
	/// id. this must be unique and is how we're looked up.
	var/id

/datum/ai_dynamic_steering/proc/on_enter(datum/ai_holder/holder)
	return

/datum/ai_dynamic_steering/proc/on_exit(datum/ai_holder/holder)
	return

/**
 * @return ds to reschedule move(), -1 to abort
 */
/datum/ai_dynamic_steering/proc/move(datum/ai_holder/holder, datum/ai_dynamic_steering_context/context)
	. = -1
	CRASH("unimplemented steering function.")
