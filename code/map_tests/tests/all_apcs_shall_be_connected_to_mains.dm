//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

/datum/map_test/all_apcs_shall_be_connected_to_mains

/datum/map_test/all_apcs_shall_be_connected_to_mains/run(list/zlevels)
	var/list/datum/powernet/mains_powernets = list()

	for(var/obj/map_test_marker/powernet/mains_marker/mains_marker in GLOB.map_test_markers)

	for(var/obj/machinery/power/apc/apc in GLOB.apcs)
		if(apc.test_allow_unconnected_mains)
			continue

#warn impl
