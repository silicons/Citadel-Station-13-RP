//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

/**
 * Particle effects.
 */
/datum/exotic_particle_effect
	/// cares about field edges
	var/hooks_field_edge = FALSE
	/// cares about field turfs
	var/hooks_field = FALSE

#warn impl
#warn lists?

/datum/exotic_particle_effect/proc/potentially_affects(atom/target)
	. = FALSE

/datum/exotic_particle_effect/proc/inflict_for_targeted(atom/target, power, hit_zone)
/datum/exotic_particle_effect/proc/inflict_for_targeted_all(list/atom/targets, power)
	for(var/atom/A as anything in targets)
		inflict_for_targeted(A, power)

/datum/exotic_particle_effect/proc/inflict_for_pulsed(atom/target, turf/from_epicenter, power_per_second, dt)
/datum/exotic_particle_effect/proc/inflict_for_pulsed_all(atom/target, turf/from_epicenter, power_per_second, dt)
	for(var/atom/A as anything in targets)
		inflict_for_pulsed(A, from_epicenter, power_per_second, dt)

/datum/exotic_particle_effect/proc/inflict_for_splashed(atom/target, power, turf/from_epicenter)
/datum/exotic_particle_effect/proc/inflict_for_splashed_all(list/atom/targets, power, turf/from_epicenter)
	for(var/atom/A as anything in targets)
		inflict_for_splashed(A, power, from_epicenter)

/datum/exotic_particle_effect/proc/on_field_turf_add(turf/target, power_density)
/datum/exotic_particle_effect/proc/on_field_turf_remove(turf/target, power_density)
/datum/exotic_particle_effect/proc/on_field_turf_change_intensity(turf/target, old_power_density, new_power_density)

/datum/exotic_particle_effect/proc/on_field_edge_turf_add(turf/target, power_density)
/datum/exotic_particle_effect/proc/on_field_edge_turf_remove(turf/target, power_density)
/datum/exotic_particle_effect/proc/on_field_edge_turf_change_intensity(turf/target, old_power_density, new_power_density)
