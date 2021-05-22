/mob/living/silicon/robot/Login()
	..()
	regenerate_icons()
	update_hud()

	show_laws(0)

	// Forces synths to select an icon relevant to their module
	if(!icon_selected)
		choose_icon(icon_selection_tries, module_sprites)
	plane_holder.set_vis(VIS_AUGMENTED, TRUE) //VOREStation Add - ROBOT VISION IS AUGMENTED
