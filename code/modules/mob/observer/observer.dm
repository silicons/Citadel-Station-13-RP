/mob/observer
	name = "observer"
	desc = "This shouldn't appear"
	density = 0
	mobility_flags = NONE
	movespeed_hyperbolic = 0.5
	invisibility = INVISIBILITY_OBSERVER
	see_invisible = SEE_INVISIBLE_OBSERVER
	atom_flags = ATOM_NONWORLD
	saycode_inbound_filter = SAYCODE_TYPE_FILTER_FOR_OBSERVER

	/// Our darksight
	var/datum/vision/baseline/vision_innate = /datum/vision/baseline/observer

/mob/observer/Reachability(atom/target, depth, range, obj/item/tool)
	return FALSE // you're not reaching shit

/mob/observer/CheapReachability(atom/target, depth, range, obj/item/tool)
	return FALSE // you're not reaching shit
