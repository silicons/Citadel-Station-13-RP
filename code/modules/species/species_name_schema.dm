//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

/**
 * ## Schema
 *
 * ### Root
 *
 * * `length-limit`: hard character limit
 * * `word-limit`: hard word limit
 * * `fragments`: {"id": {fragment}, ...}
 *
 * ### Fragment
 * * `prefix`: list(word, ...)
 * * `next`: {"fragment id": {fragment modifier}}
 * * `terminal`: true | false
 *
 * ### Fragment Modifier
 * * nothing yet
 */
/datum/species_name_schema
	/// fragment by key
	var/list/keyed_fragments
	/// word lists by key
	var/list/keyed_wordlists

	/// starting fragment ids
	var/list/starting_fragment_ids

/datum/species_name_schema/proc/build_from(list/schema, list/wordlists)

/datum/species_name_schema/proc/generate() as text
	#warn impl

/datum/species_name_schema/proc/generate_list(amount) as /list
	. = list()
	for(var/i in 1 to amount)
		. += generate()

#warn impl all
