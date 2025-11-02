// TODO: organ this holy shit
/obj/item/implant/mirror
	name = "Mirror"
	desc = "A small implanted disk that stores a copy of ones conciousness, updated at times of rest."
	catalogue_data = /datum/category_item/catalogue/technology/resleeving
	icon = 'icons/obj/mirror.dmi'
	icon_state = "mirror_implant_f"
	integrity_flags = INTEGRITY_INDESTRUCTIBLE
	var/stored_mind = null
	var/tmp/mob/living/carbon/human/human
	item_flags = ITEM_NO_BLUDGEON | ITEM_ENCUMBERS_WHILE_HELD

	/// died of ligma
	/// * if you're an innocent coder trawling around citadel rp wondering what the fuck this is, well,
	///   back away slowly now and do not find references with langserv.
	var/died_from_vore = FALSE

	/**
	 * Capturing. Mirrors can be captured by a simulation.
	 */
	#warn impl
	var/datum/simulation_core/captured_by_simulation

//holder to prevent having to find it each time
/mob/living/carbon/human/var/obj/item/implant/mirror/mirror

/obj/item/implant/mirror/digest_act(var/atom/movable/item_storage = null)
    return FALSE

/obj/item/implant/mirror/get_data()
	var/dat = {"
<b>Implant Specifications:</b><BR>
<b>Name:</b> Galactic Immortality Initiative Mirror Implant<BR>
<b>Life:</b> Indefinite.<BR>
<b>Important Notes:</b> Implant updates when the user sleeps, or when manually done by an update chamber. Loss of implant complicates resleeving.<BR>
<HR>
<b>Implant Details:</b><BR>
<b>Function:</b> A self-contained disk that can store the conciousness of a living creature.<BR>
<b>Special Features:</b> Allows the user to transfer their mind to another body in the event of death, or the desire to change sleeves.<BR>
<b>Integrity:</b> Extremely sturdy, at risk of damage through sustained high frequency or direct energy attacks."}
	return dat

/obj/item/implant/mirror/post_implant(var/mob/living/carbon/human/H)
	if(!istype(H))
		return
	spawn(20)
	if((H.client.prefs.organ_data[O_BRAIN] != null))
		to_chat(usr, "<span class='warning'>WARNING: WRONG MIRROR TYPE DETECTED, PLEASE RECTIFY IMMEDIATELY TO AVOID REAL DEATH.</span>")
		H.mirror = src
		return
	else
		stored_mind = SStranscore.m_backupE(H.mind, one_time = TRUE)
		icon_state = "mirror_implant"
		human = H
		human.mirror = src

/obj/item/implant/mirror/afterattack(atom/target, mob/user, clickchain_flags, list/params)
	var/obj/machinery/computer/transhuman/resleeving/comp = target
	if (!istype(comp))
		return
	comp.active_mr = stored_mind

/obj/item/implant/mirror/attackby(obj/item/I, mob/user)
	if(istype(I, /obj/item/mirrorscanner))
		if(stored_mind == null)
			to_chat(usr, "No consciousness found.")
		else
			to_chat(usr, "This mirror contains a consciousness.")
	else
		if(istype(I, /obj/item/mirrortool))
			var/obj/item/mirrortool/MT = I
			if(MT.imp)
				to_chat(usr, "The mirror tool already contains a mirror.")
				return // It's full.
			if(loc == user)			// we assume they can't click someone else's hand items lmao
				if(!user.attempt_insert_item_for_installation(src, MT))
					return
			else
				forceMove(MT)
			MT.imp = src
			MT.update_icon()
		else
			if(istype(I, /obj/item/dogborg/mirrortool))
				var/obj/item/dogborg/mirrortool/MT = I
				if(MT.imp)
					to_chat(usr, "The mirror tool already contains a mirror.")
					return // It's full.
				// dogborgs can't hold mirrors
				forceMove(MT)
				MT.imp = src

/obj/item/implant/mirror/surgically_remove(mob/living/carbon/human/target, obj/item/organ/external/chest/removing_from)
	. = ..()
	target.mirror = null

/obj/item/implant/mirror/positronic
	name = "Synthetic Mirror"
	desc = "An altered form of the common mirror designed to work with synthetic brains."

/obj/item/implant/mirror/positronic/post_implant(var/mob/living/carbon/human/H)
	spawn(20)
		if((H.client.prefs.organ_data[O_BRAIN] != null))
			stored_mind = SStranscore.m_backupE(H.mind, one_time = TRUE)
			icon_state = "mirror_implant"
			H.mirror = src
		else
			to_chat(usr, "<span class='warning'>WARNING: WRONG MIRROR TYPE DETECTED, PLEASE RECTIFY IMMEDIATELY TO AVOID REAL DEATH.</span>")
			H.mirror = src
