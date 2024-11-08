//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

/**
 * Holds state and manages an energy shield.
 */
/datum/energy_shield_controller
	/// instance datum
	var/datum/energy_shield_instance/shield_instance
	/// shield segments
	var/list/obj/effect/energy_shield/shield_segments

/datum/energy_shield_controller/New()

/datum/energy_shield_controller/Destroy()
	cleanup()
	return ..()

/**
 * Sets a projection.
 */
/datum/energy_shield_controller/proc/set_projection(datum/energy_shield_projection/projection)

/**
 * Offsets us in a relative manner.
 */
/datum/energy_shield_controller/proc/offset_relative(x_offset, y_offset)

#warn impl
