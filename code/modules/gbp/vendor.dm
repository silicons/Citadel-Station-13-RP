/obj/machinery/gbp_vendor
	name = "point redemption vendor"
	desc = "You shouldn't be seeing this."
	#warn sprite

	/// our linked network, if any
	var/datum/gbp_network/network
	/// inserted id
	var/obj/item/card/id/inserted_id

/obj/machinery/gbp_vendor/Initailize(mapload)
	init_network()
	return ..()

/obj/machinery/gbp_vendor/proc/init_network()
	CRASH("abstract init_network called")

/obj/machinery/gbp_vendor/attackby(obj/item/I, mob/living/user, list/params, clickchain_flags, damage_multiplier)
	. = ..()

/obj/machinery/gbp_vendor/ui_interact(mob/user, datum/tgui/ui, datum/tgui/parent_ui)
	. = ..()

/obj/machinery/gbp_vendor/ui_data(mob/user, datum/tgui/ui, datum/ui_state/state)
	. = ..()

/obj/machinery/gbp_vendor/ui_static_data(mob/user, datum/tgui/ui, datum/ui_state/state)
	. = ..()

/obj/machinery/gbp_vendor/ui_act(action, list/params, datum/tgui/ui)
	. = ..()

#warn impl all
