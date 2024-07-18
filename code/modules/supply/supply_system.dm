//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 silicons                             *//

/**
 * a single cargo system
 */
/datum/supply_system2
	/// id; must be unique
	var/id
	/// transports; set to typepaths to init
	var/list/datum/supply_transport2/transports

#warn impl
