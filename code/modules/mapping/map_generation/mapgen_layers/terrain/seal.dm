//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

/**
 * Seal an area
 */
/datum/mapgen_layer/terrain/seal
	name = "terrain - seal"

/datum/mapgen_layer/terrain/seal/draw(datum/mapgen_buffer/buffer)
	buffer.terrain_seal(ll_x, ll_y, ur_x, ur_y)
