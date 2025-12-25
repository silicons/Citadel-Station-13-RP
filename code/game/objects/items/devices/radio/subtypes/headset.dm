/obj/item/radio/headset
	name = "radio headset"
	desc = "An updated, modular intercom that fits over the head. Takes encryption keys"
	var/radio_desc = ""
	icon_state = "headset"
	item_state = null	// To remove the radio's state
	materials_base = list(MAT_STEEL = 75)
	subspace_transmission = 1
	canhear_range = 0	// Can't hear headsets from very far away
	slot_flags = SLOT_EARS

	//* encryption keys *//

	/// inserted radio keys
	/// * set to list of typepaths to init
	/// * lazy list
	var/list/obj/item/radio_key/radio_keys
	/// max radio keys
	var/radio_keys_max = 3

	// legacy below
	#warn below

	var/translate_binary = 0
	var/ear_protection = 0	// Flashbang Protection... I know.

	drop_sound = 'sound/items/drop/component.ogg'
	pickup_sound = 'sound/items/pickup/component.ogg'

/obj/item/radio/headset/Initialize(mapload)
	. = ..()
	internal_channels.Cut()
	if(ks1type)
		keyslot1 = new ks1type(src)
	if(ks2type)
		keyslot2 = new ks2type(src)
	recalculateChannels(1)

/obj/item/radio/headset/Destroy()
	qdel(keyslot1)
	qdel(keyslot2)
	keyslot1 = null
	keyslot2 = null
	return ..()

/obj/item/radio/headset/list_channels(var/mob/user)
	return list_secure_channels()

/obj/item/radio/headset/examine(mob/user, dist)
	. = ..()
	if(!radio_desc)
		return

	. += "The following channels are available:"
	. += radio_desc

/obj/item/radio/headset/handle_message_mode(mob/living/M as mob, message, channel)
	if (channel == "special")
		if (translate_binary)
			var/datum/prototype/language/binary = RSlanguages.fetch(LANGUAGE_ID_SILICON_BINARY)
			binary.broadcast(M, message)
		return null

	return ..()

/obj/item/radio/headset/receive_range(freq, level, aiOverride = 0)
	if (aiOverride)
		return ..(freq, level)
	if(ishuman(src.loc))
		var/mob/living/carbon/human/H = src.loc
		if(H.l_ear == src || H.r_ear == src)
			return ..(freq, level)
	else if(ismob(loc))
		return ..(freq, level)
	return -1

/obj/item/radio/headset/ui_state()
	return GLOB.inventory_state

/obj/item/radio/headset/attackby(obj/item/W as obj, mob/user as mob)
//	..()
	user.set_machine(src)
	if(!(W.is_screwdriver() || istype(W, /obj/item/encryptionkey)))
		return

	if(W.is_screwdriver())
		if(keyslot1 || keyslot2)


			for(var/ch_name in channels)
				radio_controller.remove_object(src, radiochannels[ch_name])
				secure_radio_connections[ch_name] = null


			if(keyslot1)
				var/turf/T = get_turf(user)
				if(T)
					keyslot1.forceMove(T)
					keyslot1 = null



			if(keyslot2)
				var/turf/T = get_turf(user)
				if(T)
					keyslot2.forceMove(T)
					keyslot2 = null

			recalculateChannels()
			to_chat(user, "You pop out the encryption keys in the headset!")
			playsound(src, W.tool_sound, 50, 1)

		else
			to_chat(user, "This headset doesn't have any encryption keys!  How useless...")

	if(istype(W, /obj/item/encryptionkey/))
		if(keyslot1 && keyslot2)
			to_chat(user, "The headset can't hold another key!")
			return
		if(!user.attempt_insert_item_for_installation(W, src))
			return
		if(!keyslot1)
			keyslot1 = W
		else
			keyslot2 = W

		recalculateChannels()

/obj/item/radio/headset/recalculateChannels(var/setDescription = 0)
	src.channels = list()
	src.translate_binary = 0
	src.translate_hive = 0
	src.syndie = 0

	if(keyslot1)
		for(var/ch_name in keyslot1.channels)
			if(ch_name in src.channels)
				continue
			src.channels += ch_name
			src.channels[ch_name] = keyslot1.channels[ch_name]

		if(keyslot1.translate_binary)
			src.translate_binary = 1
	if(keyslot2)
		for(var/ch_name in keyslot2.channels)
			if(ch_name in src.channels)
				continue
			src.channels += ch_name
			src.channels[ch_name] = keyslot2.channels[ch_name]

		if(keyslot2.translate_binary)
			src.translate_binary = 1
	for (var/ch_name in channels)
		secure_radio_connections[ch_name] = radio_controller.add_object(src, radiochannels[ch_name],  RADIO_CHAT)

	if(setDescription)
		setupRadioDescription()

/obj/item/radio/headset/proc/setupRadioDescription()
	var/radio_text = ""
	for(var/i = 1 to channels.len)
		var/channel = channels[i]
		var/key = get_radio_key_from_channel(channel)
		radio_text += "[key] - [channel]"
		if(i != channels.len)
			radio_text += ", "

	radio_desc = radio_text

#warn above

/obj/item/radio/headset/compute_available_frequencies()
	. = ..()

/obj/item/radio/headset/proc/user_insert_radio_key(obj/item/encryptionkey/key, datum/event_args/actor/actor, silent)

/obj/item/radio/headset/proc/user_remove_radio_key(obj/item/encryptionkey/key, datum/event_args/actor/actor, silent, put_in_hands = TRUE)

/obj/item/radio/headset/proc/insert_radio_key(obj/item/encryptionkey/key, datum/event_args/actor/actor, silent)

/obj/item/radio/headset/proc/remove_radio_key(obj/item/encryptionkey/key, datum/event_args/actor/actor, silent, atom/new_loc)

/obj/item/radio/headset/proc/on_radio_key_inserted(obj/item/encryptionkey/key, datum/event_args/actor/actor, silent)

/obj/item/radio/headset/proc/on_radio_key_removed(obj/item/encryptionkey/key, datum/event_args/actor/actor, silent)

#warn impl all
