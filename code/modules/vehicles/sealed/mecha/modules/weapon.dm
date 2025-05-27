//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

/**
 * master supertype of all weapons, melee and ranged
 *
 * * default behavior: attempts ranged, then melee, as applicable
 * * if harm intent: attempts melee, then ranged, as applicable
 *
 * -- notes --
 * * this is just simple baby-usable default bindings for weapons.
 *   you can make your own mech weapons, this just provides simplified bindings for you.
 */
/obj/item/vehicle_module/weapon

/obj/item/vehicle_module/weapon/module_attack_chain(atom/movable/mounted_on, datum/event_args/actor/clickchain/clickchain, clickchain_flags)
	. = ..()
	if(. & CLICKCHAIN_FLAGS_INTERACT_ABORT)
		return
	var/try_melee = FALSE
	if(clickchain_flags & CLICKCHAIN_HAS_PROXIMITY)
		var/try_melee = TRUE
	if(clickchain.using_intent == INTENT_HARM)
		if(try_melee)
			. = attempt_melee_attack(mounted_on, clickchain, clickchain_flags)
			if(. & CLICKCHAIN_FLAGS_INTERACT_ABORT)
				return
		. = attempt_ranged_attack(mounted_on, clickchain, clickchain_flags)
		if(. & CLICKCHAIN_FLAGS_INTERACT_ABORT)
			return
	else
		. = attempt_ranged_attack(mounted_on, clickchain, clickchain_flags)
		if(. & CLICKCHAIN_FLAGS_INTERACT_ABORT)
			return
		if(try_melee)
			. = attempt_melee_attack(mounted_on, clickchain, clickchain_flags)
			if(. & CLICKCHAIN_FLAGS_INTERACT_ABORT)
				return

/**
 * called to perform an attack
 * * make sure to return CLICKCHAIN_DID_SOMETHING if you, well, did something, so we don't do melee/ranged at the same time.
 *
 * @return CLICKCHAIN_* flags
 */
/obj/item/vehicle_module/weapon/proc/attempt_ranged_attack(atom/movable/mounted_on, datum/event_args/actor/clickchain/clickchain, clickchain_flags)
	. = clickchain_flags
	if(simple_ranged_attack(mounted_on, clickchain.target, clickchain, clickchain.click_params, clickchain.using_intent))
		. |= CLICKCHAIN_DID_SOMETHING

/**
 * called to perform an attack
 * * make sure to return CLICKCHAIN_DID_SOMETHING if you, well, did something, so we don't do melee/ranged at the same time.
 *
 * @return CLICKCHAIN_* flags
 */
/obj/item/vehicle_module/weapon/proc/attempt_melee_attack(atom/movable/mounted_on, datum/event_args/actor/clickchain/clickchain, clickchain_flags)
	. = clickchain_flags
	if(simple_melee_attack(mounted_on, clickchain.target, clickchain, clickchain.click_params, clickchain.using_intent))
		. |= CLICKCHAIN_DID_SOMETHING

/**
 * override this and return TRUE for your weapon to do an attack on a melee attempt
 * * this is the simple version of the normal attempt_x_attack's, for people who don't want to mess with click handling details.
 *
 * @params
 * * chassis - thing we're attacking from. can be self, if we're unmounted.
 * * target - thing clicked
 * * actor - person doing the clicking as actor tuple - use this for feedback
 * * params - click params
 * * intent - attack intent
 *
 * @return TRUE if handled
 */
/obj/item/vehicle_module/weapon/proc/simple_ranged_attack(atom/movable/chassis, atom/movable/target, datum/event_args/actor/actor, list/params, intent)
	return FALSE

/**
 * override this and return TRUE for your weapon to do an attack on a melee attempt
 * * this is the simple version of the normal attempt_x_attack's, for people who don't want to mess with click handling details.
 *
 * @params
 * * chassis - thing we're attacking from. can be self, if we're unmounted.
 * * target - thing clicked
 * * actor - person doing the clicking as actor tuple - use this for feedback
 * * params - click params
 * * intent - attack intent
 *
 * @return TRUE if handled
 */
/obj/item/vehicle_module/weapon/proc/simple_melee_attack(atom/movable/chassis, atom/movable/target, datum/event_args/actor/actor, list/params, intent)
	return FALSE
