/obj/item/clothing/accessory/armor/armorplate
	name = "light armor plate"
	desc = "A lightweight armor plate made of tightly woven polyethylene filaments with a thick coating of steel covering the surface. Designed to catch projectiles instead of outright stop, it functions best against low-power weapons of any type. Fits within a plate carrier."
	icon_state = "armor_light"
	body_cover_flags = UPPER_TORSO|LOWER_TORSO
	armor_type = /datum/armor/station/light
	slot = ACCESSORY_SLOT_ARMOR_C

/obj/item/clothing/accessory/armorplate/get_fibers()
	return null	//Plates do not shed

/obj/item/clothing/accessory/armor/armorplate/stab
	name = "stab vest insert"
	desc = "A synthetic mesh armor insert made of densely woven aromatic polyamide fibers and coated in a layer of malleable ballistic gelatin. Great for dealing with anything from small blades to large clubs. Fits within a plate carrier."
	icon_state = "armor_stab"
	armor_type = /datum/armor/station/stab

/obj/item/clothing/accessory/armor/armorplate/medium
	name = "medium armor plate"
	desc = "An armor plate composed of a single sheet of polyethylene-reinforced steel, and a layer of ceramic at the front and back. It provides good protection with a focus on powerful ballistics. Fits within a plate carrier."
	icon_state = "armor_medium"
	armor_type = /datum/armor/station/medium

/obj/item/clothing/accessory/armor/armorplate/mediumtreated
	name = "treated medium armor plate"
	desc = "An armor plate of steel with ceramic layering treated with a highly reflective cobalt-chromium-tungsten alloy. Provides good protection with a focus on laser absorption. Fits within a plate carrier."
	icon_state = "armor_medium_treated"
	armor_type = /datum/armor/station/mediumtreated

/obj/item/clothing/accessory/armor/armorplate/heavy
	name = "strong armor plate"
	desc = "A strong silicon carbide armor plate sporting a polyurethane elastomeric coating to mitigate spalling from lower calibers as they're deflected. It provides excellent protection against ballistics. Fits within a plate carrier."
	icon_state = "armor_heavy"
	armor_type = /datum/armor/station/heavy

/obj/item/clothing/accessory/armor/armorplate/tactical
	name = "tactical armor plate"
	desc = "An armor plate designed for variety in the wilderness, this steel plate has a tight jacket of polyethylene filaments, and is coated in a reflective cobalt-chromium alloy. Bullet, laser, or animal, this plate can handle all of it evenly. Fits within a plate carrier."
	icon_state = "armor_tactical"
	armor_type = /datum/armor/station/tactical

/obj/item/clothing/accessory/armor/armorplate/combat
	name = "combat armor plate"
	desc = "A hardened steel armor plate, providing solid protection from ballistics and lasers. Suitable for combat with firearms of any type, but offers minimal protection from hand to hand.  Fits within a plate carrier."
	icon_state = "armor_combat"
	armor_type = /datum/armor/station/combat

/obj/item/clothing/accessory/armor/armorplate/ballistic
	name = "ballistic armor plate"
	desc = "A hefty silicon carbide armor plate with a layer of heavy tungsten, followed by a second coating of a polyurethane elastomeric to mitigate spalling from lower calibers as they're deflected. It's design is state of of the art when it comes to ballistics, and as a concequence the material is rather heavy, and is not as capable of dispersing laser fire as other armor varients. Fits within a plate carrier."
	icon_state = "armor_ballistic"
	weight = ITEM_WEIGHT_ARMOR_SPECIALIZED
	encumbrance = ITEM_ENCUMBRANCE_ARMOR_SPECIALIZED
	armor_type = /datum/armor/station/ballistic

/obj/item/clothing/accessory/armor/armorplate/riot
	name = "riot armor plate"
	desc = "A synthetic mesh armor insert made of densely woven aromatic polyamide fibers, coated in malleable ballistic gelatin, and finally tight-jacketed with woven steel-polyethylene filaments. This provides excellent protection against low-velocity trauma, but most modern projectiles could tear through it with ease. Fits within a plate carrier."
	icon_state = "armor_riot"
	weight = ITEM_WEIGHT_ARMOR_SPECIALIZED
	encumbrance = ITEM_ENCUMBRANCE_ARMOR_SPECIALIZED
	armor_type = /datum/armor/station/riot
	siemens_coefficient = 0.5

