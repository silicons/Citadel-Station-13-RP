//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers          *//

/**
 * projection handlers for exotic particles
 *
 * todo: this is somewhat inefficient since we make new datums even for single targets
 * todo: proper ticker subsystem; we currently just use timers, that's not great at all!!
 */
/datum/exotic_projection

/datum/exotic_projection/proc/initialize(...)
	return TRUE

#warn impl
