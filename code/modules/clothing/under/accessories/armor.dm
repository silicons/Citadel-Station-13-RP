/*
// This file holds all of the accessories used as part of the modular armor system. At some point it might be wise to split this into multiple files.
*/

/obj/item/clothing/accessory/armor
	name = "armor accessory"
	desc = "You should never see this description. Ahelp this, please."
	icon_override = 'icons/mob/clothing/modular_armor.dmi'
	icon = 'icons/obj/clothing/modular_armor.dmi'
	icon_state = "pouches"
	w_class = WEIGHT_CLASS_NORMAL

/obj/item/clothing/accessory/armor/on_attached(var/obj/item/clothing/S, var/mob/user)
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		if(H.wear_suit == S)
			if((body_cover_flags & ARMS) && istype(H.gloves, /obj/item/clothing))
				var/obj/item/clothing/G = H.gloves
				if(G.body_cover_flags & ARMS)
					to_chat(H, "<span class='warning'>You can't wear \the [src] with \the [G], it's in the way.</span>")
					S.accessories -= src
					return
			else if((body_cover_flags & LEGS) && istype(H.shoes, /obj/item/clothing))
				var/obj/item/clothing/Sh = H.shoes
				if(Sh.body_cover_flags & LEGS)
					to_chat(H, "<span class='warning'>You can't wear \the [src] with \the [Sh], it's in the way.</span>")
					S.accessories -= src
					return
	..()

///////////
//Pouches
///////////
/obj/item/clothing/accessory/storage/pouches
	name = "storage pouches"
	desc = "A collection of black pouches that can be attached to a plate carrier. Carries up to two items."
	icon_override = 'icons/mob/clothing/modular_armor.dmi'
	icon = 'icons/obj/clothing/modular_armor.dmi'
	icon_state = "pouches"
	w_class = WEIGHT_CLASS_NORMAL
	gender = PLURAL
	slot = ACCESSORY_SLOT_ARMOR_S
	max_combined_volume = WEIGHT_VOLUME_SMALL * 2

/obj/item/clothing/accessory/storage/pouches/blue
	desc = "A collection of blue pouches that can be attached to a plate carrier. Carries up to two items."
	icon_state = "pouches_blue"

/obj/item/clothing/accessory/storage/pouches/navy
	desc = "A collection of navy blue pouches that can be attached to a plate carrier. Carries up to two items."
	icon_state = "pouches_navy"

/obj/item/clothing/accessory/storage/pouches/green
	desc = "A collection of green pouches that can be attached to a plate carrier. Carries up to two items."
	icon_state = "pouches_green"

/obj/item/clothing/accessory/storage/pouches/tan
	desc = "A collection of tan pouches that can be attached to a plate carrier. Carries up to two items."
	icon_state = "pouches_tan"

/obj/item/clothing/accessory/storage/pouches/large
	name = "large storage pouches"
	desc = "A collection of black pouches that can be attached to a plate carrier. Carries up to four items."
	icon_state = "lpouches"
	max_combined_volume = WEIGHT_VOLUME_SMALL * 4
	weight = ITEM_WEIGHT_STORAGE_POUCH_LARGE
	encumbrance = ITEM_ENCUMBRANCE_STORAGE_POUCH_LARGE

/obj/item/clothing/accessory/storage/pouches/large/blue
	desc = "A collection of blue pouches that can be attached to a plate carrier. Carries up to four items."
	icon_state = "lpouches_blue"

/obj/item/clothing/accessory/storage/pouches/large/navy
	desc = "A collection of navy blue pouches that can be attached to a plate carrier. Carries up to four items."
	icon_state = "lpouches_navy"

/obj/item/clothing/accessory/storage/pouches/large/green
	desc = "A collection of green pouches that can be attached to a plate carrier. Carries up to four items."
	icon_state = "lpouches_green"

/obj/item/clothing/accessory/storage/pouches/large/tan
	desc = "A collection of tan pouches that can be attached to a plate carrier. Carries up to four items."
	icon_state = "lpouches_tan"

////////////////
//Shotgun Shell Holder
////////////////

