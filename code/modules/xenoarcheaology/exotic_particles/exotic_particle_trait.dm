//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

/**
 * # Traits
 *
 * Effect-combinations are more for science (or a budding wizard, wink wink) to mess with.
 *
 * Sometimes, however, an item / machine needs to know if a particle has a specific ability to do .. a specific thing.
 *
 * This is what traits are for.
 */
/datum/exotic_particle_trait
	/// type to register under
	var/tmp/register_type

#warn impl

/datum/exotic_particle_trait/electrical_charge

/datum/exotic_particle_trait/electrical_drain

/datum/exotic_particle_trait/electrical_disruption

/datum/exotic_particle_trait/gravity
	register_type = /datum/exotic_particle_trait/gravity
	var/can_attract = FALSE
	var/can_repel = FALSE

/datum/exotic_particle_trait/gravity/attract
	can_attract = TRUE

/datum/exotic_particle_trait/gravity/repel
	can_repel = TRUE

/datum/exotic_particle_trait/gravity/manipulation
	can_attract = TRUE
	can_repel = TRUE

/datum/exotic_particle_trait/light_emission
	register_type = /datum/exotic_particle_trait/light_emission
