//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 silicons                             *//

//* Initialization *//

/**
 * Called after all areas are made and all turfs are there,
 * but before atoms initialization.
 *
 * Used to auto-register everything
 *
 * **Extremely dangerous proc. Don't call it unless you know what you're doing.**
 */
/datum/shuttle/proc/before_bounds_init(datum/turf_reservation/from_reservation, datum/shuttle_template/from_template)
	SHOULD_NOT_OVERRIDE(TRUE)

/**
 * Called after the bounds have initialized their atoms/areas
 *
 * **Extremely dangerous proc. Don't call / override it unless you know what you're doing.**
 */
/datum/shuttle/proc/after_bounds_init(datum/turf_reservation/from_reservation, datum/shuttle_template/from_template)
	return
