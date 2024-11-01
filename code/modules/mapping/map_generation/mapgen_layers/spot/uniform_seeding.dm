//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

/**
 * Places an uniform number of objects in an area, ignoring structures
 */
/datum/mapgen_layer/spot/uniform_seeding
	/// lower left x
	var/ll_x = -INFINITY
	/// lower left y
	var/ll_y = -INFINITY
	/// upper right x
	var/ur_x = INFINITY
	/// upper right y
	var/ur_y = INFINITY

	/// allow placing in structures
	var/ignore_structures = FALSE
	/// what to spawn
	///
	/// can be:
	/// * an atom typepath
	/// * a list of atom typepaths
	/// * a mapgen_entity_draw datum or typepath
	var/datum/mapgen_entity_draw/entity_provider
	#warn preprocess into mapgen entity draw



#warn impl