/obj/item/clothing/accessory/storage/shotgun_shell_holder
	name = "shotgun shell pouch"
	desc = "A set of eight pouches designed to hold shotgun shells for easy access."
	icon_override = 'icons/mob/clothing/modular_armor.dmi'
	icon = 'icons/obj/clothing/modular_armor.dmi'
	icon_state = "shotholder"
	slot = ACCESSORY_SLOT_ARMOR_S
	max_combined_volume = WEIGHT_VOLUME_SMALL * 4
	insertion_whitelist = list(
		/obj/item/ammo_casing/a12g,
	)

/obj/item/clothing/accessory/storage/shotgun_shell_holder/update_icon_state()
	icon_state = "shotholder-[length(contents)]"
	return ..()

//////////////////////////
//Decorative attachments
//////////////////////////
/obj/item/clothing/accessory/armor/tag
	name = "\improper SCG Flag"
	desc = "An emblem depicting the Solar Confederate Government's flag."
//	accessory_icons = list(slot_tie_str = 'icons/mob/clothing/modular_armor.dmi', SLOT_ID_SUIt = 'icons/mob/clothing/modular_armor.dmi')
	icon_state = "solflag"
	slot = ACCESSORY_SLOT_ARMOR_M
	w_class = WEIGHT_CLASS_SMALL

//Nanotrasen
/obj/item/clothing/accessory/armor/tag/nts
	name = "\improper CORPORATE SECURITY tag"
	desc = "An armor tag with the words CORPORATE SECURITY printed in red lettering."
	icon_state = "ntstag"

/obj/item/clothing/accessory/armor/tag/ntbs
	name = "\improper BLUESHIELD tag"
	desc = "An armor tag with the words BLUESHIELD printed in blue lettering."
	icon_state = "ntbstag"

/obj/item/clothing/accessory/armor/tag/ntc
	name = "\improper CORPORATE SEC-COM tag"
	desc = "An armor tag with the words CORPORATE SEC-COM printed in gold lettering."
	icon_state = "ntctag"

//Other
/obj/item/clothing/accessory/armor/tag/sifguard
	name = "\improper Sif Defense Force crest"
	desc = "An emblem depicting the crest of the Sif Defense Force."
	icon_state = "ecflag"

/obj/item/clothing/accessory/armor/tag/civsec
	name = "\improper Security tag"
	desc = "An armor tag with the word SECURITY printed in silver lettering."
	icon_state = "sectag"

/obj/item/clothing/accessory/armor/tag/com
	name = "\improper SCG tag"
	desc = "An armor tag with the words SOLAR CONFEDERATE GOVERNMENT printed in gold lettering."
	icon_state = "comtag"

/obj/item/clothing/accessory/armor/tag/pcrc
	name = "\improper PCRC tag"
	desc = "An armor tag with the words PROXIMA CENTAURI RISK CONTROL printed in cyan lettering."
	icon_state = "pcrctag"

/obj/item/clothing/accessory/armor/tag/saare
	name = "\improper SAARE tag"
	desc = "An armor tag with the acronym SAARE printed in olive-green lettering."
	icon_state = "saaretag"

/obj/item/clothing/accessory/armor/tag/opos
	name = "\improper O+ blood patch"
	desc = "An embroidered patch indicating the wearer's blood type as O POSITIVE."
	icon_state = "opostag"

/obj/item/clothing/accessory/armor/tag/oneg
	name = "\improper O- blood patch"
	desc = "An embroidered patch indicating the wearer's blood type as O NEGATIVE."
	icon_state = "onegtag"

/obj/item/clothing/accessory/armor/tag/apos
	name = "\improper A+ blood patch"
	desc = "An embroidered patch indicating the wearer's blood type as A POSITIVE."
	icon_state = "apostag"

/obj/item/clothing/accessory/armor/tag/aneg
	name = "\improper A- blood patch"
	desc = "An embroidered patch indicating the wearer's blood type as A NEGATIVE."
	icon_state = "anegtag"

/obj/item/clothing/accessory/armor/tag/bpos
	name = "\improper B+ blood patch"
	desc = "An embroidered patch indicating the wearer's blood type as B POSITIVE."
	icon_state = "bpostag"

/obj/item/clothing/accessory/armor/tag/bneg
	name = "\improper B- blood patch"
	desc = "An embroidered patch indicating the wearer's blood type as B NEGATIVE."
	icon_state = "bnegtag"

