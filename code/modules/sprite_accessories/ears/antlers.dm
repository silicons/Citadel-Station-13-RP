/datum/sprite_accessory/ears/antlers
	abstract_type = /datum/sprite_accessory/ears/antlers
	icon = 'icons/mob/sprite_accessories/ears/antlers.dmi'
	category = "Antlers"

/datum/sprite_accessory/ears/antlers/crown
	name = "Antlers (crown)"
	id = "ears_antlers_crown"
	icon_state = "antlercrown"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/ears/antlers/normal
	name = "Antlers"
	id = "ears_antlers"
	icon_state = "antlers"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/ears/antlers/ears
	name = "Antlers (with ears)"
	id = "ears_antlers_nohorns"
	icon_state = "cow-nohorns"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "antlers_mark"

/datum/sprite_accessory/ears/antlers/large
	name = "Antlers (large)"
	id = "ears_antlers_large"
	icon = 'icons/mob/sprite_accessories/ears/64x32.dmi'
	icon_state = "antlers_large"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
