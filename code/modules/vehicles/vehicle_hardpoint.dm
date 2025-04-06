//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

/**
 * # Vehicle Hardpoint Datum
 *
 * A hardpoint on a chassis.
 *
 * In the future this will support rendering mounted modules.
 *
 * * Hardpoints are instanced, unlike their containing chassis prototypes.
 */
/datum/vehicle_hardpoint
	/// hardpoint id
	/// * must be unique on a chassis
	/// * auto-generated
	var/id
	/// was this provided by chassis?
	/// * chassis intrinsic ones are recreated if a vehicle's chassis, for whatever reason, is changed
	var/chassis_intrinsic = FALSE
	/// hardpoint type
	/// * these are not defined enums; use type::classifier to set to their value
	var/classifier = "unknown"
	/// * "this is a [vehicle], with an empty [hardpoint.display_name] on its [hardpoint.location_phrase]"
	/// * "this is a [vehicle], with \an [module.name] on its [hardpoint.location_phrase]"
	var/display_name = "socket of some kind"
	/// * "this is a [vehicle], with an empty [hardpoint.display_name] [hardpoint.location_phrase]"
	/// * "this is a [vehicle], with \an [module.name] on its [hardpoint.location_phrase]"
	var/location_phrase = "on its body"

	/// Is this currently retracted?
