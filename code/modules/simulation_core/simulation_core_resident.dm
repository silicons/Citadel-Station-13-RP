//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

/**
 * Special type for people trapped inside a simulation core organ.
 */
/mob/simulation_core_resident
	/// owning core
	var/datum/simulation_core/owning_core
	/// created by the simulation core's controller?
	/// * this guard is here so you can't accidentally allow control of
	///   another person's character.
	var/is_controller_made = FALSE
	/// can be evicted?
	/// * stuff like mirror capturing generates non-evictable mobs
	/// * considering eviction is just forced ghosting you don't want to enable that for mirrors
	var/allow_eviction = TRUE
	/// can be transferred?
	/// * can be TRUE without allowing eviction, allowing you to simulate viruses
	/// * leave it off for mirror capturing and similar
	var/allow_transfer = TRUE
	/// our active projection render
	var/atom/movable/simulation_core_projection/projection




/mob/simulation_core_resident/Initialize(mapload, datum/simulation_core/core)
	. = ..()
	ASSERT(core)
	owning_core = core

/**
 * Checks if an actor can control us.
 */
/mob/simulation_core_resident/proc/check_control_authorization(datum/event_args/actor/actor)
	if(is_controller_made)
		return owning_core.check_hypervisor_flags(actor) & SIMULATION_CORE_HYPERVISOR_PUPPET
	return actor.initiator == src

/**
 * Checks hypervisor authorization flags.
 */
/mob/simulation_core_resident/proc/check_hypervisor_flags()
	#warn vm escape so cabbage can virus people
	return is_controller_made ? ALL : NONE

/mob/simulation_core_resident/ui_interact(mob/user, datum/tgui/ui, datum/tgui/parent_ui)
	. = ..()

/mob/simulation_core_resident/ui_data(mob/user, datum/tgui/ui)
	. = ..()

/mob/simulation_core_resident/ui_static_data(mob/user, datum/tgui/ui)
	. = ..()

/**
 * Treated as user panel.
 * * Auth is checked; for `is_controller_made` the controller has to be the actor.
 *   For everyone else it has to be themselves.
 */
/mob/simulation_core_resident/ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state, datum/event_args/actor/actor)
	. = ..()
	if(.)
		return
	if(!check_control_authorization(actor))
		return TRUE
	switch(action)
		if("saySim")
		if("emoteSim")
		if("sayProj")
		if("emoteProj")
		if("eraseSelfAndGhost")
		if("setProjecting")
		if("moveProjection")

/**
 * export interface SimulationCoreResidentStatus
 */
/mob/simulation_core_resident/proc/ui_resident_status_data()
	. = list()

#warn impl
