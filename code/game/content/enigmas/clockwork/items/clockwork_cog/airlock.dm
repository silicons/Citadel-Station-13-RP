//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 silicons                             *//

/obj/machinery/airlock/clockwork_integration_construct()
	var/datum/clockwork_integration/constructing = ..()
	constructing.config.with_toggle(
		"attunedOnly",
		"Forbid Outsiders",
		"Prevent the unattuned from using the door.",
		FALSE,
	)
	constructing.config.with_toggle(
		"attunedAuto",
		"Automatically Open",
		"Automatically open for attuned users.",
		FALSE,
	)
	constructing.set_preset(
		"Seamless",
		list(
			"attunedAuto" = TRUE,
		),
		CLOCKWORK_INTEGRATION_PRESET_COOPERATIVE,
	)
	constructing.set_preset(
		"Stealthy",
		list(),
		CLOCKWORK_INTEGRATION_PRESET_STEALTH,
	)
	constructing.set_preset(
		"Takeover",
		list(
			"attunedAuto" = TRUE,
			"attunedOnly" = TRUE,
		),
		CLOCKWORK_INTEGRATION_PRESET_HOSTILE,
	)
	return constructing

// todo: allowed() needs a look-over
/obj/machinery/airlock/allowed(mob/M)
	. = ..()

#warn impl
