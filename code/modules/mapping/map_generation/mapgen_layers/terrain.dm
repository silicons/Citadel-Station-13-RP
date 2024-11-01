//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

/datum/mapgen_layer/terrain
	/// lower left x
	var/ll_x = -INFINITY
	/// lower left y
	var/ll_y = -INFINITY
	/// upper right x
	var/ur_x = INFINITY
	/// upper right y
	var/ur_y = INFINITY

/datum/mapgen_layer/terrain/draw(datum/mapgen_buffer/buffer)
	return
	