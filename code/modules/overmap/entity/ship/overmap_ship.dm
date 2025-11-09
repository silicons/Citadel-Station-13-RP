//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

/datum/overmap_ship

	/// ui updates pushed to these
	var/list/obj/machinery/overmap/console/ship_controls/consoles
	var/list/obj/machinery/overmap/peripheral/peripherals
	var/list/obj/machinery/overmap/peripheral/engine/p_engines

#warn impl

/datum/overmap_ship/ui_interact(mob/user, datum/tgui/ui, datum/tgui/parent_ui)
	. = ..()

/datum/overmap_ship/ui_state(mob/user)
	. = ..()

/datum/overmap_ship/ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state, datum/event_args/actor/actor)
	. = ..()

/datum/overmap_ship/ui_static_data(mob/user, datum/tgui/ui)
	. = ..()

/datum/overmap_ship/ui_data(mob/user, datum/tgui/ui)
	. = ..()
