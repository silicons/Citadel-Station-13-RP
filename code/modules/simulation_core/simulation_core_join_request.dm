//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

/datum/simulation_core_join_request
	var/mob/observer/dead/requesting
	var/their_name
	var/their_message
	var/datum/simulation_core/simulation

/datum/simulation_core_join_request/New(datum/simulation_core/core, mob/obserrver/dead/requester)
	src.simulation = core
	src.requesting = requester

/datum/simulation_core_join_request/Destroy()
	#warn impl
	return ..()


#warn impl
