//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

/datum/map_test
	abstract_type = /datum/map_test
	/// our name
	var/name
	/// our desc, if any
	var/desc

	/// supports granularity of level
	/// * will use run_level(z) instead of run()
	var/granular_to_level = FALSE

/**
 * Category required, reason is not.
 */
/datum/map_test/proc/emit_notice(where, category, reason)

/**
 * Category required, reason is not.
 */
/datum/map_test/proc/emit_warn(where, category, reason)

/**
 * Category required, reason is not.
 */
/datum/map_test/proc/emit_fail(where, category, reason)

/datum/map_test/proc/run(list/zlevels)

/datum/map_test/proc/run_level(zlevel)

#warn impl
