//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

/**
 * terrain descriptors
 *
 * * These should never be edited. Make a new one if you want a new one.
 *   They're often shared in many places.
 */
/datum/mapgen_descriptor/terrain
	/// our biome string
	var/biome = "unknown"
	/// our turf type
	///
	/// * if null, we will not set change the underlying turf.
	var/turf_type

/datum/mapgen_descriptor/terrain/baseturf
	turf_type = /turf/baseturf_bottom
