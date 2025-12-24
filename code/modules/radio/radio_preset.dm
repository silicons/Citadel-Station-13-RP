//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

/// all presets
/// * initialized by SSearly_init
GLOBAL_LIST_EMPTY(radio_presets)
/// type lookup
/// * initialized by SSearly_init
GLOBAL_LIST_EMPTY(radio_presets_key_lookup)
/// hotkey lookup
/// * initialized by SSearly_init
GLOBAL_LIST_EMPTY(radio_presets_key_lookup)
/// frequency lookup; frequency is encoded as "[freq]"
/// * initialized by SSearly_init
GLOBAL_LIST_EMPTY(radio_presets_freq_lookup)

/proc/init_radio_preset_meta()
	GLOB.radio_presets = list()
	GLOB.radio_presets_type_lookup = list()
	GLOB.radio_presets_key_lookup = list()
	GLOB.radio_presets_freq_lookup = list()

	for(var/datum/radio_preset/path as anything in subtypesof(/datum/radio_preset))
		if(path.abstract_type == path)
			continue
		var/datum/radio_preset/preset = new path
	#warn impl

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
