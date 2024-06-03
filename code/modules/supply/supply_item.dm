//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 silicons                             *//

/**
 * a holder for an item that can be ordered standalone
 *
 * todo: rename to supply_item
 */
/datum/supply_item2
	/// the name of the item; it should be in plural form if it can be.
	///
	/// * "air canisters"
	/// * "sheets of metal"
	var/name
	/// typepath to spawn
	///
	/// * /datum/material is valid
	/// * /obj/item/stack is valid
	/// * /obj/item is valid
	/// * /obj is valid
	/// * /mob is sort of valid
	/// * an instance **is valid.** it will be cloned via clone(TRUE) (for includes contents) if so.
	var/product
	/// the raw worth of our product, before any modifiers like buy/sell modifiers
	///
	/// if not set, will be autodetected.
	var/worth

/datum/supply_item2/New(name, product, worth)
	if(!isnull(name))
		src.name = name
	if(!isnull(product))
		src.product = product
	if(!isnull(worth))
		src.worth = worth

/**
 * **Always call this before using it!**
 */
/datum/supply_item2/proc/initialize()
	generate()

/datum/supply_item2/proc/generate()
	if(isnull(worth))
		worth = SSsupply.estimate_worth_of_product(worth)
		if(!worth)
			stack_trace("[src] ([product]) generated with 0 worth.")

// todo: how do we spawn / collate these things? across orders? across private orders?
