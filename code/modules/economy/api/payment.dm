//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

/**
 * behold, the proc powering the trainwreck that is our economy system.
 *
 * @params
 * * actor - actor event_args
 * * using_item - thing being used as currency
 * * amount - amount required
 * * payment_flags - PAYMENT_FLAG_*'s
 * *
 */
/datum/controller/subsystem/economy/proc/attempt_actor_currency_payment(
	datum/event_args/actor/actor,
	obj/item/using_item,
	amount,
	payment_flags,

)

#warn impl


/**
 * consumes our value as currency
 * this **can** cause us to delete!
 *
 * @params
 * - amount - amount to consume
 * - force - consume even if there isn't enough. use INFINITY and force = TRUE for things like ATM deposits
 * - user - used for visual feedback
 * - target - used for visual feedback
 * - range - used for visual feedback
 *
 * @return amount consumed, or a payment status enum
 */
/obj/item/proc/consume_static_currency(amount, force, mob/user, atom/target, range)
	return PAYMENT_NOT_CURRENCY

/**
 * displays feedback upon being used as static currency by a person
 *
 * **due to consume_static_currency potentially deleting us, it is on the item to call this proc, not the main proc!**
 */
/obj/item/proc/do_static_currency_feedback(amount, mob/user, atom/target, range)
	return
