/obj/machinery/gbp_bank
	name = "point redemption bank"
	desc = "You shouldn't be seeing this."
	#warn sprite

	/// our network
	var/datum/gbp_network/network
	/// stored points - this is also the list of what points we support. null if we don't store points locally.
	var/list/stored
	/// inserted id
	var/obj/item/card/id/inserted_id

/obj/machinery/gbp_bank/Initialize(mapload)
	init_network()
	return ..()

/obj/machinery/gbp_bank/proc/init_network()
	CRASH("abstract init_network called")

/obj/machinery/gbp_bank/attackby(obj/item/I, mob/living/user, list/params, clickchain_flags, damage_multiplier)
	. = ..()

/obj/machinery/gbp_bank/ui_interact(mob/user, datum/tgui/ui, datum/tgui/parent_ui)
	. = ..()

/obj/machinery/gbp_bank/ui_data(mob/user, datum/tgui/ui, datum/ui_state/state)
	. = ..()

/obj/machinery/gbp_bank/ui_static_data(mob/user, datum/tgui/ui, datum/ui_state/state)
	. = ..()

/obj/machinery/gbp_bank/ui_act(action, list/params, datum/tgui/ui)
	. = ..()

#warn impl all
