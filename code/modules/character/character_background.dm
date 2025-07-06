//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

/**
 * Arbitrary backgrounds for characters.
 *
 * Only used for character system; ideally should not be referenced in round
 * by mechanics.
 *
 * Contains a string describing what type it is.
 */
/datum/prototype/character_background
	abstract_type = /datum/prototype/character_background

	/// Name
	var/name = "???"
	/// Blurb
	var/blurb = "Some faction of some kind."

	/// string tags
	/// * These are what actually determine role eligibility and are injected
	///   into the mind datum.
	var/list/background_tags = list()

	#warn reconsider
