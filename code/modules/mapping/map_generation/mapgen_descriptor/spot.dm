//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

/**
 * A spot descriptor. It does something to a spot. Pretty simple, really.
 */
/datum/mapgen_descriptor/spot
	/// preview color
	var/preview_color
	/// x offset
	var/x_offset
	/// y offset
	var/y_offset

/datum/mapgen_descriptor/spot/New(x, y, preview_color)
	src.x_offset = x
	src.y_offset = y
	src.preview_color = preview_color

/**
 * * the actual location will be base_x + x_offset.
 * * the actual location does not necessarily exist. this is to support
 *   partially clipping world bounds with spot descriptors that affect a radius
 *   or something similar.
 *
 * @params
 * * base_x - base x; this is the x - 1 of the lower left corner, e.g. 0, 0 + offset 1 = 1, 1
 * * base_y - base y; this is the y - 1 of the lower left corner, e.g. 0, 0 + offset 1 = 1, 1.
 * * base_z - base z;
 */
/datum/mapgen_descriptor/spot/proc/apply(base_x, base_y, base_z)
	return

/**
 * Spawns an entity.
 */
/datum/mapgen_descriptor/spot/entity
	/// atom type to spawn
	var/spawn_path
	/// args to pass into `new` if any
	var/list/spawn_args

/datum/mapgen_descriptor/spot/entity/New(x, y, preview_color, spawn_path, spawn_args)
	..(x, y, preview_color)
	src.spawn_path = spawn_path
	src.spawn_args = spawn_args

/datum/mapgen_descriptor/spot/entity/apply(base_x, base_y, base_z)
	var/turf/location = locate(base_x + x_offset, base_y + y_offset, base_z)
	if(!location)
		return
	if(spawn_args)
		new spawn_path(arglist(list(location) + spawn_args))
	else
		new spawn_path(location)