/obj/item/clothing/accessory/armor/tag/abpos
	name = "\improper AB+ blood patch"
	desc = "An embroidered patch indicating the wearer's blood type as AB POSITIVE."
	icon_state = "abpostag"

/obj/item/clothing/accessory/armor/tag/abneg
	name = "\improper AB- blood patch"
	desc = "An embroidered patch indicating the wearer's blood type as AB NEGATIVE."
	icon_state = "abnegtag"

/obj/item/clothing/accessory/armor/tag/press
	name = "\improper PRESS tag"
	desc = "An armor tag with the words PRESS emblazoned in bold white lettering."
	icon_state = "presstag"

/////////////////
// Helmet Covers
/////////////////

/obj/item/clothing/accessory/armor/helmcover
	name = "helmet cover"
	desc = "A fabric cover for armored helmets."
	icon_override = 'icons/mob/clothing/ties.dmi'
	icon = 'icons/obj/clothing/modular_armor.dmi'
	icon_state = "helmcover_blue"
	slot = ACCESSORY_SLOT_HELM_C

/obj/item/clothing/accessory/armor/helmcover/blue
	name = "blue helmet cover"
	desc = "A fabric cover for armored helmets in a bright blue color."
	icon_state = "helmcover_blue"

/obj/item/clothing/accessory/armor/helmcover/navy
	name = "navy blue helmet cover"
	desc = "A fabric cover for armored helmets. This one is colored navy blue."
	icon_state = "helmcover_navy"

/obj/item/clothing/accessory/armor/helmcover/green
	name = "green helmet cover"
	desc = "A fabric cover for armored helmets. This one has a woodland camouflage pattern."
	icon_state = "helmcover_green"

/obj/item/clothing/accessory/armor/helmcover/tan
	name = "tan helmet cover"
	desc = "A fabric cover for armored helmets. This one has a desert camouflage pattern."
	icon_state = "helmcover_tan"

/obj/item/clothing/accessory/armor/helmcover/nt
	name = "\improper Nanotrasen helmet cover"
	desc = "A fabric cover for armored helmets. This one has Nanotrasen's colors."
	icon_state = "helmcover_nt"

/obj/item/clothing/accessory/armor/helmcover/pcrc
	name = "\improper PCRC helmet cover"
	desc = "A fabric cover for armored helmets. This one is colored navy blue and has a tag in the back with the words PROXIMA CENTAURI RISK CONTROL printed in cyan lettering on it."
	icon_state = "helmcover_pcrc"

/obj/item/clothing/accessory/armor/helmcover/saare
	name = "\improper SAARE helmet cover"
	desc = "A fabric cover for armored helmets. This one has SAARE's colors."
	icon_state = "helmcover_saare"

/////////////////
//Helmet Cameras
/////////////////

/obj/item/clothing/accessory/armor/helmetcamera
	name = "helmet camera"
	desc = "A small camera that attaches to helmets."
	icon_override = 'icons/mob/clothing/ties.dmi'
	icon = 'icons/obj/clothing/modular_armor.dmi'
	icon_state = "helmcam"
	slot = ACCESSORY_SLOT_HELM_R
	var/obj/machinery/camera/camera
	var/list/camera_networks
	camera_networks = list(NETWORK_CIV_HELMETS)


/obj/item/clothing/accessory/armor/helmetcamera/attack_self(mob/user)
	. = ..()
	if(.)
		return
	if(camera_networks)
		if(!camera)
			camera = new /obj/machinery/camera(src)
			camera.replace_networks(camera_networks)
			camera.set_status(FALSE) //So the camera will activate in the following check.

		if(camera.status == TRUE)
			camera.set_status(FALSE)
			to_chat(usr, "<font color=#4F49AF>Camera deactivated.</font>")
		else
			camera.set_status(TRUE)
			camera.c_tag = usr.name
			to_chat(usr, "<font color=#4F49AF>User scanned as [camera.c_tag]. Camera activated.</font>")
	else
		to_chat(usr, "This object does not have a camera.") //Shouldnt ever be visible for helmet cams.
		return

/obj/item/clothing/accessory/armor/helmetcamera/examine(mob/user, dist)
	. = ..()
	if(camera_networks && get_dist(user,src) <= 1)
		. += "The [camera ? "" : "in"]active."

