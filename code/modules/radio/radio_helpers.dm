//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

/**
 * @params
 * * path - path to create
 * * key_paths - list of encryption key paths to insert
 * * hard_bind - hardbind given presets or frequencies to the radio, key or not
 * * set_primary - radio preset or freq for primary channel; will not grant if doesn't exist
 * * set_default - radio preset or freq for default channel; will not grant if doesn't exist
 * * enable_freqs - enable given presets or frequencies
 * * disable_freqs - disable given presets or frequencies
 */
/proc/radio_create_headset(
	path = /obj/item/radio/headset,
	key_paths,
	hard_bind,
	set_primary,
	set_default,
	enable_freqs,
	disable_freqs,
) as /obj/item/radio/headset
	ASSERT(ispath(path, /obj/item/radio/headset))
	var/obj/item/radio/headset/creating = new path

#warn impl all

	return creating
