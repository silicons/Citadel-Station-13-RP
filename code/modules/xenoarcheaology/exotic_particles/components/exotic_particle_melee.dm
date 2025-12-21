//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

/**
 * Simple example component. Affects things hit in melee.
 */
/datum/component/exotic_particle_melee

#warn impl

/datum/component/exotic_particle_melee/hardcoded_projection
	var/datum/exotic_particle_projection/projection

/datum/component/exotic_particle_melee/hardcoded_projection/Initialize(datum/exotic_particle_projection/projection, power)

/datum/component/exotic_particle_melee/via_battery

/datum/component/exotic_particle_melee/via_battery/Initialize(datum/callback/fetch_battery)

