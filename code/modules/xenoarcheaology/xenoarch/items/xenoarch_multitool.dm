//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

/**
 * AIOT for xenoarch, because making them carry around 4-5 tools is insane.
 *
 * Functions as:
 * * measure for excavation depth
 * * depth scanner for turfs
 * * exotic particle sensor
 */
/obj/item/xenoarch_multitool
	name = "xenoarchaeology multitool"

/obj/item/xenoarch_multitool/using_as_item(atom/target, datum/event_args/actor/clickchain/clickchain, clickchain_flags)
	. = ..()

/obj/item/xenoarch_multitool/ui_interact(mob/user, datum/tgui/ui, datum/tgui/parent_ui)
	. = ..()

/obj/item/xenoarch_multitool/ui_data(mob/user, datum/tgui/ui)
	. = ..()

/obj/item/xenoarch_multitool/ui_static_data(mob/user, datum/tgui/ui)
	. = ..()


/obj/item/xenoarch_multitool/ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state, datum/event_args/actor/actor)
	. = ..()

#warn impl
