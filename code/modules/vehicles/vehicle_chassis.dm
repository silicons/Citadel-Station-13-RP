//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

/**
 * # Vehicle Chassis Datum
 *
 * * Vehicle chassis are prototypes and therefore are global singletons.
 */
/datum/prototype/vehicle_chassis
	/// an unkeyed list of hardpoints
	/// * set to list of types to init
	/// * ids must be manually set; recommended syntax is `/datum/vehicle_hardpoint/your/type{id = "some-string"}`.
	var/list/datum/vehicle_hardpoint/hardpoints = list()

/datum/prototype/vehicle_chassis/New()
	#warn init hardpoints
