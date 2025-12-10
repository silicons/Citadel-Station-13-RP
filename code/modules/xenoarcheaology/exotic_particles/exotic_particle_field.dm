//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

/**
 * pretty much encapsulates projections hitting a wide area
 */
/datum/exotic_particle_field
	var/datum/exotic_particle_projection/projection

	/// associated to applied power
	var/list/turf/edge_turfs
	/// associated to applied power
	var/list/turf/turfs

	var/turf/epicenter

#warn impl

/datum/exotic_particle_field/proc/set_epicenter(turf/new_epicenter)

/datum/exotic_particle_field/proc/on_epicenter_changed(turf/old_epicenter, turf/new_epicenter)

/datum/exotic_particle_field/proc/set_edge_turfs(list/turf/turfs)

/datum/exotic_particle_field/proc/change_field_turfs(list/turf/added, list/turf/removed)

/datum/exotic_particle_field/proc/set_field_turfs(list/turf/turfs)


/datum/exotic_particle_field/flat_rectangular

/datum/exotic_particle_field/falloff_rectangular

/datum/exotic_particle_field/flat_circular

/datum/exotic_particle_field/falloff_circular



