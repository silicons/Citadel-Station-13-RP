//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

SUBSYSTEM_DEF(events_new)
	name = "Events"
	wait = 10 SECONDS

	/// active events
	var/list/datum/event_new/active

/datum/controller/subsystem/events_new/Initialize()
	#warn impl
	return ..()

/datum/controller/subsystem/events_new/fire(resumed)
	#warn impl
