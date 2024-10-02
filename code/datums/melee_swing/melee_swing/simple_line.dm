//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

/**
 * A weapon that swings in a line away from the user.
 *
 * * The weapon's reach becomes the line's distance.
 */
/datum/melee_swing/simple_line
	/// width of line, in pixels.
	var/pixel_width = 32
	/// length of line
	///
	/// * null to default to an item's reach, or WORLD_ICON_SIZE if that doesn't exist.
	var/pixel_length
	/// does the swing start from the mob?
	///
	/// * if it does, and pixel width is 33 to 96, we will hit our sides as well.
	var/start_on_top_of_attacker = FALSE

#warn impl
