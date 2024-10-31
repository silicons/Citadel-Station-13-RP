//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

/datum/mapgen_layer/mapgen_terrain_layer
	/// lower left x
	var/ll_x
	/// lower left y
	var/ll_y
	/// upper right x
	var/ur_x
	/// upper right y
	var/ur_y

/datum/mapgen_layer/mapgen_terrain_layer/New(ll_x = -INFINITY, ll_y = -INFINITY, ur_x = INFINITY, ur_y = INFINITY)
	src.ll_x = ll_x
	src.ll_y = ll_y
	src.ur_x = ur_x
	src.ur_y = ur_y

/datum/mapgen_layer/mapgen_terrain_layer/draw(datum/mapgen_buffer/buffer)
	SHOULD_NOT_OVERRIDE(TRUE)

	#warn call paint_terrain

/datum/mapgen_layer/mapgen_terrain_layer/proc/paint_terrain(datum/mapgen_buffer/buffer, ll_x, ll_y, ur_x, ur_y, width, height)
	CRASH("unimplemented proc called")
