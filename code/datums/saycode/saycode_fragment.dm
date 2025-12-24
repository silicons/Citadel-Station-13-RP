//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

/**
 * A fragment of saycode data. Goes with `/datum/saycode_packet`
 */
/datum/saycode_fragment
	/// cached html
	/// * make sure to invalidate this if anything changes
	var/tmp/cached_html

/**
 * Interpolates us into text.
 *
 * * This should be 100% deterministic based on arguments and parameters.
 */
/datum/saycode_fragment/proc/render() as text
	SHOULD_NOT_OVERRIDE(TRUE)
	SHOULD_NOT_SLEEP(TRUE)
	return cached_html ? cached_html : do_render

/datum/saycode_fragment/proc/do_render() as text
	return ""

/datum/saycode_fragment/proc/render_cached() as text
	SHOULD_NOT_OVERRIDE(TRUE)
	SHOULD_NOT_SLEEP(TRUE)
	return cached_html

//* Fragments *//

/datum/saycode_fragment/user_message
	/// message that comprises this
	var/message
	/// the list of spans, as raw text, to apply to the message
	var/list/spans
	/// language
	var/datum/prototype/language/language
	/// saycode type; uses SAYCODE_TYPE_* defines.
	///
	/// * This means that a message can theoretically have multiple different saycode types.
	var/saycode_type = SAYCODE_TYPE_ALWAYS

/datum/saycode_fragment/user_message/clone(include_contents)
	var/datum/saycode_fragment/user_message/fragment = new
	fragment.message = message
	fragment.spans = spans?.Copy()
	fragment.language_id = language_id
	fragment.saycode_type = saycode_type
	return fragment

/datum/saycode_fragment/user_message/do_render()
	if(language || length(spans))
		return "<span class='[language?.colour] [jointext(spans, " ")]'>[message]</span>"
	return message

/**
 * The actor name.
 */
/datum/saycode_fragment/actor_name

#warn impl
