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
	/// Captured mirrors associated to their resident, if any.
	var/list/obj/item/implant/mirror/captured_mirrors

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
