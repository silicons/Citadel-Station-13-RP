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
/obj/item/vehicle_module/weapon/ranged/gun/ballistic
	/// remove the need to manually reload and have the gun directly feed from magazines
	/// * overrides gun settings and will use ballistic API invasively to modify the gun.
	///   this should generally not be used.
	/// * usually,
	var/ballistic_direct_feed = FALSE

	/// ammo storage magazine for ballistic (/obj/item/ammo_casing) ammo
	/// * this is external to the gun
	/// * the gun has its own magazine
	/// * this magazine can accept any caliber we accept.
	/// TODO: ammotype switching support, the magazine should probably handle it for us
	var/obj/item/ammo_magazine/vehicle_internal/internal_magazine

	/// autodetect / auto-make internal magazine
	/// * this should usually be on
	/// * this expects a gun with only one caliber as its caliber var,
	///   and won't properly detect multi-caliber guns for now
	var/internal_magazine_auto = TRUE
	/// auto-provision: rounds to hold in internal magazine for single caliber
	var/internal_magazine_auto_capacity = 100

/obj/item/vehicle_module/weapon/ranged/gun/ballistic/Initialize(mapload)
	. = ..()
	if(ispath(internal_gun))
		internal_gun = new internal_gun(src)
	if(internal_magazine_auto)
		#warn make magazine

/obj/item/vehicle_module/weapon/ranged/gun/ballistic/Destroy()
	QDEL_NULL(internal_gun)
	QDEL_NULL(internal_magazine)
	return ..()

/obj/item/vehicle_module/weapon/ranged/gun/ballistic/receive_using_item_on(obj/item/using, datum/event_args/actor/clickchain/clickchain, clickchain_flags, atom/movable/from_mounted_on)
	. = ..()
	if(. & CLICKCHAIN_FLAGS_INTERACT_ABORT)
		return
	#warn handle reload

/**
 * Attempts to refill our internal magazine.
 */
/obj/item/vehicle_module/weapon/ranged/gun/ballistic/proc/attempt_refill(datum/event_args/actor/actor, obj/item/ammo_magazine/use_magazine)

/**
 * Attempts to reload the internal gun.
 */
/obj/item/vehicle_module/weapon/ranged/gun/ballistic/proc/attempt_reload(datum/event_args/actor/actor)

#warn impl all
