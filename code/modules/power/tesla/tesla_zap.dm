//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

/**
 * new tesla_zap - il vento d'orifto
 *
 * old tesla_zap didn't support proper anti-rebound, and we all know
 * that electricity doesn't just go back and forth on the same wire! teehee!!
 *
 * TODO: this should be on SSspatial_effects or something namespaced
 *
 * @params
 * * source - atom to start from
 * * initiation - initiation struct
 *
 * @return /datum/event_args/tesla_zap_result
 */
/proc/tesla_zap_new(atom/movable/source, datum/event_args/tesla_zap_initiation/initiation)
	var/datum/event_args/tesla_zap/zap_struct = new
	zap_struct.init_fresh(initiation)
	spawn(0)
		tesla_zap_propagate(source, zap_struct)
	// intentionally here to fail linters if something expects us not to sleep.
	// in the future, this will be a blocking call as gathering results is blocking
	// if yo need async tesla_zap, put it behind an async block or use a timer!
	sleep(0)
	return new /datum/event_args/tesla_zap_result

/proc/tesla_zap_propagate(atom/movable/current, datum/event_args/tesla_zap/zap_struct)
	SHOULD_NOT_SLEEP(TRUE)
	#warn impl

/proc/tesla_zap_reemit(atom/movable/source, datum/event_args/tesla_zap/zap_struct, delay)
	SHOULD_NOT_SLEEP(TRUE)
	#warn vfx
	addtimer(CALLBACK(GLOBAL_PROC, tesla_zap_propagate, source, zap_struct), delay)
