//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

/**
 * behold, the proc powering the trainwreck that is our economy system.
 *
 * @params
 * * actor - actor event_args
 * * target - target entity. must be a movable atom.
 * * using_item - thing being used as currency
 * * amount - amount required
 * * currency_types - CURRENCY_TYPE_*'s allowed
 * * payment_flags - PAYMENT_FLAG_*'s
 * *
 * * handler -
 *
 * @return amount paid, or null on a full invocation failure
 */
/datum/controller/subsystem/economy/proc/attempt_actor_currency_payment(
	datum/event_args/actor/actor,
	atom/movable/target,
	obj/item/using_item,
	amount,
	currency_types,
	payment_flags,
)

#warn impl
