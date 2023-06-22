/**
 * overmaps peripherals system
 * machinery that auto-links with their overmap entity
 */
/obj/machinery/ship

	//* overmap linkage
	/// overmap entity
	var/obj/overmap/entity/overmap_entity
	/// overmap ship
	var/datum/ship/overmap_ship

	//* control
	/// default control flags needed to control this machine
	var/ship_control_flags = NONE
	/// allow control columns to access this
	var/wireless_enabled = FALSE
	/// allow wireless at all (as opposed to toggleable/cuttable)
	var/wireless_capable = FALSE

	//* ui
	/// ui key
	var/tgui_key = "OvermapGeneric"


#warn impl all


/obj/machinery/ship/ui_data(mob/user, datum/tgui/ui, datum/ui_state/state)
	. = ..()

/obj/machinery/ship/ui_static_data(mob/user, datum/tgui/ui, datum/ui_state/state)
	. = ..()

/obj/machinery/ship/ui_act(action, list/params, datum/tgui/ui)
	. = ..()

/obj/machinery/ship/ui_state(mob/user, datum/tgui_module/module)
	. = ..()

/obj/machinery/ship/ui_status(mob/user)
	. = ..()

