//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

/**
 * # Access System
 *
 * How the access system works is there's actually two systems.
 * * the datum `/datum/prototype/access` that you're looking at here
 * * the actual implementation of accesses, which use string keys and namespaces.
 *
 * When a mapper maps in an access, they specify the key by typing the access in as a string.
 * The map itself contains what namespace it's in. This is so multiple copies of an offmap
 * don't need to share access.
 *
 * By default, things spawned on a map inherit its (or their area's) namespace.
 *
 * This means that the string 'bar' on the station will become `station-bar`,
 * whereas on the Nebula tradeport might become `nebula-bar`.
 *
 * ## Lookups
 *
 * There's two ways to look up an access.
 * * Its `key` and `namespace`, used to check access.
 * * Its `id`, used by the repository system to uniquely identify it.
 * * Its `id` will always be its access string, which is `NAMESPACE-KEY`.
 *
 * ## Key / Namespace Validity
 *
 * * A key may consist of the characters `a-z`, `0-9`, and `_`.
 * * Namespaces may consist of the same, plus `-`.
 * * Namespaces will always be separated from the key by a `-`.
 *
 * # Schema
 *
 * Access string: `NAMESPACE-KEY`
 *
 * TODO: /datum/prototype/access
 */
/datum/prototype/access
	abstract_type = /datum/prototype/access

	/// access string
	var/access_key
	/// access namespace; this is for the map id
	var/access_namespace

	/// legacy access number
	var/access_numeric_legacy_key

	/// access name
	var/access_name = "Unknown"
	/// access category
	var/access_category = "Misc"
	/// access region
	var/access_region = ACCESS_REGION_NONE
	/// access type
	var/access_type = ACCESS_TYPE_NONE

	/// Sort order; if the same, we go by name. Higher first.
	var/sort_order = 0

	//? it's weird to have region and type without a 2d array huh
	//? explanation:
	//? there's almost no cases where you want to grant type edit
	//? without region edit, or that you'd grant only partial type edit
	//? it's almost impossible to need more than 24 regions unless
	//? we somehow get more than 20 departments, since
	//? centcom is one, and we might get 2-3 special's
	//? but stuff like pirates/mercs/whatever would get their own
	//? not-quite-region.

	//* all of the below act *additively*

	/// access region flags this access can edit
	var/access_edit_region = NONE
	/// access type flags this access can edit
	var/access_edit_type = NONE
	/// list of access datums by typepath or id that this access can also control
	var/list/access_edit_list
	/// a single access category that's set to allow easily setting categorical edit without edit_list
	var/access_edit_category

/datum/prototype/access/compare_to(datum/prototype/access/D)
	return (src.sort_order == D.sort_order)? (sorttext(D.access_name, src.access_name)) : (D.sort_order - src.sort_order)

/**
 * check if we're able to grant permission to edit atleast one other access
 */
/datum/prototype/access/proc/is_edit_relevant()
	return access_edit_region || access_edit_type || access_edit_category || length(access_edit_list)

/datum/prototype/access/station
	abstract_type = /datum/prototype/access/station
	access_type = ACCESS_TYPE_STATION

/datum/prototype/access/station/security
	abstract_type = /datum/prototype/access/station/security
	access_region = ACCESS_REGION_SECURITY
	access_category = "Security"

/datum/prototype/access/station/general
	abstract_type = /datum/prototype/access/station/general
	access_region = ACCESS_REGION_GENERAL
	access_category = "General"

/datum/prototype/access/station/command
	abstract_type = /datum/prototype/access/station/command
	access_region = ACCESS_REGION_COMMAND
	access_category = "Command"

/datum/prototype/access/station/medical
	abstract_type = /datum/prototype/access/station/medical
	access_region = ACCESS_REGION_MEDBAY
	access_category = "Medical"

/datum/prototype/access/station/supply
	abstract_type = /datum/prototype/access/station/supply
	access_region = ACCESS_REGION_SUPPLY
	access_category = "Supply"

/datum/prototype/access/station/engineering
	abstract_type = /datum/prototype/access/station/engineering
	access_region = ACCESS_REGION_ENGINEERING
	access_category = "Engineering"

/datum/prototype/access/station/science
	abstract_type = /datum/prototype/access/station/science
	access_region = ACCESS_REGION_RESEARCH
	access_category = "Science"

/datum/prototype/access/centcom
	abstract_type = /datum/prototype/access/centcom
	access_type = ACCESS_TYPE_CENTCOM
	access_category = "Centcom"

/datum/prototype/access/syndicate
	abstract_type = /datum/prototype/access/syndicate
	access_type = ACCESS_TYPE_SYNDICATE
	access_category = "Syndicate"

/datum/prototype/access/faction
	abstract_type = /datum/prototype/access/faction
	access_type = ACCESS_TYPE_PRIVATE
	access_category = "Faction"

/datum/prototype/access/misc
	abstract_type = /datum/prototype/access/misc
	access_type = ACCESS_TYPE_NONE
	access_category = "Unknown"

/datum/prototype/access/special
	abstract_type = /datum/prototype/access/special
	access_type = ACCESS_TYPE_NONE
	access_category = "Special"
