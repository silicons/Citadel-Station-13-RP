
#warn medbay_emergency
/obj/item/radio/emergency
	name = "Medbay Emergency Radio Link"
	icon_state = "med_walkietalkie"
	frequency = FREQ_MEDICAL_INTERNAL
	subspace_transmission = 1
	adhoc_fallback = TRUE

/obj/item/radio/emergency/Initialize(mapload)
	. = ..()
	internal_channels = GLOB.default_medbay_channels.Copy()

