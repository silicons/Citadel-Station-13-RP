/// Turf environmental procs go in this file.
/// The goal is to decouple air operations on turfs from those on zones, and have anything logically operating on only one turf use these.
/// That way, we don't care about the implementation of zones.

/**
 * Adds air to a turf.
 * Doesn't touch the giver's mixture.
 */
/turf/proc/assume_air(datum/gas_mixture/giver)

/**
 * Removes a ratio of air into a new gas mixture.
 */
/turf/proc/remove_air_ratio(ratio)

/**
 * Removes moles of air into a new gas mixture.
 */
/turf/proc/remove_air(moles)

/**
 * Removes a certain volume in liters of air into a new gas mixture.
 */
/turf/proc/remove_air_volume(liters)

/**
 * Reset our air to roundstart/initial
 */
/turf/proc/reset_air_to_default()

/**
 * Parse a gas string and add it to us
 */
/turf/proc/assume_gas_string(gas_string)
	var/datum/gas_mixture/adding = new
	adding.parse_gas_string(SSair.preprocess_gas_string(gas_string, src))
	assume_air(adding)

/**
 * Adds an amount of gas to ourselves
 */
/turf/proc/assume_gas(gastype, moles, temperature)
	var/datum/gas_mixture/adding = new		// todo: direct procs to save performance
	adding.adjust_gas(gastype, moles)
	adding.temperature = temperature
	assume_air(adding)
