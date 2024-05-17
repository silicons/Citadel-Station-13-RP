//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 silicons                             *//

GLOBAL_DATUM_INIT(clockwork_network, /datum/clockwork_network, new)

/world/max_z_changed(old_z_count, new_z_count)
	. = ..()
	GLOB.clockwork_network?.on_max_z_changed(old_z_count, new_z_count)

/**
 * the Hierophant Network
 *
 * while alignments are effectively factions, the Hierophant Network
 * is global, unique, and eternal.
 *
 * subnets are created as necessary
 *
 * this also serves as our global subsystme-like, because
 * enigmas aren't important enough for subsystems of their own generally.
 *
 * not to mention, as a science-fantasy based system, clockwork cult is
 * very physically grounded, meaning there shouldn't be much 'global magical modifiers'
 * applied to the round that affects behavior.
 *
 * this means that state should be able to be rebuilt from just the entities on the game board,
 * including the players, as opposed to requiring global state.
 */
/datum/clockwork_network
	// todo: at some point all this needs to be stored on overmaps or sectors or something lmao
	// we assume overmap entites aren't deleted. if they are, L, rip, bozo.
	// same for stacks.

	/// lookup: overmap entity
	var/list/subnet_by_overmap_entity = list()
	/// lookup: sector
	var/list/subnet_by_planet = list()
	/// lookup: level
	var/list/subnet_by_level = list()
	/// lookup: cache by z; hit first.
	var/list/subnet_lookup = list()

/datum/clockwork_network/New()
	START_PROCESSING(SSobjs, src)

/datum/clockwork_network/Destroy()
	STOP_PROCESSING(SSobjs, src)
	return ..()

/datum/clockwork_network/process(delta_time)
	for(var/datum/clockwork_subnet/net as anything in GLOB.clockwork_subnets)
		net.process(delta_time)

/datum/clockwork_network/proc/on_max_z_changed(old_z_count, new_z_count)
	subnet_lookup.len = new_z_count

/datum/clockwork_network/proc/subnet_for_level_index(z)
	RETURN_TYPE(/datum/clockwork_subnet)

	. = subnet_lookup[z]
	if(!isnull(.))
		return

	subnet_lookup[z] = . = resolve_subnet_for_level_index(z)

/datum/clockwork_network/proc/resolve_subnet_for_level_index(z)
	// priority 1: overmap
	var/obj/overmap/entity/overmap_entity = get_overmap_sector(z)
	if(overmap_entity)
		if(!subnet_by_overmap_entity[overmap_entity])
			subnet_by_overmap_entity[overmap_entity] = new /datum/clockwork_subnet
		return subnet_by_overmap_entity[overmap_entity]
	// priority 2: sector
	var/datum/planet/sector = SSplanets.z_to_planet[z]
	if(sector)
		if(!subnet_by_planet[sector])
			subnet_by_planet[sector] = new /datum/clockwork_subnet
		return subnet_by_planet[sector]
	// priority 3: level
	if(!subnet_by_level[z])
		subnet_by_level[z] = new /datum/clockwork_subnet
	return subnet_by_level[z]

/**
 * call when zlevels swap around
 *
 * everything on the zlevel will slowly try to go to whatever new subnet is on it
 */
/datum/clockwork_network/proc/evict_subnets_for_level(z)
	var/datum/clockwork_subnet/subnet = resolve_subnet_for_level_index(z)
	subnet?.evict_everything()
	subnet_lookup[z] = null
