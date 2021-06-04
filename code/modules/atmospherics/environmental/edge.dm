/**
 * ZAS zone edges
 * Used to manage airflow.
 */
/datum/zone_edge
	/// First zone
	var/datum/zone/A
	/// Second zone
	var/datum/zone/B

/datum/zone_edge/New(datum/zone/A, datum/zone/B)
	src.A = A
	src.B = B

/**
 * Immutable air zone edges
 * Zone B is immutable, while Zone A is fully simulated
 */
/datum/zone_edge/immutable/New(datum/zone/A, datum/zone/B)
	..()
	ASSERT(istype(B, /datum/zone/immutable))
