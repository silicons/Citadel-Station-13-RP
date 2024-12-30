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

/datum/map_test/proc/fail(turf/location, reason)

/datum/map_test/proc/run(list/zlevels)

/datum/map_test/proc/run_level(zlevel)

#warn impl
