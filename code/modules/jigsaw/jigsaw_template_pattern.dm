//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2026 Citadel Station Developers           *//

/**
 * Template patterns.
 *
 * * Each
 */
/datum/jigsaw_template_pattern
	var/override_tile_cost = null

/**
 * Returns a potentially-cached pattern.
 */
/datum/jigsaw_template_pattern/proc/get_pattern() as /datum/jigsaw_pattern
	return new /datum/jigsaw_pattern(0, 0, override_tile_cost)

/**
 * rect bounding box over the template. the template is lower-left
 * aligned to this box.
 *
 * * width / height is in alignment multiples
 * * this is for 'south' facing orientation.
 */
/datum/jigsaw_template_pattern/rect
	abstract_type = /datum/jigsaw_template_pattern/rect

	/**
	 * * This is in alignment multiples, not tiles.
	 */
	var/width
	/**
	 * * This is in alignment multiples, not tiles.
	 */
	var/height

/datum/jigsaw_template_pattern/rect/get_pattern()
	var/datum/jigsaw_pattern/pattern = new(width, height, override_tile_cost)
	return pattern

/datum/jigsaw_template_pattern/rect/s_1x1
	width = 1
	height = 1

	var/list/south_match
	var/list/south_require
	var/list/south_exclude

	var/list/north_match
	var/list/north_require
	var/list/north_exclude

	var/list/east_match
	var/list/east_require
	var/list/east_exclude

	var/list/west_match
	var/list/west_require
	var/list/west_exclude

/datum/jigsaw_template_pattern/rect/s_1x1/get_pattern()
	var/datum/jigsaw_pattern/pattern = ..()

	var/datum/jigsaw_tile/tile = new
	tile.north_exclude = north_exclude
	tile.north_require = north_require
	tile.north_match = north_match
	tile.south_exclude = south_exclude
	tile.south_require = south_require
	tile.south_match = south_match
	tile.east_exclude = east_exclude
	tile.east_require = east_require
	tile.east_match = east_match
	tile.west_exclude = west_exclude
	tile.west_require = west_require
	tile.west_match = west_match

	pattern.pattern[1] = tile

	return pattern

/datum/jigsaw_template_pattern/rect/s_2x2
	width = 2
	height = 2

	var/list/south_match
	var/list/south_require
	var/list/south_exclude
	var/list/south_left_match
	var/list/south_left_require
	var/list/south_left_exclude
	var/list/south_right_match
	var/list/south_right_require
	var/list/south_right_exclude

	var/list/north_match
	var/list/north_require
	var/list/north_exclude
	var/list/north_left_match
	var/list/north_left_require
	var/list/north_left_exclude
	var/list/north_right_match
	var/list/north_right_require
	var/list/north_right_exclude

	var/list/east_match
	var/list/east_require
	var/list/east_exclude
	var/list/east_top_match
	var/list/east_top_require
	var/list/east_top_exclude
	var/list/east_bottom_match
	var/list/east_bottom_require
	var/list/east_bottom_exclude

	var/list/west_match
	var/list/west_require
	var/list/west_exclude
	var/list/west_top_match
	var/list/west_top_require
	var/list/west_top_exclude
	var/list/west_bottom_match
	var/list/west_bottom_require
	var/list/west_bottom_exclude


/datum/jigsaw_template_pattern/rect/s_2x2/get_pattern()
	var/datum/jigsaw_pattern/pattern = ..()

	var/datum/jigsaw_tile/tile

	// top left
	tile = new
	tile.north_exclude = north_left_exclude || north_exclude
	tile.north_require = north_left_require || north_require
	tile.north_match = north_left_match || north_match
	tile.west_exclude = west_top_exclude || west_exclude
	tile.west_require = west_top_require || west_require
	tile.west_match = west_top_match || west_match

	pattern.pattern[3] = tile

	// top right
	tile = new
	tile.north_exclude = north_right_exclude || north_exclude
	tile.north_require = north_right_require || north_require
	tile.north_match = north_right_match || north_match
	tile.east_exclude = east_top_exclude || east_exclude
	tile.east_require = east_top_require || east_require
	tile.east_match = east_top_match || east_match

	pattern.pattern[4] = tile

	// bottom left
	tile = new
	tile.south_exclude = south_left_exclude || south_exclude
	tile.south_require = south_left_require || south_require
	tile.south_match = south_left_match || south_match
	tile.west_exclude = west_bottom_exclude || west_exclude
	tile.west_require = west_bottom_require || west_require
	tile.west_match = west_bottom_match || west_match

	pattern.pattern[1] = tile

	// bottom right
	tile = new
	tile.south_exclude = south_right_exclude || south_exclude
	tile.south_require = south_right_require || south_require
	tile.south_match = south_right_match || south_match
	tile.east_exclude = east_bottom_exclude || east_exclude
	tile.east_require = east_bottom_require || east_require
	tile.east_match = east_bottom_match || east_match

	pattern.pattern[2] = tile

	return pattern