/obj/item/clothing/accessory/armor/helmetcamera/body
	name = "body camera"
	desc = "A small camera that attaches to most uniforms."
	icon_override = 'icons/mob/clothing/ties.dmi'
	icon = 'icons/obj/clothing/modular_armor.dmi'
	icon_state = "helmcam_body"
	slot = ACCESSORY_SLOT_DECOR
	camera_networks = list(NETWORK_CIV_HELMETS)

/obj/item/clothing/accessory/armor/helmetcamera/security
	name = "security helmet camera"
	desc = "A small camera that attaches to helmets. This one has its feed restricted to Security."
	icon_state = "helmcam_sec"
	camera_networks = list(NETWORK_SEC_HELMETS)

/obj/item/clothing/accessory/armor/helmetcamera/security/body
	name = "security body camera"
	desc = "A small camera that attaches to most uniforms. This one has its feed restricted to Security."
	icon_state = "helmcam_body_sec"
	slot = ACCESSORY_SLOT_DECOR

/obj/item/clothing/accessory/armor/helmetcamera/exploration
	name = "exploration helmet camera"
	desc = "A small camera that attaches to helmets. This one has its feed restricted to Exploration."
	icon_state = "helmcam_explo"
	camera_networks = list(NETWORK_EXPLO_HELMETS)

/obj/item/clothing/accessory/armor/helmetcamera/exploration/body
	name = "exploration body camera"
	desc = "A small camera that attaches to most uniforms. This one has its feed restricted to Exploration."
	slot = ACCESSORY_SLOT_DECOR
	icon_state = "helmcam_body_explo"

//Lightweight Limb Plating - These are incompatible with plate carriers.

//Debug variant
/obj/item/clothing/accessory/armor/limb_plate
	name = "armor plating"
	desc = "You shouldn't be seeing this. Contact a Maintainer."
	icon = 'icons/obj/clothing/ties.dmi'
	icon_override = 'icons/mob/clothing/ties.dmi'
	icon_state = "bronze"
	armor_type = /datum/armor/station/light

/obj/item/clothing/accessory/armor/limb_plate/arm_l
	name = "left shoulder plate"
	desc = "A sturdy, unadorned armor plate. Attaches to a plate harness."
	icon_state = "arm_plate_l"
	slot = ACCESSORY_SLOT_ARMOR_C

/obj/item/clothing/accessory/armor/limb_plate/arm_r
	name = "right shoulder plate"
	desc = "A sturdy, unadorned armor plate. Attaches to a plate harness."
	icon_state = "arm_plate_r"
	slot = ACCESSORY_SLOT_ARMOR_A

/obj/item/clothing/accessory/armor/limb_plate/leg_l
	name = "left thigh plate"
	desc = "A sturdy, unadorned armor plate. Attaches to a plate harness."
	icon_state = "leg_plate_l"
	slot = ACCESSORY_SLOT_ARMOR_L

/obj/item/clothing/accessory/armor/limb_plate/leg_r
	name = "right thigh plate"
	desc = "A sturdy, unadorned armor plate. Attaches to a plate harness."
	icon_state = "leg_plate_r"
	slot = ACCESSORY_SLOT_ARMOR_M

//EMT Subtypes
/obj/item/clothing/accessory/armor/limb_plate/arm_l/emt
	name = "left shoulder plate (Paramedic)"
	desc = "A sturdy, armor plate marked with medical insignia. Attaches to a plate harness."
	icon_state = "arm_paramed_l"

/obj/item/clothing/accessory/armor/limb_plate/arm_r/emt
	name = "right shoulder plate (Paramedic)"
	desc = "A sturdy, armor plate marked with medical insignia. Attaches to a plate harness."
	icon_state = "arm_paramed_r"

/obj/item/clothing/accessory/armor/limb_plate/leg_l/emt
	name = "left thigh plate (Paramedic)"
	desc = "A sturdy, armor plate marked with medical insignia. Attaches to a plate harness."
	icon_state = "leg_paramed_l"

/obj/item/clothing/accessory/armor/limb_plate/leg_r/emt
	name = "right thigh plate (Paramedic)"
	desc = "A sturdy, armor plate marked with medical insignia. Attaches to a plate harness."
	icon_state = "leg_paramed_r"
