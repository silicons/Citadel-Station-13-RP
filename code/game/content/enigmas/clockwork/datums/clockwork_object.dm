//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 silicons                             *//

/**
 * tracker for clockwork objects
 *
 * clockwork technology generally requires a lot more
 * code to work, but, this is a start and provides some
 * basic interfaces and whatnot.
 */
/datum/component/clockwork_object
	/// our alignment
	var/datum/clockwork_alignment/alignment
	/// our personality
	var/datum/clockwork_personality/personality

/datum/component/clockwork_object/Initialize(datum/clockwork_alignment/alignment, datum/clockwork_personality/personality)
	if(!isobj(parent))
		return COMPONENT_INCOMPATIBLE
	. = ..()
	if(. & COMPONENT_INCOMPATIBLE)
		return
	src.alignment = alignment
	src.personality = personality

