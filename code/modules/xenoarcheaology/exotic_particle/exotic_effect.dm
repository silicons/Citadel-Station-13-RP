//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers          *//

/**
 * xenoarcheology core: exotic effects
 *
 * An effect. Configured by inbound polarity variables.
 * Acts on entities to produce effects.
 */
/datum/exotic_effect
	/// name
	var/name

	//* Effect API Reflection *//
	/// Supported effector APIs
	var/effect_api = NONE

	//* Polarity *//
	/// polarity settings
	///
	/// * these are not ICly visible *directly*
	/// * make these human-readable-dash-notation
	/// * key = /datum/exotic_effect_polarity instance, path, or anonymous type
	var/list/polarity_settings = list()

	//* Visuals *//

	/// should we be visible on turf?
	var/visible = FALSE
	/// visual priority; bigger number is higher priority
	///
	/// * the more devastating this effect is the higher this should be
	/// * e.g. something that just causes an uneasy feeling should be eclipsed by a particle that incinerates you
	var/visual_priority = 0



#warn impl all


