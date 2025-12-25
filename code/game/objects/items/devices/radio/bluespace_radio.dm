//Pathfinder's Subspace Radio
/obj/item/bluespace_radio
	name = "subspace radio"
	desc = "A powerful new radio originally gifted to Nanotrasen from Ward Takahashi. Immensely expensive, this communications device has the ability to send and recieve transmissions from anywhere."
	catalogue_data = list()///datum/category_item/catalogue/information/organization/ward_takahashi)
	icon = 'icons/vore/custom_items_vr.dmi'
	icon_override = 'icons/mob/clothing/back.dmi'
	icon_state = "radiopack"
	item_state = "radiopack"
	slot_flags = SLOT_BACK
	damage_force = 5
	throw_force = 6
	preserve_item = 1
	w_class = WEIGHT_CLASS_BULKY
	item_action_name = "Remove/Replace Handset"

	var/obj/item/radio/bluespace_handset/linked/handset = /obj/item/radio/bluespace_handset/linked

/obj/item/bluespace_radio/Initialize(Mapload) //starts without a cell for rnd
	. = ..()
	handset = new(src, src)

/obj/item/bluespace_radio/Destroy()
	. = ..()
	QDEL_NULL(handset)

/obj/item/bluespace_radio/ui_action_click(datum/action/action, datum/event_args/actor/actor)
	toggle_handset()

/obj/item/bluespace_radio/attack_hand(mob/user, datum/event_args/actor/clickchain/e_args)
	if(loc == user)
		toggle_handset()
	else
		..()

/obj/item/bluespace_radio/OnMouseDropLegacy()
	if(ismob(loc))
		if(!CanMouseDrop(src))
			return
		var/mob/M = loc
		add_fingerprint(usr)
		M.put_in_hands(src)

/obj/item/bluespace_radio/attackby(obj/item/W, mob/user, params)
	if(W == handset)
		reattach_handset(user)
	else
		return ..()

/obj/item/bluespace_radio/verb/toggle_handset()
	set name = "Toggle Handset"
	set category = VERB_CATEGORY_OBJECT

	var/mob/living/carbon/human/user = usr
	if(!handset)
		to_chat(user, "<span class='warning'>The handset is missing!</span>")
		return

	if(handset.loc != src)
		reattach_handset(user) //Remove from their hands and back onto the defib unit
		return

	if(!slot_check())
		to_chat(user, "<span class='warning'>You need to equip [src] before taking out [handset].</span>")
	else
		if(!usr.put_in_hands(handset)) //Detach the handset into the user's hands
			to_chat(user, "<span class='warning'>You need a free hand to hold the handset!</span>")
		update_icon() //success

//checks that the base unit is in the correct slot to be used
/obj/item/bluespace_radio/proc/slot_check()
	var/mob/M = loc
	if(!istype(M))
		return 0 //not equipped

	if((slot_flags & SLOT_BACK) && M.item_by_slot_id(SLOT_ID_BACK) == src)
		return 1
	if((slot_flags & SLOT_BACK) && M.item_by_slot_id(SLOT_ID_SUIT_STORAGE) == src)
		return 1

	return 0

/obj/item/bluespace_radio/dropped(mob/user, flags, atom/newLoc)
	. = ..()
	reattach_handset(user) //handset attached to a base unit should never exist outside of their base unit or the mob equipping the base unit

/obj/item/bluespace_radio/proc/reattach_handset(mob/user)
	if(!handset)
		return

	if(ismob(handset.loc))
		to_chat(handset.loc, "<span class='notice'>\The [handset] snaps back into the main unit.</span>")
	handset.forceMove(src)

//Subspace Radio Handset
/obj/item/radio/bluespace_handset
	name = "subspace radio handset"
	desc = "A large walkie talkie attached to the subspace radio by a retractable cord. It sits comfortably on a slot in the radio when not in use."
	bluespace_radio = TRUE
	icon_state = "signaller"
	slot_flags = null
	w_class = WEIGHT_CLASS_BULKY

/obj/item/radio/bluespace_handset/linked
	var/obj/item/bluespace_radio/base_unit
	bs_tx_preload_id = "Receiver A"  //Transmit to a receiver
	bs_rx_preload_id = "Broadcaster A"  //Recveive from a transmitter

/obj/item/radio/bluespace_handset/linked/Initialize(mapload, obj/item/bluespace_radio/radio)
	base_unit = radio
	return ..(mapload)

/obj/item/radio/bluespace_handset/linked/Destroy()
	if(base_unit)
		//ensure the base unit's icon updates
		if(base_unit.handset == src)
			base_unit.handset = null
		base_unit = null
	return ..()

/obj/item/radio/bluespace_handset/linked/dropped(mob/user, flags, atom/newLoc)
	. = ..() //update twohanding
	if(base_unit)
		base_unit.reattach_handset(user) //handset attached to a base unit should never exist outside of their base unit or the mob equipping the base unit

/obj/item/bluespace_radio/talon_prelinked
	name = "bluespace radio (talon)"
	handset = /obj/item/radio/bluespace_handset/linked/talon_prelinked

/obj/item/radio/bluespace_handset/linked/talon_prelinked
/* // Commenting out for now while Talon is not in use
	bs_tx_preload_id = "talon_aio" //Transmit to a receiver
	bs_rx_preload_id = "talon_aio" //Recveive from a transmitter
*/
/obj/item/bluespace_radio/commerce
	name = "commercial subspace radio"
	desc = "Immensely expensive, this communications device has the ability to send and recieve transmissions from anywhere. Only a few of these devices have been sold by either Ward Takahashi or Nanotrasen. This device is incredibly rare and mind-numbingly expensive. Do not lose it."

/obj/item/bluespace_radio/sdf
	name = "sdf subspace radio"
	desc = "Immensely expensive, this communications device has the ability to send and recieve transmissions from anywhere. Only a few of these devices have been sold by either Ward Takahashi or Nanotrasen. This device is incredibly rare and mind-numbingly expensive. Do not lose it."
