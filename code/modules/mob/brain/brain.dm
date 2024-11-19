/**
 * More or less holds a consciousness when someone's in an /obj/item/organ/internal/brain,
 * rather than you know, their body.
 */
/mob/brain
	var/obj/item/container = null
	var/timeofhostdeath = 0
	var/emp_damage = 0//Handles a type of MMI damage
	var/alert = null
	use_me = 0 //Can't use the me verb, it's a freaking immobile brain
	icon = 'icons/obj/surgery.dmi'
	icon_state = "brain1"

/mob/brain/Initialize(mapload)
	. = ..()
	var/datum/reagent_holder/R = new/datum/reagent_holder(1000)
	reagents = R
	R.my_atom = src

/mob/brain/Destroy()
	if(key)				//If there is a mob connected to this thing. Have to check key twice to avoid false death reporting.
		if(stat!=DEAD)	//If not dead.
			death(1)	//Brains can die again. AND THEY SHOULD AHA HA HA HA HA HA
		ghostize()		//Ghostize checks for key so nothing else is necessary.
	return ..()

/mob/brain/update_mobility(blocked, forced)
	if(in_contents_of(/obj/vehicle/sealed/mecha) || istype(loc, /obj/item/mmi))
		. = ..(blocked, forced)
	else
		. = ..(MOBILITY_FLAGS_REAL, forced)
	use_me = !!(. & MOBILITY_IS_CONSCIOUS)

/mob/brain/isSynthetic()
	return istype(loc, /obj/item/mmi)

///mob/brain/binarycheck()//No binary without a binary communication device
//	return isSynthetic()
