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
	/// our active projection render
	var/atom/movable/simulation_core_projection/projection

/mob/simulation_core_resident/Initialize(mapload, datum/simulation_core/core)
	. = ..()
	ASSERT(core)
	owning_core = core

/mob/simulation_core_resident/proc/check_control_authorization(datum/event_args/actor/actor)
	#warn impl

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


#warn impl
