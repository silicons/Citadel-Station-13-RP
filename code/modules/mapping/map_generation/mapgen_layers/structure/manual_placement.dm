//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

/**
 * Places map tempaltes in specific locations.
 */
/datum/mapgen_layer/structure/manual_placement
	/// list of list(x, y, dir = SOUTH) = map template typepath, or instance
	///
	/// * third entry in list is optional; defaults to SOUTH otherwise
	/// * x, y are lower left x, y of 1, 1 on the map template.
	/// * cropping a tempalte is not currently supported.
	var/list/placements

/datum/mapgen_layer/structure/manual_placement/draw(datum/mapgen_buffer/buffer)

#warn impl
