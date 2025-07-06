//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

/**
 * Character creator pickable factions for characters.
 *
 * Ideally doesn't exist outside of the character system; this should not be referenced
 * by game mechanics.
 */
/datum/prototype/character_faction
	abstract_type = /datum/prototype/character_faction

	/// Name
	var/name = "???"
	/// Blurb
	var/blurb = "Some faction of some kind."

	/// string tags
	/// * These are what actually determine role eligibility and are injected
	///   into the mind datum.
	var/list/faction_tags = list()

	#warn reconsider
