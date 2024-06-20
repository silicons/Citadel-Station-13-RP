
/datum/outfit/JSDF/Marine
	name = "JSDF marine"
	uniform = /obj/item/clothing/under/oricon/utility/marine/green
	shoes = /obj/item/clothing/shoes/boots/jackboots
	gloves = /obj/item/clothing/gloves/combat
	l_ear = /obj/item/radio/headset
	r_pocket = /obj/item/ammo_magazine/m95
	l_pocket = /obj/item/ammo_magazine/m95
	l_hand = /obj/item/ammo_magazine/m95
	r_hand = /obj/item/ammo_magazine/m95
	back = /obj/item/gun/ballistic/automatic/battlerifle
	backpack_contents = list(/obj/item/storage/box = 1)
	abstract_type = /datum/outfit/wizard
	head = /obj/item/clothing/head/helmet/combat/JSDF
	suit = /obj/item/clothing/suit/armor/combat/JSDF
	belt = /obj/item/storage/belt/security/tactical

/datum/outfit/JSDF/Marine/equip_id(mob/living/carbon/human/H)
	var/obj/item/card/id/C = ..()
	C.name = "[H?.real_name]'s military ID Card"
	C.icon_state = "lifetime"
	C.assignment = "JSDF"
	C.registered_name = H.real_name
	return C

/datum/outfit/JSDF/Officer
	name = "JSDF officer"
	head = /obj/item/clothing/head/dress/marine/command/admiral
	shoes = /obj/item/clothing/shoes/boots/jackboots
	uniform = /obj/item/clothing/under/oricon/mildress/marine/command
	back = /obj/item/storage/backpack/satchel
	belt = /obj/item/gun/ballistic/revolver/consul
	l_pocket = /obj/item/ammo_magazine/s44
	r_pocket = /obj/item/ammo_magazine/s44
	r_hand = /obj/item/clothing/accessory/holster/hip
	l_hand = /obj/item/clothing/accessory/tie/black

/datum/outfit/JSDF/Officer/equip_id(mob/living/carbon/human/H)
	var/obj/item/card/id/C = ..()
	C.name = "[H.real_name]'s military ID Card"
	C.icon_state = "lifetime"
	C.assignment = "JSDF"
	C.registered_name = H.real_name
	return C

/datum/outfit/oricon/representative
	name = "Confederation Representative"
	shoes = /obj/item/clothing/shoes/laceup
	l_ear = /obj/item/radio/headset/centcom
	uniform = /obj/item/clothing/under/suit_jacket/navy
	back = /obj/item/storage/backpack/satchel
	l_pocket = /obj/item/pen/blue
	r_pocket = /obj/item/pen/red
	r_hand = /obj/item/pda/centcom
	l_hand = /obj/item/clipboard

/datum/outfit/oricon/representative/equip_id(mob/living/carbon/human/H)
	var/obj/item/card/id/C = ..()
	C.name = "[H.real_name]'s OriCon ID Card"
	C.icon_state = "lifetime"
	C.assignment = "OriCon Representative"
	C.registered_name = H.real_name
	return C

/datum/outfit/imperial/soldier
	name = "Imperial soldier"
	head = /obj/item/clothing/head/helmet/combat/imperial
	shoes =/obj/item/clothing/shoes/leg_guard/combat/imperial
	gloves = /obj/item/clothing/gloves/arm_guard/combat/imperial
	l_ear = /obj/item/radio/headset/syndicate
	uniform = /obj/item/clothing/under/imperial
	mask = /obj/item/clothing/mask/gas/imperial
	suit = /obj/item/clothing/suit/armor/combat/imperial
	back = /obj/item/storage/backpack/satchel
	belt = /obj/item/storage/belt/security/tactical/bandolier
	l_pocket = /obj/item/cell/device/weapon
	r_pocket = /obj/item/cell/device/weapon
	r_hand = /obj/item/melee/energy/sword/imperial
	l_hand = /obj/item/shield/energy/imperial
	suit_store = /obj/item/gun/energy/imperial

/datum/outfit/imperial/officer
	name = "Imperial officer"
	head = /obj/item/clothing/head/helmet/combat/imperial/centurion
	shoes = /obj/item/clothing/shoes/leg_guard/combat/imperial
	gloves = /obj/item/clothing/gloves/arm_guard/combat/imperial
	l_ear = /obj/item/radio/headset/syndicate
	uniform = /obj/item/clothing/under/imperial
	mask = /obj/item/clothing/mask/gas/imperial
	suit = /obj/item/clothing/suit/armor/combat/imperial/centurion
	belt = /obj/item/storage/belt/security/tactical/bandolier
	l_pocket = /obj/item/cell/device/weapon
	r_pocket = /obj/item/cell/device/weapon
	r_hand = /obj/item/melee/energy/sword/imperial
	l_hand = /obj/item/shield/energy/imperial
	suit_store = /obj/item/gun/energy/imperial
