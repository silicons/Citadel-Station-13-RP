//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

/datum/language_scrambler

/datum/language_scrambler/proc/scramble(fragment)
	return fragment

/datum/language_scrambler/replacement
	/// character = outut
	/// * exclude = ""
	/// * skip = don't set / null
	/// * alist() is allowed here
	var/list/replace_map

/datum/language_scrambler/replacement/scramble(fragment)
	. = list()
	var/list/exploded = splittext_char(fragment, "")
	for(var/i in 1 to length(exploded))
		var/char = exploded[i]
		var/replaced = replace_map[char]
		if(replaced == null)
			. += char
		else
			. += replaced
	return jointext(., "")


#warn impl
