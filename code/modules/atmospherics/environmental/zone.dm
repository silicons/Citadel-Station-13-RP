/**
 * ZAS zones
 */
/datum/zone
	/// Air contents of the zone
	var/datum/gas_mixture/air
	/// Turfs in this zone
	var/list/turf/turfs
	/// Size so we don't need to length()
	var/size = 0
	/// name for vv
	var/name
	/// UID
	var/id
	/// next UID
	var/static/id_next = 0

/datum/zone/New()
	if(!air)		// subtypes may override
		air = new /datum/gas_mixture
	id = ++id_next
	name = "Zone [id]"

/**
 * Adds a turf to this zone.
 */
/datum/zone/proc/add(turf/T)

/**
 * Removes a turf from this zone.
 */
/datum/zone/proc/remove(turf/T)

/**
 * Immutable zones - globally cached for AIR_STATUS_IMMUTABLE turfs
 */
/datum/zone/immutable

/datum/zone/immutable/New(gas_string)
	air = new /datum/gas_mixture/immutable(null, gas_string)
	return ..()
