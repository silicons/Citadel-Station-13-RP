//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

/obj/map_test_marker/apc

/obj/map_test_marker/apc/allow_unconnected_mains

#warn sprite

/obj/map_test_marker/apc/allow_unconnected_mains/Initialize(mapload)
	..()
	return INITIALIZE_HINT_LATELOAD

/obj/map_test_marker/apc/allow_unconnected_mains/LateInitialize()
	var/obj/machinery/power/apc/apc = locate() in loc
	apc?.test_allow_unconnected_mains = TRUE
	..()
