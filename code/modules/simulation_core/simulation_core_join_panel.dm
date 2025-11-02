//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

/datum/simulation_core_join_panel

/datum/simulation_core_join_panel/ui_interact(mob/user, datum/tgui/ui, datum/tgui/parent_ui)
	. = ..()

/datum/simulation_core_join_panel/ui_data(mob/user, datum/tgui/ui)
	. = ..()

/datum/simulation_core_join_panel/ui_static_data(mob/user, datum/tgui/ui)
	. = ..()

/**
 * Treated as user panel.
 * * Auth is checked; for `is_controller_made` the controller has to be the actor.
 *   For everyone else it has to be themselves.
 */
/datum/simulation_core_join_panel/ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state, datum/event_args/actor/actor)
	. = ..()
	if(.)
		return
	switch(action)
		if("refresh")
		if("join")

#warn impl
