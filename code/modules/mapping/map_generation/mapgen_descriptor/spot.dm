//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

/datum/mapgen_descriptor/spot
	/// atom type to spawn
	var/spawn_path
	/// args to pass into `new` if any
	var/list/spawn_args
	/// preview color
	var/preview_color
	/// x offset
	var/x_offset
	/// y offset
	var/y_offset

/datum/mapgen_descriptor/spot/New(spawn_path, x, y, spawn_args, preview_color)
	src.spawn_path = spawn_path
	src.spawn_args = spawn_args
	src.x_offset = x
	src.y_offset = y
	src.preview_color = preview_color

/**
 * Preconditions:
 *
 * * It's been verified the result location of base + offset will be a valid place to spawn.
 *
 * @params
 * * base_x - base x; this is the x - 1 of the lower left corner, e.g. 0, 0 + offset 1 = 1, 1
 * * base_y - base y; this is the y - 1 of the lower left corner, e.g. 0, 0 + offset 1 = 1, 1.
 * * base_z - base z;
 */
/datum/mapgen_descriptor/spot/proc/apply(base_x, base_y, base_z)
	var/turf/location = locate(base_x + x_offset, base_y + y_offset, base_z)
	if(spawn_args)
		new spawn_path(arglist(list(location) + spawn_args))
	else
		new spawn_path(location)
