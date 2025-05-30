//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

/**
 * default ranged weapon supertype that has functional binds to use a gun.
 *
 * * for simplicity of the common case, one module can only bind one gun. multi-gun support
 *   (e.g. a machinegun with a grenade launcher) will eventually be added with module-in-module
 *   support where a module attaches another module. this way we don't need overly complex
 *   routing.
 */
/obj/item/vehicle_module/weapon/ranged/gun
	/// bound gun
	var/obj/item/gun/internal_gun

/obj/item/vehicle_module/weapon/ranged/gun/Initialize(mapload)
	. = ..()
	if(ispath(internal_gun))
		internal_gun = new internal_gun(src)

/obj/item/vehicle_module/weapon/ranged/gun/Destroy()
	QDEL_NULL(internal_gun)
	return ..()

/obj/item/vehicle_module/weapon/ranged/gun/attempt_ranged_attack(atom/movable/mounted_on, datum/event_args/actor/clickchain/clickchain, clickchain_flags)
	. = ..()
	if(. & CLICKCHAIN_FLAGS_INTERACT_ABORT)
		return
	return attempt_fire(mounted_on, clickchain, clickchain_flags)

/obj/item/vehicle_module/weapon/ranged/gun/receive_using_item_on(obj/item/using, datum/event_args/actor/clickchain/clickchain, clickchain_flags, atom/movable/from_mounted_on)
	. = ..()
	if(. & CLICKCHAIN_FLAGS_INTERACT_ABORT)
		return
	#warn handle reload

/obj/item/vehicle_module/weapon/ranged/gun/proc/attempt_fire(atom/movable/mounted_on, datum/event_args/actor/clickchain/clickchain, clickchain_flags)

#warn impl all
