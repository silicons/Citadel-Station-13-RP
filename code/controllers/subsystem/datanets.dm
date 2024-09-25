//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

SUBSYSTEM_DEF(datanets)
	name = "Datanets"
	subsystem_flags = SS_NO_FIRE

	//* Devices *//

	/// registered devices by ID
	///
	/// * only devices with device ID's are in here
	/// * tl;dr this should only contain stuff that persistent objects might reference by id,
	///   like PDAs, etc
	var/static/datum/datanet_device/datanet_device_lookup = list()

	//* Networks *//

	#warn ???

/datum/controller/subsystem/datanets/Initialize()
	#warn impl
	return ..()

// todo: Recover()

#warn impl

/datum/controller/subsystem/datanets/proc/assign_next_network_id()
	#warn impl

/datum/controller/subsystem/datanets/proc/assign_next_device_id()
	#warn impl
