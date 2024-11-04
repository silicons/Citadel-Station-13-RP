//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

/**
 * Fills the area in with flat terrain. Simple enough.
 */
/datum/mapgen_layer/fill/flat_block
	name = "Block: Fill Terrain"

	var/turf_type
	var/biome_type

/datum/mapgen_layer/fill/flat_block/draw(datum/mapgen_buffer/buffer)
	if(turf_type)
		if(biome_type)
			buffer.fill_terrain(ll_x, ll_y, ur_x, ur_y, turf_type, biome_type)
		else
			buffer.fill_turf(ll_x, ll_y, ur_x, ur_y, turf_type)
	else if(biome_type)
		buffer.fill_biome(ll_x, ll_y, ur_x, ur_y, biome_type)
