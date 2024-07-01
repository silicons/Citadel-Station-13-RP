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
	/// Our category
	///
	/// We have the same categories as supply packs.
	var/category = "Miscellaneous"
	/// typepath / entity to spawn
	///
	/// resolution is performed depending on what /datum/supply_item subtype we are
	///
	/// * /datum/supply_item/gas resolves string as gas id
	/// * /datum/supply_item/material resolves string as material id (for sheets)
	/// * everything else cannot resolve string id
	///
	/// for types:
	///
	/// * /datum/material is valid
	/// * /obj/item/stack/material **is not** valid
	/// * /obj/item/stack is valid
	/// * /obj/item is valid
	/// * /obj is valid
	/// * /mob is sort of valid
	///
	/// for instances:
	///
	/// * an instance of some /atom/movable **is valid.** it will be cloned via clone(TRUE) (for includes contents) if so.
	///
	/// product will be resolved on init,
	/// and made into something that we can spawn / clone.
	var/product
	/// the raw worth of our product, before any modifiers like buy/sell modifiers
	///
	/// if not set, will be autodetected.
	var/worth
	/// units descriptor, if any; examples: "moles", "sheets", "tiles", "rods"
	var/units

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
	resolve()
	generate()

/datum/supply_item2/proc/generate()
	if(isnull(worth))
		worth = SSsupply.estimate_worth_of_product(worth)
		if(!worth)
			stack_trace("[src] ([product]) generated with 0 worth.")

// todo: how do we spawn / collate these things? across orders? across private orders?

/**
 * resolves our product entity or typepath
 *
 * * can return a /datum/material datum
 * * can return a /datum/gas datum
 * * can return a /obj/item/stack instance
 * * can return a /atom/movable instance
 * * can return any /obj/item/stack subtype's path
 * * can return any /atom/movable subtype's path
 * * can return any /datum/material subtype's path
 * * can return any /datum/gas subtype's path
 */
/datum/supply_item2/proc/resolve()
	#warn how to do that

#warn name generation?
