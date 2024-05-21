//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 silicons                             *//

// todo: re-evaluate if clockwork machinery should even be /machinery
// todo: then again, /machinery should be malleable enough to allow for it anyways so..
/obj/machinery/clockwork
	/// connected subnet
	var/datum/clockwork_subnet/connected_subnet

	/// shards to drop on destruction
	var/drop_shard_count = 3
	/// sheets of epoch metal to drop on destruction
	var/drop_metal_count = 0
	/// sheets of epoch glass to drop on destruction
	var/drop_glass_count = 0

/obj/machinery/clockwork/Initialize()
	connect_subnet()
	return ..()

/obj/machinery/clockwork/Destroy()
	disconnect_subnet()
	return ..()

/obj/machinery/clockwork/on_changed_z_level(old_z, new_z)
	. = ..()
	if(isnull(loc))
		disconnect_subnet()
	else
		connect_subnet()

/obj/machinery/clockwork/drop_products(method, atom/where)
	. = ..()
	if(drop_shard_count > 0)
		new /obj/item/trash/clockwork_shards(where, drop_shard_count)
	if(drop_metal_count > 0)
		new /obj/item/stack/material/clockwork_metal
	if(drop_glass_count > 0)
		new /obj/item/stack/material/clockwork_glass

/obj/machinery/clockwork/proc/connect_subnet()
	if(!isnull(connected_subnet))
		disconnect_subnet()
	var/datum/clockwork_subnet/subnet = GLOB.clockwork_network.subnet_for_level_index(get_z(src))
	if(isnull(subnet))
		return
	connected_subnet = subnet
	register_subnet(subnet)

/obj/machinery/clockwork/proc/disconnect_subnet()
	if(isnull(connected_subnet))
		return
	var/datum/clockwork_subnet/subnet = connected_subnet
	unregister_subnet(subnet)
	connected_subnet = null

/**
 * OVERRIDE THIS TO REGISTER TO THE RIGHT LIST!!!
 */
/obj/machinery/clockwork/proc/register_subnet(datum/clockwork_subnet/subnet)
	subnet.machines += src

/**
 * OVERRIDE THIS TO UNREGISTER FROM THE RIGHT LIST!!!
 */
/obj/machinery/clockwork/proc/unregister_subnet(datum/clockwork_subnet/subnet)
	subnet.machines -= src

/obj/machinery/clockwork/proc/invalidate_subnet()
	disconnect_subnet()
	// delayed for staggering rebuilds
	// this will not slow down switching networks when changing zlevels,
	// only when a zlevel is for some reason being rebuilt with objects on it (?????)
	addtimer(CALLBACK(src, PROC_REF(connect_subnet)), rand(1, 50))