/obj/item/clothing/accessory/armor/armorplate/ablative
	name = "ablative armor plate"
	desc = "A highly reflective cobalt-chromium-tungsten alloy forms the seemingly jagged surface of the armor plate, which is adorned in perfectly cut and fitted glass prisms that form a smooth low-poly surface. When the ablative armor plate is working as designed, the glass prisms reflect laser fire inwards towards the innermost vertex for subsequent 'ablation', and sometimes reflection. There is a warning label on the back that warns you. It reads: Attempting to use this ablative armor plate to deflect ballistics and/or non-standard energy beams could result in 'rapid deconstruction' of the armor plate and its user. Fits within a plate carrier."
	icon_state = "armor_ablative"
	weight = ITEM_WEIGHT_ARMOR_SPECIALIZED
	encumbrance = ITEM_ENCUMBRANCE_ARMOR_SPECIALIZED
	armor_type = /datum/armor/station/ablative
	siemens_coefficient = 0.2

/obj/item/clothing/accessory/armor/armorplate/ablative/handle_shield(mob/user, var/damage, atom/damage_source = null, mob/attacker = null, var/def_zone = null, var/attack_text = "the attack")
	if(istype(damage_source, /obj/projectile/energy) || istype(damage_source, /obj/projectile/beam))
		var/obj/projectile/P = damage_source

		if(P.reflected)
			return ..()

		var/reflectchance = 20 - round(damage/3)
		if(!(def_zone in list(BP_TORSO, BP_GROIN)))
			reflectchance /= 2
		if(P.starting && prob(reflectchance))
			visible_message("<span class='danger'>\The [user]'s [src.name] reflects [attack_text]!</span>")


			var/new_x = P.starting.x + pick(0, 0, 0, 0, 0, -1, 1, -2, 2)
			var/new_y = P.starting.y + pick(0, 0, 0, 0, 0, -1, 1, -2, 2)
			var/turf/curloc = get_turf(user)

			P.redirect(new_x, new_y, curloc, user)
			P.reflected = 1

			return PROJECTILE_CONTINUE

//////////////
//Arm guards
//////////////
/obj/item/clothing/accessory/armor/armguards
	name = "arm guards"
	desc = "A pair of black arm pads reinforced with armor plating. Attaches to a plate carrier."
//	accessory_icons = list(slot_tie_str = 'icons/mob/clothing/modular_armor.dmi', SLOT_ID_SUIT = 'icons/mob/clothing/modular_armor.dmi')
	icon_state = "armguards"
	gender = PLURAL
	body_cover_flags = ARMS
	armor_type = /datum/armor/station/medium
	slot = ACCESSORY_SLOT_ARMOR_A

/obj/item/clothing/accessory/armor/armguards/blue
	desc = "A pair of blue arm pads reinforced with armor plating. Attaches to a plate carrier."
	icon_state = "armguards_blue"

/obj/item/clothing/accessory/armor/armguards/navy
	desc = "A pair of navy blue arm pads reinforced with armor plating. Attaches to a plate carrier."
	icon_state = "armguards_navy"

/obj/item/clothing/accessory/armor/armguards/green
	desc = "A pair of green arm pads reinforced with armor plating. Attaches to a plate carrier."
	icon_state = "armguards_green"

/obj/item/clothing/accessory/armor/armguards/tan
	desc = "A pair of tan arm pads reinforced with armor plating. Attaches to a plate carrier."
	icon_state = "armguards_tan"

/obj/item/clothing/accessory/armor/armguards/combat
	name = "heavy arm guards"
	desc = "A pair of red-trimmed black arm pads reinforced with heavy armor plating. Attaches to a plate carrier."
	icon_state = "armguards_combat"
	armor_type = /datum/armor/station/combat

