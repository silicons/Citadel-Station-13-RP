//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

/datum/mapgen_descriptor/terrain
	/// our biome string
	var/biome = "unknown"
	/// our turf type
	///
	/// * if null, we will not set change the underlying turf.
	var/turf_type
