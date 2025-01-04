//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

/datum/map_test/atmos_zones_shall_have_requisite_machinery
	var/zone_size_threshold = 2

/datum/map_test/atmos_zones_shall_have_requisite_machinery/run(list/zlevels)
	// all of this is questionable and relies on running synchronously
	// so SSair can't mess with zones

	var/list/datum/zas_zone/allow_no_fire_alarm = list()
	var/list/datum/zas_zone/allow_no_air_alarm = list()

	for(var/obj/map_test_marker/zone/zone_marker/allow_no_fire_alarm/marker in GLOB.map_Test_markers)
		var/turf/simulated/T = get_turf(marker)
		if(!istype(T))
			continue
		allow_no_fire_alarm[T.zone] = TRUE

	for(var/obj/map_test_marker/zone/zone_marker/allow_no_air_alarm/marker in GLOB.map_Test_markers)
		var/turf/simulated/T = get_turf(marker)
		if(!istype(T))
			continue
		allow_no_air_alarm[T.zone] = TRUE

	var/list/datum/zas_zone/has_fire_alarm = list()
	var/list/datum/zas_zone/has_air_alarm = list()

	for(var/obj/machinery/air_alarm/machine in GLOB.machines)
		var/turf/simulated/T = get_turf(machine)
		if(!istype(T))
			continue
		has_air_alarm[T.zone] = TRUE

	for(var/obj/machinery/fire_alarm/machine in GLOB.machines)
		var/turf/simulated/T = get_turf(machine)
		if(!istype(T))
			continue
		has_fire_alarm[T.zone] = TRUE

	var/list/datum/zas_zone/no_fire_alarm = SSair.zones - has_fire_alarm
	var/list/datum/zas_zone/no_air_alarm = SSair.zones - has_air_alarm

	// if zone.contents[1] runtimes let it; empty zones are a ZAS issue and we want to know about it

	for(var/datum/zas_zone/zone as anything in no_fire_alarm)
		if(!(zone.contents[1]:z in zlevels))
			continue
		if(length(zone.contents) < zone_size_threshold)
			emit_notice(pick(zone.contents), "No Fire Alarm - Allowed (Too Small)")
			continue
		if(allow_no_fire_alarm[zone])
			emit_notice(pick(zone.contents), "No Fire Alarm - Allowed (Ignore Marker Present)")
			continue
		if(locate(/datum/zas_edge/unsimulated) in zone.edges)
			emit_notice(pick(zone.contents), "No Fire Alarm - Allowed (Unsimulated Edge Present)")
			continue
		emit_error(pick(zone.contents), "No Fire Alarm", "This atmos zone lacks a fire alarm.")

	for(var/datum/zas_zone/zone as anything in no_air_alarm)
		if(!(zone.contents[1]:z in zlevels))
			continue
		if(length(zone.contents) < zone_size_threshold)
			emit_notice(pick(zone.contents), "No Air Alarm - Allowed (Too Small)")
			continue
		if(allow_no_air_alarm[zone])
			emit_notice(pick(zone.contents), "No Air Alarm - Allowed (Ignore Marker Present)")
			continue
		if(locate(/datum/zas_edge/unsimulated) in zone.edges)
			emit_notice(pick(zone.contents), "No Air Alarm - Allowed (Unsimulated Edge Present)")
			continue
		emit_error(pick(zone.contents), "No Air Alarm", "This atmos zone lacks a air alarm.")
