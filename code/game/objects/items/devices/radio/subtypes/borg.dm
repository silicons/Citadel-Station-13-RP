//Giving borgs their own radio to have some more room to work with -Sieve

/obj/item/radio/borg
	var/mob/living/silicon/robot/myborg = null // Cyborg which owns this radio. Used for power checks
	var/obj/item/encryptionkey/keyslot = null//Borg radios can handle a single encryption key
	icon = 'icons/obj/robot_component.dmi' // Cyborgs radio icons should look like the component.
	icon_state = "radio"
	canhear_range = 0
	subspace_transmission = TRUE
	subspace_switchable = TRUE

/obj/item/radio/borg/Destroy()
	myborg = null
	return ..()

/obj/item/radio/borg/list_channels(var/mob/user)
	return list_secure_channels(user)

/obj/item/radio/borg/talk_into()
	. = ..()
	if (isrobot(src.loc))
		var/mob/living/silicon/robot/R = src.loc
		var/datum/robot_component/C = R.components["radio"]
		R.cell_use_power(C.active_usage)

/obj/item/radio/borg/attackby(obj/item/I, mob/living/user, params, clickchain_flags, damage_multiplier)
	user.set_machine(src)
	if (!(I.is_screwdriver() || istype(I, /obj/item/encryptionkey)))
		return ..()

	if(I.is_screwdriver())
		. = CLICKCHAIN_DO_NOT_PROPAGATE
		if(keyslot)
			for(var/ch_name in channels)
				radio_controller.remove_object(src, radiochannels[ch_name])
				secure_radio_connections[ch_name] = null


			if(keyslot)
				var/turf/T = get_turf(user)
				if(T)
					keyslot.forceMove(T)
					keyslot = null

			recalculateChannels()
			to_chat(user, "You pop out the encryption key in the radio!")
			playsound(src, I.tool_sound, 50, 1)

		else
			to_chat(user, "This radio doesn't have any encryption keys!")

	if(istype(I, /obj/item/encryptionkey))
		. = CLICKCHAIN_DO_NOT_PROPAGATE
		if(keyslot)
			to_chat(user, "The radio can't hold another key!")
			return
		if(!user.attempt_insert_item_for_installation(I, src))
			return
		keyslot = I
		recalculateChannels()

/obj/item/radio/borg/recalculateChannels()
	src.channels = list()

	var/mob/living/silicon/robot/D = src.loc
	if(D.module)
		for(var/ch_name in D.module.channels)
			if(ch_name in src.channels)
				continue
			src.channels += ch_name
			src.channels[ch_name] += D.module.channels[ch_name]
	if(keyslot)
		for(var/ch_name in keyslot.channels)
			if(ch_name in src.channels)
				continue
			src.channels += ch_name
			src.channels[ch_name] += keyslot.channels[ch_name]

	for (var/ch_name in src.channels)
		if(!radio_controller)
			src.name = "CONTACT CODERS: NO RADIO CONTROLLER"
			return

		secure_radio_connections[ch_name] = radio_controller.add_object(src, radiochannels[ch_name],  RADIO_CHAT)

	return
