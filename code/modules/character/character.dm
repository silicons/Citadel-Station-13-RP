//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

/**
 * Player character datums.
 *
 * * Serializable.
 *
 * ## Variable naming convention.
 * * `c_` stands for something picked for the character.
 * * `p_` stands for persistent state.
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

#warn impl
