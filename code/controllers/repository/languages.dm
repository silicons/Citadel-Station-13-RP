//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

REPOSITORY_DEF(languages)
	name = "Repository - Languages"
	expected_type = /datum/prototype/language

	/**
	 * The grand list of language default key assignments.
	 * * Only important languages will get key assignments.
	 * * Ironically, **whitelisted languages and species are unimportant.**
	 * * Misc languages can be bound to by the user, and/or invoked via saycode ID.
	 * * Case-sensitive.
	 */
	var/list/default_keys = list(
		"e" = /datum/prototype/language/species/moth::id,
		"o" = /datum/prototype/language/unathi::id,
		#warn impl
	)
	/// Resolved input ID to language
	var/tmp/list/input_id_lookup = list()

	var/list/legacy_language_lookup

/datum/controller/repository/languages/Create()
	legacy_language_lookup = list()
	return ..()

/datum/controller/repository/languages/load(datum/prototype/language/instance)
	. = ..()
	if(!.)
		return
	legacy_language_lookup[lowertext(instance.name)] = instance

/datum/controller/repository/languages/unload(datum/prototype/language/instance)
	. = ..()
	legacy_language_lookup -= lowertext(instance.name)

/datum/controller/repository/languages/proc/legacy_resolve_language_name(name)
	return legacy_language_lookup[lowertext(name)]

/datum/controller/repository/languages/proc/legacy_sorted_all_language_names()
	return tim_sort(legacy_language_lookup.Copy(), /proc/cmp_text_asc)
