//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers          *//

/**
 * xenoarcheology core: exotic particle
 *
 * A particle. Can have effects that vary based on the polarity configuration of the particle.
 *
 * todo: /datum/prototype/exotic_particle
 */
/datum/exotic_particle
	/// name; usually the same as randomly generated IC identifier ('fluff_identifier')
	var/name

	/// randomly generated IC identifier
	var/fluff_identifier

	//* composition *//
	/// effect instances
	var/list/datum/exotic_effect_instance/effects
	/// qualities; key = value
	var/list/qualities

	//* visuals *//
	/// primary / default visual color
	var/color = "#ffffff"

#warn impl all
