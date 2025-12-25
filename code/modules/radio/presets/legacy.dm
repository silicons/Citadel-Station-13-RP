//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

/**
 * Hardcoded common frequencies for stuff.
 * * Your snowflake offmap may belong here, if you accept it can be backspaced out of here at any time.
 */
/datum/radio_preset/legacy
	abstract_type = /datum/radio_preset/legacy
	block_start = 1001
	block_end = 1199

//* allocated block: 1001 to 1199

/datum/radio_preset/legacy/mercenary
	name = "Mercenary"
	freq_number = 1001
	is_comms_channel = TRUE
	html_span = "syndradio"

/datum/radio_preset/legacy/raider
	name = "Raider"
	freq_number = 1003
	is_comms_channel = TRUE
	html_span = "syndradio"

/datum/radio_preset/legacy/talon
	name = "Talon"
	freq_number = 1005
	is_comms_channel = TRUE
	html_span = "syndradio"

// the return of the king
/datum/radio_preset/legacy/syndicate
	name = "Syndicate"
	freq_number = 1007
	is_comms_channel = TRUE
	html_span = "syndradio"
