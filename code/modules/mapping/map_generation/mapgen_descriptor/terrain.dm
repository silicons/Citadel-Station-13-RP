//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

GLOBAL_DATUM_INIT(mapgen_terrain_descriptor_sealed, /datum/mapgen_descriptor/terrain, new /datum/mapgen_descriptor/terrain/sealed)
GLOBAL_DATUM_INIT(mapgen_terrain_descriptor_sealed_baseturf, /datum/mapgen_descriptor/terrain, new /datum/mapgen_descriptor/terrain/sealed/baseturf)

/datum/mapgen_descriptor/terrain
	/// our biome string
	var/biome = "unknown"
	/// our turf type
	///
	/// * if null, we will not set change the underlying turf.
	var/turf_type
	/// Sealed - prevent any change to this turf whatsoever.
	///
	/// This has multiple meanings.
	/// * First of all, it means that it is always an illegal operation to edit
	///   this descriptor under any circumstances, admin vv or otherwise.
	/// * Second of all, it means that mapgen layers should not paint onto or clip this turf.
	/// * It is a legal operation to replace a sealed descriptor wholesale with another
	///   descriptor, in that it will not cause bugs. That said, it's not recommended to do so,
	///   as this variable is used to seal off parts of the generation from further edits.
	/// * Implies `structurized`
	var/sealed = FALSE
	/// There's already a structure on here.
	///
	/// * Blocks most mapgen, though you can ignore it if you want.
	var/structurized = FALSE

/datum/mapgen_descriptor/terrain/proc/apply(turf/location)
	if(turf_type)
		location.ChangeTurf(turf_type)

/**
 * used if a descriptor doesn't exist, but we want to seal a turf
 */
/datum/mapgen_descriptor/terrain/sealed
	sealed = TRUE

/**
 * used if we just want to flatten an area to the base turf of the level
 */
/datum/mapgen_descriptor/terrain/sealed/baseturf
	turf_type = /turf/baseturf_bottom
