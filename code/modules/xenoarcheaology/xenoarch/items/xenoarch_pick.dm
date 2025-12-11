//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

/obj/item/xenoarch_pick


	var/dig_amount = 0

/obj/item/xenoarch_pick/using_as_item(atom/target, datum/event_args/actor/clickchain/clickchain, clickchain_flags)
	. = ..()


/obj/item/xenoarch_pick/fixed_1cm

/obj/item/xenoarch_pick/fixed_2cm

/obj/item/xenoarch_pick/fixed_4cm

/obj/item/xenoarch_pick/fixed_6cm

/obj/item/xenoarch_pick/fixed_8cm

/obj/item/xenoarch_pick/fixed_10cm

/obj/item/xenoarch_pick/fixed_12cm

/obj/item/xenoarch_pick/fixed_30cm

/obj/item/xenoarch_pick/drill

/obj/item/xenoarch_pick/drill/ui_interact(mob/user, datum/tgui/ui, datum/tgui/parent_ui)
	. = ..()

/obj/item/xenoarch_pick/drill/ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state, datum/event_args/actor/actor)
	. = ..()

/obj/item/xenoarch_pick/drill/ui_data(mob/user, datum/tgui/ui)
	. = ..()


#warn impl
