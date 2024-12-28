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
 * @return CURRENCY_STATIC_TYPE_* we are
 */
/obj/item/proc/static_currency_query()
	return NONE

/**
 * @return amount of static currency we count as
 */
/obj/item/proc/static_currency_amount()
	return 0

/**
 * @return amount of static currency used
 */
/obj/item/proc/static_currency_use_checked(amount, require_remaining)
	return static_currency_amount() >= (amount + require_remaining) ? static_currency_use(amount) : 0

/**
 * @return amount of static currency used
 */
/obj/item/proc/static_currency_use(amount, require_remaining)
	return 0

/**
 * displays / broadcasts default feedback from someone using us as static currency
 *
 * * can be called after qdel.
 * * it is recommended to not use this if you know the currency type and want something special,
 *   as the feedback done in this way is generally extremely generic.
 * * target must be supplied; it is **not** inferred from a clickchain event_args even if one is provided!
 *
 * @params
 * * actor - actor event args used for rendering feedback and providing AV redirect
 * * amount - amount paid
 * * target - target atom
 * * fail_reason - (optional) if specified, we failed; emit a fail message instead.
 * * range - (optional) range to emit; this is a suggestion, and the item being used as currency
 *           reserves the right to force its own ranges.
 */
/obj/item/proc/static_currency_emit_feedback(datum/event_args/actor/actor, amount, atom/target, fail_reason, range)
	return
