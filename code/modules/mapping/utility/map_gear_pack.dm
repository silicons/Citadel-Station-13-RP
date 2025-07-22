//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

/**
 * Individual gear packs to distribute.
 */
/datum/map_gear_pack
	/// list of typepaths associated to amounts
	///
	/// special handling:
	/// * /datum/prototype/material = amount in sheets
	/// * /obj/item/stack = amount in stack
	/// * /datum/map_gear_pack (typepath / instance) = amount of copies
	var/list/gear = list()
	/// always spawn together?
	/// * must be respected
	var/require_spawn_together = TRUE
	/// prefer spawn closeby?
	/// * free to be ignored
	var/prefer_spawn_together = TRUE

/**
 * * entities can be created in nullspace.
 * @return created entities as list
 */
/datum/map_gear_pack/proc/instantiate() as /list

#warn impl
