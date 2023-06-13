/**
 * gets an organ, whether internal or external, by enum name.
 *
 * tags are usually in [code/__DEFINES/mob/organs.dm]
 */
/mob/living/carbon/proc/get_organ(what)
	RETURN_TYPE(/obj/item/organ)
	#warn impl


/**
 * get the item / examine name of an organ
 */
/mob/living/carbon/proc/get_organ_name(what)
	return get_organ(what)?.name

/**
 * rebuild keyed organs list
 */
/mob/living/carbon/proc/rebuild_organ_lookup()
	#warn impl
