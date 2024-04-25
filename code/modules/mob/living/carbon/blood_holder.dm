//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 silicons                             *//

/**
 * blood holder / handler for carbon types
 */
/datum/blood_holder
	/// owning carbon, if any
	var/mob/living/carbon/host
	/// host blood datum, if any; there should usually be one.
	var/datum/blood/host_blood

	/// blood; datum to ratio
	var/list/blood
	/// total amount
	var/amount
	/// total ever added; used for computations
	/// do not modify yourself
	var/total_added
	/// maximum amount
	var/capacity

	//* legacy things
	var/list/legacy_virus2 = list()
	var/list/legacy_antibodies = list()

/datum/blood_holder/New(capacity = BLOOD_VOLUME_DEFAULT, datum/blood/host_blood, mob/living/carbon/host)
	src.host = host
	src.host_blood = host_blood
	src.capacity = capacity
	#warn amount

/datum/blood_holder/Destroy()
	if(host.blood == src)
		host.blood = null
	host = null
	host_blood = null
	blood = null
	return ..()

/**
 * called when a blood datum is first added
 */
/datum/blood_holder/proc/on_blood_add(datum/blood/blood)
	return

/**
 * called when a blood datum is entirely removed
 */
/datum/blood_holder/proc/on_blood_remove(datum/blood/blood)
	return

/**
 * called to add an amount of a blood datum
 *
 * @return added amount
 */
/datum/blood_holder/proc/add(datum/blood/blood, amount)

/**
 * called to remove an amount of a blood datum
 *
 * @return removed amount
 */
/datum/blood_holder/proc/remove(datum/blood/blood, amount)

/**
 * called to remove an amount of blood
 *
 * @return removed amount
 */
/datum/blood_holder/proc/remove_any(amount)

#warn impl all

