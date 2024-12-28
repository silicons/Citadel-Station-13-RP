//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

/**
 * behold, the proc powering the trainwreck that is our economy system.
 *
 * todo: should this perform more feedback on failure?
 *
 * ## Data
 *
 * The `data` param is a custom key-value associative format.
 * * This is used by things like bank-linked ID cards to perform authentication and logging.
 * * This is **also** used for admin logging.
 * * While not recommended, this is **also** implementation-defined to be usable
 *   by the thing performing the payment.
 *
 * @params
 * * actor - actor event_args
 * * target - target entity. must be a movable atom.
 * * using_item - thing being used as currency
 * * amount - amount required
 * * currency_types - CURRENCY_TYPE_*'s allowed
 * * payment_flags - PAYMENT_FLAG_*'s
 * * data - (optional) data injection/extraction list; k-v with keys of PAYMENT_DATA_*.
 *
 * @return amount paid, or null on a full invocation failure
 */
#warn verbose-ly log this with a new modules/logging API or something
/datum/controller/subsystem/economy/proc/attempt_actor_currency_payment(
	datum/event_args/actor/actor,
	atom/movable/target,
	obj/item/using_item,
	amount,
	currency_types,
	payment_flags,
	list/data,
)
	// 1. attempt dynamic call; this is more expensive,
	//    but has priority over static.
	#warn impl - dynamic call

	// 2. attempt static call
	var/list/static_currency_query = using_item.static_currency_query()
	if(isnull(static_currency_query))
		return null
	var/static_amount = static_currency_query[STATIC_CURRENCY_QUERY_IDX_AMOUNT]
	var/static_type = static_currency_query[STATIC_CURRENCY_QUERY_IDX_TYPE]
	var/static_hint = static_currency_query[STATIC_CURRENCY_QUERY_IDX_HINT]

	if(static_type & currency_types)
	else
		return null

	// todo: handle error conditions / feedback (e.g. discrete currency can't be split)
	//       instead of just generic '0' return.

	var/used = using_item.static_currency_consume(static_amount, payment_flags & PAYMENT_FLAG_CHECKED, 0, payment_flags & PAYMENT_FLAG_OVERFLOW)
	using_item.static_currency_feedback(actor, target, used, payment_flags)
	return used

#warn impl
