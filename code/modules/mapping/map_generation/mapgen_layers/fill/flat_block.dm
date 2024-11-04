//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

/**
 * Fills the area in with flat terrain. Simple enough.
 */
/datum/mapgen_layer/fill/flat_block
	name = "Block: Fill Terrain"

	var/turf_type
	var/biome

/datum/mapgen_layer/fill/flat_block/draw(datum/mapgen_buffer/buffer)
	var/datum/mapgen_descriptor/terrain/descriptor = new
	descriptor.biome = biome_type
	descriptor.turf_type = turf_type

	var/width = ur_x - ll_x + 1
	var/height = ur_y - ll_y + 1
	var/offset_x = ll_x - 1
	var/offset_y = ll_y - 1
	for(var/x in 1 to width)
		for(var/y in 1 to height)
			buffer.generate_terrain[(x + offset_x) + ((y + offset_y) - 1) * width] = descriptor
