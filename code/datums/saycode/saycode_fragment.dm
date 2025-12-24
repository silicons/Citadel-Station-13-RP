//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

/**
 * A fragment of saycode data. Goes with `/datum/saycode_packet`
 */
/datum/saycode_fragment
	/// cached html
	/// * make sure to invalidate this if anything changes
	var/tmp/cached_html

/datum/saycode_fragment/clone(include_contents)
	var/datum/saycode_fragment/fragment = new
	fragment.message = message
	fragment.spans = spans?.Copy()
	fragment.language_id = language_id
	fragment.saycode_type = saycode_type
	return fragment

/**
 * Interpolates us into text.
 *
 * * This should be 100% deterministic based on arguments and parameters.
 *
 * @params
 * * context - the context used to say, if it exists
 */
/datum/saycode_fragment/proc/render() as text
	return message

/datum/saycode_fragment/proc/render_cached() as text

#warn impl

//* Fragments *//

/datum/saycode_fragment/user_message
	/// message that comprises this
	var/message
	/// the list of spans, as raw text, to apply to the message
	var/list/spans
	/// language id of message
	var/language_id = /datum/prototype/language/common::id
	/// saycode type; uses SAYCODE_TYPE_* defines.
	///
	/// * This means that a message can theoretically have multiple different saycode types.
	var/saycode_type = SAYCODE_TYPE_ALWAYS

/**
 * The actor name.
 */
/datum/saycode_fragment/actor_name

#warn impl
