//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

/**
 * Dynamic disperser cannon.
 * * Nanotrasen will try to convince you it's not a naval gun, but, really, it is.
 * * This is a standalone entity on purpose, to make it annoying to use
 *   as a ship weapon.
 */
/obj/machinery/overmap/disperser_cannon
	name = "disperser cannon"
	desc = "A mass driver used to launch specialized shells. In the name of science, of-course."

	/// firing velocity base in distance / second
	var/firing_velocity = OVERMAP_PIXEL_TO_DIST(WORLD_ICON_SIZE * 3)
	/// firing velocity multiplier in overmap speed
	var/firing_velocity_mult = 1

#warn impl
#warn firing anim time is 28 frames
