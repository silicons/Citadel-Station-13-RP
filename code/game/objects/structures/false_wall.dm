//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

/obj/structure/false_wall
	name = /turf/simulated/wall::name
	desc = /turf/simulated/wall::desc

	#warn sprites ?

	CanAtmosPass = ATMOS_PASS_DENSITY
	CanAtmosPassVertical = ATMOS_PASS_DENSITY

	var/datum/prototype/material/material_base
	var/datum/prototype/material/material_reinf
	var/datum/prototype/material/material_girder

/obj/structure/false_wall/Initialize(mapload, material_base, material_reinf, material_girder)

	return ..()
#warn impl

/obj/structure/false_wall/update_icon()
	. = ..()

/obj/structure/false_wall/proc/mimic_our_wall()
	#warn make sure to match name/desc with the real thing

/obj/structure/false_wall/proc/toggle_open()

	var/turf/location = get_turf(src)
	location?.queue_zone_update()

/obj/structure/false_wall/dynamic_tool_query(obj/item/I, datum/event_args/actor/clickchain/e_args)
	. = ..()

/obj/structure/false_wall/tool_act(obj/item/I, datum/event_args/actor/clickchain/e_args, function, flags, hint)
	. = ..()

/obj/structure/false_wall/drop_products(method, atom/where)
	. = ..()

