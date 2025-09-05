//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station developers.          *//

/datum/ai_dynamic_steering

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
