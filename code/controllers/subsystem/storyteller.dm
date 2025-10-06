//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

SUBSYSTEM_DEF(storyteller)
	name = "Storyteller"
	wait = 10 SECONDS

	/// active storyteller
	var/datum/storyteller/storyteller

/datum/controller/subsystem/storyteller/Initialize()
	#warn impl
	return ..()

/datum/controller/subsystem/storyteller/proc/create_storyteller()
	#warn impl


/datum/controller/subsystem/storyteller/fire(resumed)
	#warn impl
