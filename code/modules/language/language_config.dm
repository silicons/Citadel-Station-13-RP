//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

/datum/language_config
	/// defualt language id
	var/default_id
	///

#warn impl all

/datum/language_config/ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state, datum/event_args/actor/actor)
	. = ..()

/datum/language_config/ui_interact(mob/user, datum/tgui/ui, datum/tgui/parent_ui)
	. = ..()

/datum/language_config/ui_data(mob/user, datum/tgui/ui)
	. = ..()

/datum/language_config/ui_static_data(mob/user, datum/tgui/ui)
	. = ..()

