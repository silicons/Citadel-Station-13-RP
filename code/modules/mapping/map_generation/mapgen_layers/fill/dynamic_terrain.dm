//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

/**
 * Generic terrain fill.
 *
 * Uses ordered values lists generated from /datum/mapgen_dynamic_terrain.
 */
/datum/mapgen_layer/fill/dynamic_terrain
	/// dynamic terrain layers
	///
	/// * typepaths are allowed
	/// * anonymous types are allowed
	var/list/datum/mapgen_dynamic_terrain/dynamic_layers = list()
	/// lockstepped thresholds
	///
	/// * a value is from the last value up to the next value
	/// * this means that a list(1) will be "-INFINITY to 1"
	/// * this will always be 1 shorter than `lockstepped_descriptors` as the last value
	///   of descriptors is for the last threshold to `INFINITY`.
	var/list/terrain_thresholds = list()
	/// lockstepped descriptors
	var/list/datum/mapgen_descriptor/terrain/terrain_descriptors = list(
		/datum/mapgen_descriptor/terrain/baseturf,
	)

/datum/mapgen_layer/fill/dynamic_terrain/ready()
	. = ..()
	if(!.)
		return
	if(length(terrain_descriptors) != (length(terrain_thresholds) + 1))
		CRASH("descriptors was not 1 more than thresholds.")
	#warn impl

/datum/mapgen_layer/fill/dynamic_terrain/draw(datum/mapgen_buffer/buffer)
	var/width = ur_x - ll_x + 1
	var/height = ur_y - ll_y + 1
	var/offset_x = ll_x - 1
	var/offset_y = ll_y - 1
	var/list/terrain_values = make_terrain_grid(width, height)
	var/list/terrain_thresholds = src.terrain_thresholds.Copy()
	// covers the last one
	terrain_thresholds += -INFINITY
	var/list/terrain_descriptors = src.terrain_descriptors
	var/terrain_options = length(terrain_thresholds)

	for(var/x in 1 to width)
		for(var/y in 1 to height)
			var/t_value = terrain_values[x + (y - 1) * width]

			var/datum/mapgen_descriptor/terrain/descriptor
			for(var/i in 1 to terrain_options)
				if(t_value >= terrain_thresholds[i])
					descriptor = terrain_descriptors[i]
					break

			var/buf_x = x + offset_x
			var/buf_y = y + offset_y
			buffer.generate_terrain[buf_x + (buf_y - 1) * width] = descriptor

/datum/mapgen_layer/fill/dynamic_terrain/proc/make_terrain_grid(width, height)
	var/list/terrain_numbers = new /list(width * height)
	for(var/datum/mapgen_dynamic_terrain/terrain_layer as anything in dynamic_layers)
		terrain_layer.paint(terrain_numbers, width, height)
	return terrain_numbers
