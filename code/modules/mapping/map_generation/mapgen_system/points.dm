//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

/**
 * Generates a number of points with a given level seed, and x/y tuple.
 *
 * * base_x and base_y are 1 left/down of 1,1; this is 0, 0 for 1, 1.
 */
/proc/mapgen_system_generate_points(level_seed, base_x, base_y, width, height, average_point_count)
	var/effective_seed = "[level_seed]-[base_x]-[base_y]"
	var/datum/ext_rand/random = new(effective_seed)

#warn impl
