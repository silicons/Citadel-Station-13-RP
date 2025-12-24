//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

/**
 * Hardcoded common offmap frequencies.
 * * YOUR SNOWFLAKE OFFMAP DOES NOT BELONG HERE.
 *   This is only for offmaps that are on basically every map (or are commonly as such)
 */
/datum/radio_preset/offmap
	abstract_type = /datum/radio_preset/offmap
	block_start = 1201
	block_end = 1299

//* allocated block: 1201 to 1299

/**
 * Civillians don't get this, this is nebula staff
 */
/datum/radio_preset/offmap/nebula
	name = "Nebula Tradepost (Staff)"
	long_name = "Nebula"
	short_name = "NEB"
	freq_number = 1279
	is_comms_channel = TRUE
	html_span = "sdfradio"

#warn impl all
