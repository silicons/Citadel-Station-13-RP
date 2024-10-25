//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers          *//

/datum/exotic_tile_projection/line
	/// source tile
	var/turf/starting
	/// direction of travel
	var/dir
	/// width in tiles
	///
	/// * if this is an even number, we will always left-align our starting tile;
	///   e.g. 2 is starting + one to its right relative to the direction of travel,
	///   and 4 is starting + one to its left + 2 to its right, relative to the direction
	///   of travel.
	var/width = 1
	/// propagation speed, ds per turf towards direction of travel
	var/main_axis_delay = 0
	/// propagation speed, outwards per turf perpendicular of from direction of travel
	var/cross_axis_delay = 0

#warn impl
