//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

/**
 * # Vehicle Chassis Datum
 *
 * * Vehicle chassis are prototypes and therefore are global singletons.
 */
/datum/prototype/vehicle_chassis
	/// an unkeyed list of hardpoints
	/// * set to list of `/datum/vehicle_hardpoint` types to init
	/// * `/obj/item/vehicle_module`'s can dynamically register new hardpoints; use that if needed
	var/list/intrinsic_hardpoints = list()

/datum/prototype/vehicle_chassis/New()

#warn impl all.
