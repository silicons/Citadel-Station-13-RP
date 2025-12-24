//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

/**
 * declared radio frequencies, more or less
 */
/datum/radio_preset
	/// name
	var/name = "Unknown"
	/// display name to use for long name / ui
	/// * defaults to 'name'
	var/long_name
	/// shorthand name used in radio
	/// * defaults to 'name'
	var/short_name

	/// frequency
	/// * doesn't sanitize make sure you sanitize to odd number
	/// * example: `1359`, `1353`.
	var/freq_number

	/// hotkey, if any
	/// * presets may not have the same hotkey
	/// * hotkeys are case-insensitive.
	var/hotkey

	/// span class in chat
	var/html_span

	/// considered a comms channel? only comms channels are possible presets for normal (voice) radios
	var/is_comms_channel = TRUE

	/// if exists, you can encode this into all radios supporting access-based encoding
	/// by just having the access
	var/list/c_access_encoding


/datum/radio_preset
