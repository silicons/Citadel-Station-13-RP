//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

/**
 * Special type for people trapped inside a simulation core organ.
 */
/mob/simulation_core_resident

	/// created by the simulation core's controller?
	/// * this guard is here so you can't accidentally allow control of
	///   another person's character.
	var/is_controller_made = FALSE
	/// our active projection render
	var/atom/movable/simulation_core_projection/projection

#warn impl
