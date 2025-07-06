//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

/**
 * Player character datums.
 *
 * * Cloneable with `clone()`.
 * * Not serializable with `serialize()`/`deserialize()`
 *
 * ## Variable naming convention.
 * * `c_` stands for something picked for the character. Most of this is generally
 *   modifiable by the player.
 * * `s_` stands for system state. This is generally not modifiable by players.
 * * `p_` stands for persistent state. This is generally modifiable by plyaers.
 *
 * ## Persistence
 *
 * Persistence state is merged in at the UI level.
 */
/datum/character
	/// Our species.
	/// * Serialized as ID, resolved on load.
	var/datum/species/c_species
	/// Our character faction.
	/// * Serialized as ID, resolved on load.
	var/datum/prototype/character_faction/c_faction
	/// Character background picks.
	/// This is a list with `/datum/prototype/character_background_type` ref
	/// associated to a `/datum/prototype/character_background` ref.
	/// * Serialized as ID, resolved on load.
	var/list/c_background

	/// Added faction tags. These cannot be changed by the player.
	/// * Nullable
	var/list/s_extra_faction_tags

/datum/character/clone()
	var/datum/character/clone = new
	clone.c_species = c_species
	clone.c_faction = c_faction
	clone.c_background = c_background.Copy()
	clone.s_extra_faction_tags = s_extra_faction_tags
	return clone

//* Species / Faction / Background *//

/datum/character/proc/get_species_tags()
	#warn impl

/datum/character/proc/get_faction_tags()
	#warn impl

/datum/character/proc/get_background_tags()
	#warn impl
