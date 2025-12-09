//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

/**
 * A compiled projection of an exotic particle and its effects,
 * for fast execution.
 *
 * * Careful observers may note that these don't actually care about bindings.
 *   This is intentional, as bindings are actually a lie that is artificially added
 *   to pretend science has a job.
 */
/datum/exotic_particle_projection
	/// set to typepath or ID to initialize.
	var/datum/prototype/exotic_particle/use_particle
	/// set to list of effects to initialize.
	/// * typepaths, anonymous types, are all valid.
	var/list/datum/exotic_particle_effect/use_effects

#warn impl

/**
 * for cases like;
 * * melee attacks
 * * hit by beam
 */
/datum/exotic_particle_projection/proc/run_for_targeted(atom/target, power, hit_zone)

/datum/exotic_particle_projection/proc/inflict_for_targeted(atom/target, power, hit_zone)

/**
 * for cases like;
 * * burst on a field
 * * splash from a grenade
 *
 * ## notes
 * * do not use `from_epicenter` to calculate falloff; it has been done for you.
 */
/datum/exotic_particle_projection/proc/run_for_splashed(atom/target, power, turf/from_epicenter)

/datum/exotic_particle_projection/proc/inflict_for_splashed(atom/target, power, turf/from_epicenter)

/**
 * for cases like;
 * * continuous application from a field
 *
 * ## notes
 * * do not use `from_epicenter` to calculate falloff; it has been done for you.
 */
/datum/exotic_particle_projection/proc/run_for_pulsed(atom/target, turf/from_epicenter, power_per_second, dt)

/datum/exotic_particle_projection/proc/inflict_for_pulsed(atom/target, turf/from_epicenter, power_per_second, dt)

/**
 * * called before on_field_turf_change_intensity
 */
/datum/exotic_particle_projection/proc/on_field_turf_add(turf/target)

/**
 * * called before on_field_turf_change_intensity
 */
/datum/exotic_particle_projection/proc/on_field_turf_remove(turf/target)

/datum/exotic_particle_projection/proc/on_field_turf_change_intensity(turf/target, old_power_density, new_power_density)

/datum/exotic_particle_projection/proc/on_field_turf_tick(turf/target, power_density)

#warn impl
