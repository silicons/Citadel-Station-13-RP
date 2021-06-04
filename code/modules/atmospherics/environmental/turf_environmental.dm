/turf
	/// Air status - determines basic properties of how we simulate this tile.
	/// Never, ever edit this without the given helper, else I'm going to find you and put lemons on your eyes.
	var/air_status = TURF_AIR_SIMULATED
	/// Initial air contents, as a specially formatted gas string.
	/// If air_status is TURF_AIR_IMMUTABLE, this is what this turf will reset its air to every tick.
	var/initial_gas_mix = GAS_STRING_TURF_DEFAULT
	/// Temporary gas mixture for holding this turf's air during rebuilds.
	var/datum/gas_mixture/air_temporary
	/// The zone this turf is in, if it isn't TURF_AIR_BLOCKED
	var/datum/zone/air_zone



/**
 * Sets a turf's air status
 */
/turf/proc/set_air_status(new_status)
	if(air_status == new_status)
		return
	air_status = new_status
	update_air_properties()

/**
 * Updates our air properties
 */
/turf/proc/update_air_properties(force_rebuild)
	switch(air_status)

