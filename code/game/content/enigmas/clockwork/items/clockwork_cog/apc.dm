//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 silicons                             *//

/obj/machinery/airlock/clockwork_integration_construct()
	var/datum/clockwork_integration/constructing = ..()
	constructing.config.with_number(
		"flatDraw",
		"Static Siphon",
		"Statically adds this much power (watts) to the APC's power usage, to siphon for the Hierophant Network.",
		0,
		CLOCKWORK_INTEGRATION_COG_APC_MAX_STATIC_DRAIN,
		1,
		0,
	)
	constructing.config.with_number(
		"dynamicDraw",
		"Dynamic Siphon Ratio",
		"Drains an additional percentage (0 to 1, for 0% to 100%) of power being consumed by the APC for the Hierophant Network. \
		 This is far more stealthy than static siphoning.",
		0,
		CLOCKWORK_INTEGRATION_COG_APC_MAX_DYNAMIC_RATIO,
		0.01,
		0.2,
	)
	return constructing

#warn impl
