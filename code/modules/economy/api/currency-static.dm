//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

/**
 * Static currency API.
 *
 * * Static, in this case, refers to the fact that this only operates off of a few procs,
 * has no special semantics, etc. It just consumes the currency and proceeds.
 * * If any part of the API is defined on a path, all of it must be defined for things to work correctly.
 */

/**
 * Implementation Rules:
 * * Obey the list format.
 *
 * @return list(amount, type, hint) as per STATIC_CURRENCY_QUERY_IDX_* list indices, or null if not currency
 */
/obj/item/proc/static_currency_query(outptr_amount, outptr_type, outptr_hint)
	SHOULD_NOT_SLEEP(TRUE)

/**
 * * This intentionally doesn't accept currency type. You should check that before calling this.
 *
 * Implementation Rules:
 * * If something is a discrete entity, AND less than its value is requested, AND overflow is not allowed,
 *   then the entire amount should be rejected and `0` should be returned.
 *
 * @params
 * * amount - amount to use
 * * checked - (optional) must use the full amount
 * * reserve - (optional) must leave that amonut remaining
 * * overflow - (optional) allow giving more than was requested; useful for giving change on discrete currency types.
 *
 * @return amount used; null if this is not valid static currency
 */
/obj/item/proc/static_currency_consume(amount, checked, reserve, overflow)
	SHOULD_NOT_SLEEP(TRUE)

/**
 * displays / broadcasts default feedback from someone using us as static currency
 *
 * * can be called after qdel.
 * * it is recommended to suppress this invocation if you know the currency type and want something special,
 *   as the feedback done in this way is generally extremely generic.
 * * target must be supplied; it is **not** inferred from a clickchain event_args even if one is provided!
 *
 * @params
 * * actor - actor event args used for rendering feedback and providing AV redirect
 * * amount - amount paid
 * * target - target atom
 */
/obj/item/proc/static_currency_feedback(datum/event_args/actor/actor, amount, atom/target)
	SHOULD_NOT_SLEEP(TRUE)
