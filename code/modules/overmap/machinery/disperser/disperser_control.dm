//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

#warn circuit

/obj/machinery/overmap/disperser_control
	name = "disperser cannon control"
	desc = "A console used to control a disperser cannon."

	/// linked disperser
	var/obj/machinery/overmap/disperser_cannon

#warn impl

/obj/machinery/overmap/disperser_control/ui_interact(mob/user, datum/tgui/ui, datum/tgui/parent_ui)
	ui = SStgui.try_update_ui(src, user, ui)
	if(!ui)
		#warn ui
		ui = new(src, user, "overmap/DisperserCannonContorl")
		ui.open()

/obj/machinery/overmap/disperser_control/ui_act(action, list/params, datum/tgui/ui)
	. = ..()
	if(.)
		return

/obj/machinery/overmap/disperser_control/ui_data(mob/user, datum/tgui/ui)
	. = ..()

/obj/machinery/overmap/disperser_control/ui_static_data(mob/user, datum/tgui/ui)
	. = ..()





