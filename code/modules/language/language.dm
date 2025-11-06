//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

/**
 * language datums
 *
 * singletons stored on SScharacters, only referenced by id most of the time.
 */
/datum/prototype/language
	/// Abstract type.
	abstract_type = /datum/prototype/language

	/// input ID
	/// * generated from ID if not specified
	/// * must be round-unique
	/// * if it isn't, it's deduped
	/// * read `input_id_resolved` for deduped version.
	#warn hook
	var/input_id
	var/tmp/input_id_resolved

	/// scrambler; set to type to init
	var/datum/language_scrambler/scrambler

/datum/prototype/language/New()
	if(!input_id)
		input_id = id
	if(ispath(scrambler) || IS_ANONYMOUS_TYPEPATH(scrambler))
		scrambler = new scrambler

/**
 * Changes `input_id_resolved`
 */
/datum/prototype/language/proc/resolve_input_id_to(new_id)

#warn imlp
