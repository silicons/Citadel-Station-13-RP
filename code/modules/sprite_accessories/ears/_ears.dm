/datum/sprite_accessory/ears
	abstract_type = /datum/sprite_accessory/ears
	name = "You should not see this..."
	icon = 'icons/mob/sprite_accessories/ears.dmi'
	do_colouration = 0 // Set to 1 to blend (ICON_ADD) hair color

	color_blend_mode = ICON_ADD // Only appliciable if do_coloration = 1
	var/extra_overlay // Icon state of an additional overlay to blend in.
	var/extra_overlay2
	var/desc = "You should not see this..."