/obj/item/clothing/accessory/armor/armguards/ablative
	name = "ablative arm guards"
	desc = "These arm guards will protect your arms from energy weapons."
	icon_state = "armguards_ablative"
	item_state_slots = list(SLOT_ID_RIGHT_HAND = "swat", SLOT_ID_LEFT_HAND = "swat")
	siemens_coefficient = 0.4 //This is worse than the other ablative pieces, to avoid this from becoming the poor warden's insulated gloves.
	armor_type = /datum/armor/station/ablative

/obj/item/clothing/accessory/armor/armguards/ballistic
	name = "ballistic arm guards"
	desc = "These arm guards will protect your arms from ballistic weapons."
	icon_state = "armguards_ballistic"
	item_state_slots = list(SLOT_ID_RIGHT_HAND = "swat", SLOT_ID_LEFT_HAND = "swat")
	siemens_coefficient = 0.7
	armor_type = /datum/armor/station/ballistic

/obj/item/clothing/accessory/armor/armguards/riot
	name = "riot arm guards"
	desc = "These arm guards will protect your arms from close combat weapons."
	icon_state = "armguards_riot"
	item_state_slots = list(SLOT_ID_RIGHT_HAND = "swat", SLOT_ID_LEFT_HAND = "swat")
	siemens_coefficient = 0.5
	armor_type = /datum/armor/station/riot

//////////////
//Leg guards
//////////////
/obj/item/clothing/accessory/armor/legguards
	name = "leg guards"
	desc = "A pair of armored leg pads in black. Attaches to a plate carrier."
//	accessory_icons = list(slot_tie_str = 'icons/mob/clothing/modular_armor.dmi', SLOT_ID_SUIT = 'icons/mob/clothing/modular_armor.dmi')
	icon_state = "legguards"
	gender = PLURAL
	body_cover_flags = LEGS
	armor_type = /datum/armor/station/medium
	slot = ACCESSORY_SLOT_ARMOR_L

/obj/item/clothing/accessory/armor/legguards/blue
	desc = "A pair of armored leg pads in blue. Attaches to a plate carrier."
	icon_state = "legguards_blue"

/obj/item/clothing/accessory/armor/legguards/navy
	desc = "A pair of armored leg pads in navy blue. Attaches to a plate carrier."
	icon_state = "legguards_navy"

/obj/item/clothing/accessory/armor/legguards/green
	desc = "A pair of armored leg pads in green. Attaches to a plate carrier."
	icon_state = "legguards_green"

/obj/item/clothing/accessory/armor/legguards/tan
	desc = "A pair of armored leg pads in tan. Attaches to a plate carrier."
	icon_state = "legguards_tan"

/obj/item/clothing/accessory/armor/legguards/combat
	name = "heavy leg guards"
	desc = "A pair of heavily armored leg pads in red-trimmed black. Attaches to a plate carrier."
	icon_state = "legguards_combat"
	armor_type = /datum/armor/station/combat

/obj/item/clothing/accessory/armor/legguards/ablative
	name = "ablative leg guards"
	desc = "These will protect your legs from energy weapons."
	icon_state = "legguards_ablative"
	item_state_slots = list(SLOT_ID_RIGHT_HAND = "jackboots", SLOT_ID_LEFT_HAND = "jackboots")
	siemens_coefficient = 0.1
	armor_type = /datum/armor/station/ablative

/obj/item/clothing/accessory/armor/legguards/ballistic
	name = "ballistic leg guards"
	desc = "These will protect your legs from ballistic weapons."
	icon_state = "legguards_ballistic"
	item_state_slots = list(SLOT_ID_RIGHT_HAND = "jackboots", SLOT_ID_LEFT_HAND = "jackboots")
	siemens_coefficient = 0.7
	armor_type = /datum/armor/station/ballistic

/obj/item/clothing/accessory/armor/legguards/riot
	name = "riot leg guards"
	desc = "These will protect your legs from close combat weapons."
	icon_state = "legguards_riot"
	item_state_slots = list(SLOT_ID_RIGHT_HAND = "jackboots", SLOT_ID_LEFT_HAND = "jackboots")
	siemens_coefficient = 0.5
	armor_type = /datum/armor/station/riot
