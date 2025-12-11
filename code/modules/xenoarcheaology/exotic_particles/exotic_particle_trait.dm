//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

/**
 * # Traits
 *
 * Effect-combinations are more for science (or a budding wizard, wink wink) to mess with.
 *
 * Sometimes, however, an item / machine needs to know if a particle has a specific ability to do .. a specific thing.
 *
 * Either that, or, a particle should always do something that we just hard-check for
 * in a projection datum's compile().
 *
 * This is what traits are for.
 */
/datum/exotic_particle_trait
	/// type to register under
	var/tmp/register_type

#warn impl

/datum/exotic_particle_trait/light_emission
	register_type = /datum/exotic_particle_trait/light_emission

	/// this isn't just "can emit light", this is "always emits light"
	var/always_lit = TRUE
	/// color of light
	var/color = "#ffffff"

/**
 * "We can do this"
 */
/datum/exotic_particle_trait/capability
	abstract_type = /datum/exotic_particle_trait/capability

/datum/exotic_particle_trait/capability/electrical_charge

/datum/exotic_particle_trait/capability/electrical_drain

/datum/exotic_particle_trait/capability/electrical_disruption

/datum/exotic_particle_trait/capability/gravity
	register_type = /datum/exotic_particle_trait/capability/gravity
	var/can_attract = FALSE
	var/can_repel = FALSE

/datum/exotic_particle_trait/capability/gravity/attract
	can_attract = TRUE

/datum/exotic_particle_trait/capability/gravity/repel
	can_repel = TRUE

/datum/exotic_particle_trait/capability/gravity/manipulation
	can_attract = TRUE
	can_repel = TRUE

/datum/exotic_particle_trait/capability/physics_ablating

/datum/exotic_particle_trait/capability/physics_1

/datum/exotic_particle_trait/capability/physics_shearing

