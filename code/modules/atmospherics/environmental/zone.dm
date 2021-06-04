/**
 * ZAS zones
 */
/datum/zone
	/// Air contents of the zone
	var/datum/gas_mixture/air








/**
 * Immutable zones - globally cached for AIR_STATUS_IMMUTABLE turfs
 */
/datum/zone/immutable

/datum/zone/immutable/New(gas_string)
	air = new /datum/gas_mixture/immutable(null, gas_string)
