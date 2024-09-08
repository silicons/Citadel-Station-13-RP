/obj/item/clothing/suit/armor/pcarrier
	name = "plate carrier"
	desc = "A lightweight black plate carrier vest with built-in spall guard. It can be equipped with armor plates, but provides no protection of its own."
	icon = 'icons/obj/clothing/modular_armor.dmi'
	item_icons = list(SLOT_ID_SUIT = 'icons/mob/clothing/modular_armor.dmi')
	icon_state = "pcarrier"
	valid_accessory_slots = (\
		ACCESSORY_SLOT_OVER \
		|ACCESSORY_SLOT_INSIGNIA \
		|ACCESSORY_SLOT_ARMOR_C \
		|ACCESSORY_SLOT_ARMOR_A \
		|ACCESSORY_SLOT_ARMOR_L \
		|ACCESSORY_SLOT_ARMOR_S \
		|ACCESSORY_SLOT_ARMOR_M
		)
	restricted_accessory_slots = (\
		ACCESSORY_SLOT_OVER \
		|ACCESSORY_SLOT_INSIGNIA \
		|ACCESSORY_SLOT_ARMOR_C \
		|ACCESSORY_SLOT_ARMOR_A \
		|ACCESSORY_SLOT_ARMOR_L \
		|ACCESSORY_SLOT_ARMOR_S \
		|ACCESSORY_SLOT_ARMOR_M
		)
	blood_overlay_type = "armor"

/obj/item/clothing/suit/armor/pcarrier/can_equip(mob/M, slot, mob/user, flags)
	. = ..()
	if(!.)
		return

	if(!ishuman(M))
		return

	var/mob/living/carbon/human/H = M

	if(H.gloves)
		if(H.gloves.body_cover_flags & ARMS)
			for(var/obj/item/clothing/accessory/A in src)
				if(A.body_cover_flags & ARMS)
					to_chat(H, "<span class='warning'>You can't wear \the [A] with \the [H.gloves], they're in the way.</span>")
					return FALSE
	if(H.shoes)
		if(H.shoes.body_cover_flags & LEGS)
			for(var/obj/item/clothing/accessory/A in src)
				if(A.body_cover_flags & LEGS)
					to_chat(H, "<span class='warning'>You can't wear \the [A] with \the [H.shoes], they're in the way.</span>")
					return FALSE
	return TRUE

/obj/item/clothing/suit/armor/pcarrier/alt
	desc = "A lightweight black plate carrier vest with built-in spall guard. It can be equipped with armor plates, but provides no protection of its own. This one has less material at the waist, making it more practical for belt-worn equipment."
	icon_state = "pcarrier_alt"

/obj/item/clothing/suit/armor/pcarrier/light
	starting_accessories = list(/obj/item/clothing/accessory/armor/armorplate)

/obj/item/clothing/suit/armor/pcarrier/light/sol
	starting_accessories = list(/obj/item/clothing/accessory/armor/armorplate, /obj/item/clothing/accessory/armor/tag)

/obj/item/clothing/suit/armor/pcarrier/light/nts
	starting_accessories = list(/obj/item/clothing/accessory/armor/armorplate, /obj/item/clothing/accessory/armor/tag/nts)

/obj/item/clothing/suit/armor/pcarrier/light/ntbs
	starting_accessories = list(/obj/item/clothing/accessory/armor/armorplate, /obj/item/clothing/accessory/armor/tag/ntbs)

/obj/item/clothing/suit/armor/pcarrier/light/ntc
	starting_accessories = list(/obj/item/clothing/accessory/armor/armorplate, /obj/item/clothing/accessory/armor/tag/ntc)

/obj/item/clothing/suit/armor/pcarrier/medium
	starting_accessories = list(/obj/item/clothing/accessory/armor/armorplate/medium, /obj/item/clothing/accessory/storage/pouches)

/obj/item/clothing/suit/armor/pcarrier/medium/sol
	starting_accessories = list(/obj/item/clothing/accessory/armor/armorplate/medium, /obj/item/clothing/accessory/storage/pouches, /obj/item/clothing/accessory/armor/tag)

/obj/item/clothing/suit/armor/pcarrier/medium/civsec
	starting_accessories = list(/obj/item/clothing/accessory/armor/armorplate/medium, /obj/item/clothing/accessory/storage/pouches, /obj/item/clothing/accessory/armor/tag/civsec)

/obj/item/clothing/suit/armor/pcarrier/medium/command
	starting_accessories = list(/obj/item/clothing/accessory/armor/armorplate/medium, /obj/item/clothing/accessory/storage/pouches, /obj/item/clothing/accessory/armor/tag/com)

