//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

/**
 * default ranged weapon supertype that has functional binds to use a gun.
 */
/obj/item/vehicle_module/weapon/ranged/gun
	/// bound gun
	var/obj/item/gun/internal_gun

	/// attempt to auto-generate ammo storage
	var/ammo_magazines_should_auto_generate = TRUE
	/// remove the need to manually reload and have the gun directly feed from magazines
	/// * overrides gun settings and will use ballistic API invasively to modify the gun.
	///   this should generally not be used.
	var/ammo_magazines_directly_feed = FALSE

	/// ammo storage magazines for ballistic (/obj/item/ammo_casing) ammo
	/// * these are external to the gun
	/// * the gun has its own magazine
	/// * we do not support revolver/microbattery/special magazine handling; all magazines
	///   are treated as a normal magazine.
	/// * key is caliber
	/// TODO: ammotype switching support, the magazine should probably handle it for us
	var/list/obj/item/ammo_magazine/vehicle/ballistic_ammo_magazines

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
	. = ..()

/obj/item/vehicle_module/weapon/ranged/gun/proc/attempt_reload(datum/event_args/actor/actor, obj/item/gun/reloading, obj/item/ammo_magazine/vehicle_internal/use_magazine)

#warn impl all
