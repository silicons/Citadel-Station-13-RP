//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

/**
 * Not real channels.
 */
/datum/radio_preset/abstract
	name = "ABSTRACT"
	abstract_type = /datum/radio_preset/abstract

/datum/radio_preset/abstract/New()
	// length of /datum/radio_preset/abstract
	name = "ABSTRACT ([copytext("[type]", 28 + 1)])"

/datum/radio_preset/abstract/use_right_ear
	hotkey = "r"

/datum/radio_preset/abstract/use_left_ear
	hotkey = "l"

/datum/radio_preset/abstract/use_intercom
	hotkey = "i"

/datum/radio_preset/abstract/use_binary
	hotkey = "b"

/datum/radio_preset/abstract/whisper
	hotkey = "w"

/datum/radio_preset/abstract/use_primary
	hotkey = "h"

#warn impl all
