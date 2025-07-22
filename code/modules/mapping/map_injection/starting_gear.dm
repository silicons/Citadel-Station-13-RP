//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 silicons                             *//

/**
 * injects starting gear and equipment into maps.
 */
/datum/map_injection/starting_gear
	var/list/datum/map_starting_gear/gear_packs

/datum/map_injection/starting_gear/New(list/datum/map_starting_gear/packs)
	packs = collate_map_starting_gear_packs(packs)
	src.gear_packs = packs

/datum/map_injection/starting_gear/injection(datum/dmm_context/context)
	for(var/datum/map_starting_gear/pack as anything in gear_packs)
		pack.inject(context)
	return ..()
