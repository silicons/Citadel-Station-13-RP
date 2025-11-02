//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

/**
 * simulation core datum
 * * binds to an entity.
 */
/datum/simulation_core
	/// bound entity, if any
	var/atom/movable/bound

	var/allow_resident_see_outside = TRUE
	var/allow_resident_hear_outside = TRUE

	var/allow_join_from_ghost = FALSE

	/// Residents
	var/list/mob/simulation_core_resident/residents
	/// Interior
	var/datum/simulation_core_interior/interior

	/// Perspective used for people inside
	var/datum/perspective/using_perspective

#warn impl

/datum/simulation_core/ui_interact(mob/user, datum/tgui/ui, datum/tgui/parent_ui)
	. = ..()

/datum/simulation_core/ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state, datum/event_args/actor/actor)
	. = ..()

/datum/simulation_core/ui_data(mob/user, datum/tgui/ui)
	. = ..()

/datum/simulation_core/ui_static_data(mob/user, datum/tgui/ui)
	. = ..()

/**
 * export interface SimulationCoreJoinable{}
 */
/datum/simulation_core/proc/ui_simulation_joinable_data()
	. = list()

#warn impl

/datum/simulation_core/proc/check_projection_distance(atom/movable/simulation_core_projection/projection)

/**
 * Checks hypervisor authorization flags.
 */
/datum/simulation_core/proc/check_hypervisor_flags(datum/event_args/actor/actor)
	#warn vm escape so cabbage can virus people
	if(istype(actor.performer, /mob/simulation_core_resident))
		var/mob/simulation_core_resident/resident = actor.performer
		return resident.check_hypervisor_flags()
	#warn impl

/datum/simulation_core/proc/update_perspective()

/datum/simulation_core/proc/get_perspective()

/datum/simulation_core/proc/set_perspective(datum/perspective/perspective)

