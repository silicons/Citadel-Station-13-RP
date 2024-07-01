//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 silicons                             *//

/**
 * a faction with things you can buy, and which you can sell to (maybe)
 */
/datum/supply_faction2
	/// unique id
	var/id
	/// our name
	var/name

	/// list of supply items we sell
	///
	/// * set to typepaths to init
	var/list/datum/supply_item2/supply_items = list()
	/// list of supply packs we sell
	///
	/// * set to typepaths to init
	var/list/datum/supply_pack2/supply_packs = list()
	/// list of allowable exports
	///
	/// * you can still sell stuff that isn't an export; it'll just obey the default elasticity.
	/// * set to typepaths to init
	var/list/datum/supply_export2/supply_exports = list()
	#warn okay how do we deal with exports

#warn impl

/datum/supply_faction2/proc/prime()
	#warn generate supply items/packs
