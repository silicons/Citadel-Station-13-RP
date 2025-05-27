//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

/**
 * Called when a controller clicks to interact as us without using a module
 * * the click is already validated at this point.
 *
 * @return CLICKCHAIN_* flags
 */
/obj/vehicle/proc/handle_clickchain_unarmed_usage(datum/event_args/actor/clickchain/clickchain, clickchain_flags)
	return NONE

/**
 * Called when a controller attempts to use a module via click.
 * * the click is already validated at this point.
 * * the module is validated to exist at this point.
 *
 * @return CLICKCHAIN_* flags
 */
/obj/vehicle/proc/handle_clickchain_module_usage(obj/item/vehicle_module/module, datum/event_args/actor/clickchain/clickchain, clickchain_flags)
	return module.module_attack_chain(src, clickchain, clickchain_flags)

/obj/vehicle/proc/handle_clickchain_item_usage(obj/item/held_item, datum/event_args/actor/clickchain/clickchain, clickchain_flags)
	// Unused stub for mech hands.

#warn hook in uanrmed/module usage
