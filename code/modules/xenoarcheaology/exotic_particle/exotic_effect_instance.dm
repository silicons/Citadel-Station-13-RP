//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers          *//

/**
 * xenoarcheology core: exotic effect instances
 *
 * An instance of an effect on an exotic particle.
 * Allows forcing polarities.
 */
/datum/exotic_effect_instance
	/// forced polarity settings by key
	var/list/polarities_forced
	/// effector API support; this should be at most the effect itself
	var/effect_api
	/// the effect we represent
	var/datum/exotic_effect/effect

/**
 * @params
 * * effect - the effect we're describing
 * * limit_effect_api - restrict effect-casting API to those flags or less
 * * limit_polarities - force specific keys to specific values
 */
/datum/exotic_effect_instance/New(datum/exotic_effect/effect, limit_effect_api, list/limit_polarities)
	src.polarities_forced = limit_polarities


#warn impl all
#warn cross-linkage
