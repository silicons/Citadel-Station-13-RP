//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

/**
 * new tesla_zap - il vento d'orifto
 *
 * old tesla_zap didn't support proper anti-rebound, and we all know
 * that electricity doesn't just go back and forth on the same wire! teehee!!
 *
 * TODO: this should be on SSspatial_effects or something namespaced
 *
 * @params
 * * source - the source
 * * energy - amount of energy to bounce
 * * initiation - specify this to set advanced variables with an instance of
 *                `/datum/event_args/tesla_zap_initiation`
 */
/proc/tesla_zap_new(atom/movable/source, energy, datum/event_args/tesla_zap_initiation/initiation)

	var/datum/event_args/tesla_zap/


#warn impl
