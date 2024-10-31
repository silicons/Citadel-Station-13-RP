//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

/**
 * A map generation pattern.
 *
 * Map generation is done in three phases.
 *
 * * Terrain: A requested square is 'painted' with the right turfs, biomes, etc.
 * * Structure: Structure descriptors are 'seeded' as needed.
 * * Spot: Any remaining things like flora, fauna, etc, are placed.
 *
 * All of these are performed on an abstracted datastructure, which is then 'realized'
 * to form a map.
 *
 * ## Biomes
 *
 * Biomes are intentionally not defined, as this lets you define them in your code.
 * That said, these biomes are internally used, and are constant:
 *
 * * 'unknown': for unset
 * * 'ignore': used on anything that is mapgen blocked.
 */
/datum/mapgen_pattern
	/// terrain layers
	var/list/datum/mapgen_layer/mapgen_terrain_layer/terrain_layers = list()
	/// structure layers
	var/list/datum/mapgen_layer/mapgen_structure_layer/structure_layers = list()
	/// spot layers
	var/list/datum/mapgen_layer/mapgen_spot_layer/spot_layers = list()

/datum/mapgen_pattern/proc/generate(base_x = 0, base_y = 0, width = world.maxx, height = world.maxy) as /datum/mapgen_buffer
	var/datum/mapgen_buffer/buffer = new
	buffer.base_x = base_x
	buffer.base_y = base_y
	buffer.width = width
	buffer.height = height

	for(var/datum/mapgen_layer/layer as anything in terrain_layers)
		layer.draw(buffer)
	for(var/datum/mapgen_layer/layer as anything in structure_layers)
		layer.draw(buffer)
	for(var/datum/mapgen_layer/layer as anything in spot_layers)
		layer.draw(buffer)

	return buffer

// vv wrapper
/datum/mapgen_pattern/proc/__debug_generate_chunk(ll_x, ll_y, ur_x, ur_y, z)
	#warn impl

// vv wrapper
/datum/mapgen_pattern/proc/__debug_generate_level(z)
	#warn impl
