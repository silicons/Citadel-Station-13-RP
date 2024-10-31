//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

/datum/mapgen_terrain_descriptor
	/// our biome string
	var/biome = "unknown"
	/// our turf type
	var/turf_type
	/// mapgen sealed
	///
	/// * this can be set by structures, terrain, spots, etc.
	/// * if this is set, nothing should be painting onto that tile
	/// * this won't stop structures / spots already painted on,
	///   but further layers should not touch the tile.
	var/sealed = FALSE
	/// static sealed descriptor
	var/static/datum/mapgen_terrain_descriptor/SEALED_DESCRIPTOR = new /datum/mapgen_terrain_descriptor/sealed
	/// static baseturf descriptor
	var/static/datum/mapgen_terrain_descriptor/BASETURF_DESCRIPTOR = new /datum/mapgen_terrain_descriptor/baseturf
	/// static descriptor for seal + use baseturf
	var/static/datum/mapgen_terrain_descriptor/SEALED_BASETURF_DESCRIPTOR = /datum/mapgen_terrain_descriptor/baseturf/sealed

/datum/mapgen_terrain_descriptor/proc/realize(turf/location)
	return

#warn impl

/**
 * used if a descriptor doesn't exist, but we want to seal a turf
 */
/datum/mapgen_terrain_descriptor/sealed
	sealed = TRUE

/**
 * used if we just want to flatten an area to the base turf of the level
 */
/datum/mapgen_terrain_descriptor/baseturf
	turf_type = /turf/baseturf_bottom

/**
 * used if we want to flatten an area, and also prevent further mapgen from happening on it
 */
/datum/mapgen_terrain_descriptor/baseturf/sealed
	sealed = TRUE
