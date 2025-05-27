//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

/obj/item/vehicle_module

/obj/item/vehicle_module/using_item_on(obj/item/using, datum/event_args/actor/clickchain/clickchain, clickchain_flags)
	. = ..()
	if(. & CLICKCHAIN_FLAGS_INTERACT_ABORT)
		return
	return receive_using_item_on(using, clickchain, clickchain_flags)

//* Chassis - Physicality *//

/**
 * Returns if our mount is sufficiently close to something to be considered adjacent.
 *
 * * This is usually our mech.
 * * If we are not mounted, this always fails.
 */
/obj/item/vehicle_module/proc/sufficiently_adjacent(atom/entity)
	return chassis?.sufficiently_adjacent(entity)

//* Interactions *//

/**
 * Called to handle item attack chain (using_item_on) on our chassis (whether that's a vehicle or something else)
 * or a normal item attack chain
 *
 * @params
 * * using - the item
 * * clickchain - clickchain data
 * * clickchain_flags - clickchain flags
 * * from_mounted_on - the thing actually receiving the click. null if it's from our own using_item_on.
 *
 * @return CLICKCHAIN_* flags
 */
/obj/item/vehicle_module/proc/receive_using_item_on(obj/item/using, datum/event_args/actor/clickchain/clickchain, clickchain_flags, atom/movable/from_mounted_on)
	SHOULD_NOT_SLEEP(TRUE)
	return clickchain_flags
	#warn hook on chassis

//* Usage - World *//

/**
 * Called when being used by a pilot on the world.
 * * This is a very complex binding because we are not necessarily mounted or used by a vehicle
 *   when this happens.
 * * We can, however, expect that we are properly item-mounted; use abstraction procs as needed
 *   for power-draw and whatnot.
 *
 * @params
 * * mounted_on - what to treat as the root object. this is a mob if it's mounted on a rigsuit, ourselves
 *                if we're not ontop of anything, a vehicle if we're on a vehicle, etc. This should only be
 *                used for adjacency checks in general; avoid using typecasts or directly accessing this.
 * * clickchain - data of the click.
 *
 * @return CLICKCHAIN_* flags
 */
/obj/item/vehicle_module/proc/module_attack_chain(atom/movable/mounted_on, datum/event_args/actor/clickchain/clickchain, clickchain_flags)
	return clickchain_flags
