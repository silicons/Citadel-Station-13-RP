//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

/**
 * pretty much encapsulates projections hitting a wide area
 */
/datum/exotic_particle_field
	var/datum/exotic_particle_projection/projection

	/**
	 * a list of turfs we applied to, so far, with given power densities
	 */
	var/list/turf/applied_to_strength
	var/turf/epicenter

#warn impl