/obj/item/clothing/suit/armor/pcarrier/medium/nts
	starting_accessories = list(/obj/item/clothing/accessory/armor/armorplate/medium, /obj/item/clothing/accessory/storage/pouches, /obj/item/clothing/accessory/armor/tag/nts)

/obj/item/clothing/suit/armor/pcarrier/medium/ntc
	starting_accessories = list(/obj/item/clothing/accessory/armor/armorplate/medium, /obj/item/clothing/accessory/storage/pouches, /obj/item/clothing/accessory/armor/tag/ntc)

/obj/item/clothing/suit/armor/pcarrier/blue
	name = "blue plate carrier"
	desc = "A lightweight blue plate carrier vest with built-in spall guard. It can be equipped with armor plates, but provides no protection of its own."
	icon_state = "pcarrier_blue"

/obj/item/clothing/suit/armor/pcarrier/press
	name = "light blue plate carrier"
	desc = "A lightweight, light blue plate carrier vest with built-in spall guard. It can be equipped with armor plates, but provides no protection of its own."
	icon_state = "pcarrier_press"

/obj/item/clothing/suit/armor/pcarrier/blue/sol
	name = "peacekeeper plate carrier"
	desc = "A lightweight plate carrier vest with built-in spall guard. This one is in SCG Peacekeeper colors. It can be equipped with armor plates, but provides no protection of its own."
	starting_accessories = list(/obj/item/clothing/accessory/armor/armorplate/medium, /obj/item/clothing/accessory/storage/pouches/blue, /obj/item/clothing/accessory/armor/armguards/blue, /obj/item/clothing/accessory/armor/tag)

/obj/item/clothing/suit/armor/pcarrier/green
	name = "green plate carrier"
	desc = "A lightweight green plate carrier vest with built-in spall guard. It can be equipped with armor plates, but provides no protection of its own."
	icon_state = "pcarrier_green"

/obj/item/clothing/suit/armor/pcarrier/navy
	name = "navy plate carrier"
	desc = "A lightweight navy blue plate carrier vest with built-in spall guard. It can be equipped with armor plates, but provides no protection of its own."
	icon_state = "pcarrier_navy"

/obj/item/clothing/suit/armor/pcarrier/tan
	name = "tan plate carrier"
	desc = "A lightweight tan plate carrier vest with built-in spall guard. It can be equipped with armor plates, but provides no protection of its own."
	icon_state = "pcarrier_tan"

/obj/item/clothing/suit/armor/pcarrier/tan/tactical
	name = "tactical plate carrier"
	starting_accessories = list(/obj/item/clothing/accessory/armor/armorplate/tactical, /obj/item/clothing/accessory/storage/pouches/large/tan)

/obj/item/clothing/suit/armor/pcarrier/combat
	starting_accessories = list(/obj/item/clothing/accessory/armor/armorplate/combat, /obj/item/clothing/accessory/storage/pouches/large)

//Brig Spec Variants
/obj/item/clothing/suit/armor/pcarrier/ballistic
	name = "ballistic plate carrier"
	desc = "A lightweight ballistic vest. Equipped with a ballistic armor plate by default, this armor consists of a kevlar weave augmented by a non-Newtonian gel layer."
	starting_accessories = list(/obj/item/clothing/accessory/armor/armorplate/ballistic)

/obj/item/clothing/suit/armor/pcarrier/ablative
	name = "ablative plate carrier"
	desc = "A lightweight deflector vest. Equipped with an ablative armor plate by default, this armor consists of a polished Cartesian Glance Plating and an inset network of heat sink channels."
	icon_state = "ablative"
	starting_accessories = list(/obj/item/clothing/accessory/armor/armorplate/ablative)

/obj/item/clothing/suit/armor/pcarrier/riot
	name = "riot suppression plate carrier"
	desc = "A lightweight padded vest. Equipped with a padded armor plate by default, this armor consists of a stab resistant kevlar weave and hardened fleximat padding."
	icon_state = "riot"
	starting_accessories = list(/obj/item/clothing/accessory/armor/armorplate/riot)

//Clown Op Carrier
/obj/item/clothing/suit/armor/pcarrier/clownop
	name = "clown commando plate carrier"
	desc = "A lightweight red and white plate carrier vest with built-in spall guard. It can be equipped with armor plates, but provides no protection of its own. Honk."
	icon_state = "clowncarrier"
	starting_accessories = list(/obj/item/clothing/accessory/armor/armorplate/medium)
