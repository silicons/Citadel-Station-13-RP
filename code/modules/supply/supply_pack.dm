//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 silicons                             *//

/**
 * a holder for a pack of objects that can be ordered
 *
 * todo: rename to supply_pack
 */
/datum/supply_pack2
	/// name of pack
	var/name = "Supply Pack"
	/// raw worth of everything in container
	///
	/// * if null, it will be autodetected.
	var/worth

	// todo: containers

/datum/supply_pack2/New(name, worth)
	if(!isnull(name))
		src.name = name
	if(!isnull(worth))
		src.worth = worth

/**
 * **Always call this before using it!**
 */
/datum/supply_pack2/proc/initialize()
	generate()

/datum/supply_pack2/proc/generate()
	if(isnull(worth))
		worth = detect_worth()
		if(!worth)
			stack_trace("pack [src] ([type]) failed to detect worth.")

/datum/supply_pack2/proc/detect_worth()
	CRASH("abstract proc called")

// todo: instantiation

/**
 * standard supply pack
 *
 * has a list of things to spawn, and spawns it.
 */
/datum/supply_pack2/standard
	/// list of typepaths associated to count
	///
	/// * if, /datum/material, count is handled as stack amount
	/// * if, /obj/item/stack, count is handled as stack amount
	/// * if an instance, count will be number of times to clone it with clone(TRUE).
	var/list/contains = list()

/datum/supply_pack2/standard/New(name, worth, list/contains)
	if(!isnull(contains))
		src.contains = contains.Copy()
	..()

/datum/supply_pack2/detect_worth()
	. = 0
	for(var/path in contains)
		var/amount = contains[path]
		. += SSsupply.estimate_worth_of_product(path) * amount
