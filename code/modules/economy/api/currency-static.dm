//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

/**
 * Static currency API.
 *
 * Static, in this case, refers to the fact that this only operates off of a few procs,
 * has no special semantics, etc.
 *
 * It just consumes the currency and proceeds.
 */

/**
 * static currency
 *
 * these procs are used to determine if something is considered static currency and how much it's worth
 * static currency should never need logic to determine payment ability and/or worth
 *
 * because i hate everyone and myself but not *that* much, static currency can either logically be
 * a stack (cash, holochips, chargecards), or a discrete object like a coin
 *
 * i would code support for "stack of objects" to force people to roleplay counting dollar bills but that's too CPU-intensive to calculate
 * (see: coin counting problem)
 */

/**
 * returns if we are valid static currency for the given payment types
 *
 * @params
 * - prevent_types - these types aren't allowed
 */
/obj/item/proc/is_static_currency(prevent_types)
	return NOT_STATIC_CURRENCY

/**
 * returns our value as currency
 */
/obj/item/proc/amount_static_currency()
	return 0

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
