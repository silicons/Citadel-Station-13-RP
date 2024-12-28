//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

/**
 * Dynamic currency API.
 *
 * Dynamic currency API is referred to as 'dynamic' because it has
 * a lot more logic, can query the user, sleep / block, etc.
 */

/**
 * dynamic payment proc - this **can** block since some methods **will** query the user for details!
 *
 * behold, a trainwreck.
 *
 * @params
 * user - (optional) mobless is possible, otherwise user
 * predicate - thing we're paying into. it will be queried for log information if needed with query_transaction_details()
 * amount - amount to charge
 * force - charge even if amount is under, use for stuff like atm deposits/money drains
 * prevent_types - payment_types to block
 * data - arbitrary list provided by the predicate, fed back into it during query_transaction_details. the proc **can** feed things back into it, like error messages!
 *
 * @returns amount paid
 */
/obj/item/proc/attempt_dynamic_currency(mob/user, atom/movable/predicate, amount, force, prevent_types, list/data = list(), silent, visual_range = 7)
	. = PAYMENT_NOT_CURRENCY
	var/list/iterating  = list()
	// todo: this is all bad. notice how we are calling on the component and not ourselves?
	SEND_SIGNAL(src, COMSIG_ITEM_DYNAMIC_CURRENCY_QUERY, iterating)
	if(length(iterating))
		for(var/datum/D in iterating)
			var/ret = SEND_SIGNAL(D, COMSIG_ITEM_DYNAMIC_CURRENCY_CALL, user, predicate, amount, force, prevent_types, data, silent, visual_range)
			if(ret & COMPONENT_HANDLED_PAYMENT)
				// make sure they're not an idiot, and aren't forgetting to use our api
				if(!(force? data[DYNAMIC_PAYMENT_DATA_PAID_AMOUNT] < 0 : data[DYNAMIC_PAYMENT_DATA_PAID_AMOUNT] == amount))
					CRASH("[D]([D.type]) was coded by a monkey and didn't match required amount! force: [force], amount: [amount], returned: [data[DYNAMIC_PAYMENT_DATA_PAID_AMOUNT]].")
				. = data[DYNAMIC_PAYMENT_DATA_PAID_AMOUNT]
				// upon handle, we immediately break
				break
			else if(ret & COMPONENT_ERRORED_PAYMENT)
				return PAYMENT_DYNAMIC_ERROR
				// upon error, we immediately break
			else if(ret & COMPONENT_INSUFFICIENT_PAYMENT)
				. = PAYMENT_INSUFFICIENT
				// don't return, next component might override yet!

/**
 * handles attempting to use an item for an automatic payment using default handling
 * use this proc for simpler things.
 *
 * behold, a trainwreck.
 *
 * @params
 * user - (optional) mobless is possible, otherwise user
 * predicate - thing we're paying into. it will be queried for log information if needed with query_transaction_details()
 * amount - amount to charge
 * force - charge even if amount is under, use for stuff like atm deposits/money drains
 * prevent_types - payment_types to block
 * reason - payment reason for transaction logs
 * data - arbitrary list provided by the predicate, fed back into it during query_transaction_details. the proc **can** feed things back into it, like error messages and payment accounts!
 * silent - suppress all feedback
 * visual_range - feedback/message range
 *
 * @returns amount paid, or payment failure enum
 */
/obj/item/proc/attempt_use_currency(mob/user, atom/movable/predicate, amount, force, prevent_types, list/data = list(), silent, visual_range = 7)
	. = PAYMENT_NOT_CURRENCY
	// check static currency
	if(is_static_currency(prevent_types))
		. = consume_static_currency(amount, force, user, predicate, silent? 0 : visual_range)
		if(. >= PAYMENT_SUCCESS)
			return
	. = attempt_dynamic_currency(user, predicate, amount, force, prevent_types, data, silent, visual_range)
	if(data[DYNAMIC_PAYMENT_DATA_PAID_AMOUNT] && !(. > PAYMENT_SUCCESS))
		stack_trace("mismatch between datalist paid amount and payment success")
		. = data[DYNAMIC_PAYMENT_DATA_PAID_AMOUNT]

/**
 * datum proc called when auto_consume_currency is used, as well as any manual use cases
 *
 * used to return data on its identity and info
 * must return a data list
 */
/datum/proc/query_transaction_details(list/data)
	return list(
		CHARGE_DETAIL_LOCATION = "Unknown",
		CHARGE_DETAIL_RECIPIENT = "Unknown",
		CHARGE_DETAIL_DEVICE = "Unknown",
		CHARGE_DETAIL_REASON = "Unknown"
	)
