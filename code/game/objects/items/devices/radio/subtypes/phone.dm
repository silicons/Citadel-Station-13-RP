
/obj/item/radio/phone
	icon = 'icons/obj/items.dmi'
	icon_state = "red_phone"
	anchored = FALSE
	broadcasting = FALSE
	listening = TRUE
	name = "phone"

/obj/item/radio/phone/medbay
	frequency = FREQ_MEDICAL_INTERNAL

/obj/item/radio/phone/medbay/Initialize(mapload)
	. = ..()
	internal_channels = GLOB.default_medbay_channels.Copy()

//Consolidation from radio_vr.
/obj/item/radio/phone
	subspace_transmission = 1
	canhear_range = 0
	adhoc_fallback = TRUE

/obj/item/radio/phone/laptop
	icon = 'icons/obj/computer.dmi'
	icon_state = "laptop"
	anchored = TRUE
	broadcasting = FALSE
	listening = TRUE
	name = "Occulum Model.2566 Radio Computer"
	desc = "The lastest in technology radio wise : A laptop with a mic, connected to the entertainement frequency."
	frequency = FREQ_ENTERTAINMENT
	anchored = TRUE
	bluespace_radio = TRUE
	can_be_unanchored = TRUE
	canhear_range = 5
	broadcasting = 1
	listening = 0