/datum/jigsaw_template_pattern/rect/s_3x3
	width = 3
	height = 3

	var/list/south_match
	var/list/south_require
	var/list/south_exclude
	var/list/south_left_match
	var/list/south_left_require
	var/list/south_left_exclude
	var/list/south_middle_match
	var/list/south_middle_require
	var/list/south_middle_exclude
	var/list/south_right_match
	var/list/south_right_require
	var/list/south_right_exclude

	var/list/north_match
	var/list/north_require
	var/list/north_exclude
	var/list/north_left_match
	var/list/north_left_require
	var/list/north_left_exclude
	var/list/north_middle_match
	var/list/north_middle_require
	var/list/north_middle_exclude
	var/list/north_right_match
	var/list/north_right_require
	var/list/north_right_exclude

	var/list/east_match
	var/list/east_require
	var/list/east_exclude
	var/list/east_top_match
	var/list/east_top_require
	var/list/east_top_exclude
	var/list/east_middle_match
	var/list/east_middle_require
	var/list/east_middle_exclude
	var/list/east_bottom_match
	var/list/east_bottom_require
	var/list/east_bottom_exclude

	var/list/west_match
	var/list/west_require
	var/list/west_exclude
	var/list/west_top_match
	var/list/west_top_require
	var/list/west_top_exclude
	var/list/west_middle_match
	var/list/west_middle_require
	var/list/west_middle_exclude
	var/list/west_bottom_match
	var/list/west_bottom_require
	var/list/west_bottom_exclude

/datum/jigsaw_template_pattern/rect/s_3x3/get_pattern()
	var/datum/jigsaw_pattern/pattern = ..()

	var/datum/jigsaw_tile/tile

	// bottom left
	tile = new
	tile.south_exclude = south_left_exclude || south_exclude
	tile.south_require = south_left_require || south_require
	tile.south_match = south_left_match || south_match
	tile.west_exclude = west_bottom_exclude || west_exclude
	tile.west_require = west_bottom_require || west_require
	tile.west_match = west_bottom_match || west_match

	pattern.pattern[(1 - 1) + 1] = tile

	// bottom middle
	tile = new
	tile.south_exclude = south_middle_exclude || south_exclude
	tile.south_require = south_middle_require || south_require
	tile.south_match = south_middle_match || south_match

	pattern.pattern[(1 - 1) + 2] = tile

	// bottom right
	tile = new
	tile.south_exclude = south_right_exclude || south_exclude
	tile.south_require = south_right_require || south_require
	tile.south_match = south_right_match || south_match
	tile.east_exclude = east_bottom_exclude || east_exclude
	tile.east_require = east_bottom_require || east_require
	tile.east_match = east_bottom_match || east_match

	pattern.pattern[(1 - 1) + 3] = tile

	// middle left
	tile = new
	tile.west_exclude = west_middle_exclude || west_exclude
	tile.west_require = west_middle_require || west_require
	tile.west_match = west_middle_match || west_match

	pattern.pattern[(2 - 1) + 1] = tile

	// middle middle
	tile = new

	pattern.pattern[(2 - 1) + 2] = tile

	// middle right
	tile = new
	tile.east_exclude = east_middle_exclude || east_exclude
	tile.east_require = east_middle_require || east_require
	tile.east_match = east_middle_match || east_match

	pattern.pattern[(2 - 1) + 3] = tile

	// top left
	tile = new
	tile.north_exclude = north_left_exclude || north_exclude
	tile.north_require = north_left_require || north_require
	tile.north_match = north_left_match || north_match
	tile.west_exclude = west_top_exclude || west_exclude
	tile.west_require = west_top_require || west_require
	tile.west_match = west_top_match || west_match

	pattern.pattern[(3 - 1) + 1] = tile

	// top middle
	tile = new
	tile.north_exclude = north_middle_exclude || north_exclude
	tile.north_require = north_middle_require || north_require
	tile.north_match = north_middle_match || north_match

	pattern.pattern[(3 - 1) + 2] = tile

	// top right
	tile = new
	tile.north_exclude = north_right_exclude || north_exclude
	tile.north_require = north_right_require || north_require
	tile.north_match = north_right_match || north_match
	tile.east_exclude = east_top_exclude || east_exclude
	tile.east_require = east_top_require || east_require
	tile.east_match = east_top_match || east_match

	pattern.pattern[(3 - 1) + 3] = tile

	return pattern

