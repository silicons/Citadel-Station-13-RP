//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 silicons                             *//

/**
 * blood datums
 *
 * these are **not** singletons; this is because they hold blood DNA.
 *
 * please be very, very damn careful when you make new ones; they are a
 * memory leak risk, just like reagents are.
 */
/datum/blood
	/// do we need constant processing?
	//  todo: this doesn't work yet
	var/requires_processing = FALSE

/**
 * called when first added to holder
 */
/datum/blood/proc/on_add(datum/blood_holder/holder)
	return

/**
 * called when entirely removed from holder
 */
/datum/blood/proc/on_remove(datum/blood_holder/holder)
	return

/**
 * simple cross compatibility check with other
 */
/datum/blood/proc/compatible(datum/blood/host)
	// default implementation: same typepath
	return host.type == type

/**
 * called if incompatible blood is mixed in
 *
 * this is called on the blood being added.
 *
 * @return amount of incompatible blood to still allow adding
 */
/datum/blood/proc/on_incompatible_merge_onto(datum/blood/host, amount)
	return 0

/**
 * called if incompatible blood is mixed in
 *
 * this is called on host blood
 *
 * @return amount of incompatible blood to still allow adding
 */
/datum/blood/proc/on_incompatible_merge_into(datum/blood/enemy, amount)
	return 0

/**
 * checks if we're literally equivalent to other
 */
/datum/blood/proc/equivalent(datum/blood/other)
	return FALSE

/**
 * humanlike blood
 * uses the antigen system
 */
/datum/blood/human
	/// antigen: "A", "B", "O", "AB"
	/// no #defines; it's 1-2 capital letters, don't fuck it up.
	var/antigen_abo = "O"
	/// RH + present?
	var/antigen_rh = TRUE
	/// our DNA string
	var/dna

/datum/blood/human/equivalent(datum/blood/human/other)
	if(!istype(other))
		return FALSE
	return other.antigen_abo == antigen_abo && other.antigen_rh == antigen_rh && other.dna == dna && return ..()

/datum/blood/human/compatible(datum/blood/human/enemy)
	if(!istype(enemy))
		return FALSE
	if(enemy.antigen_rh && !antigen_rh)
		return FALSE
	switch(enemy.antigen_rh)
		if("A")
			if(antigen_abo == "B" || antigen_abo == "O")
				return FALSE
		if("B")
			if(antigen_abo == "A" || antigen_abo == "O")
				return FALSE
		if("AB")
			if(antigen_abo != "AB")
				return FALSE
	return TRUE
