//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

/**
 * Serialized datum holding total world-persistent state.
 * * All serialized data must be JSON-compatible.
 */
/datum/storyteller_narrative
	/// opaque flags
	/// * never touched by storyteller internally outside of ser/de
	/// * datums must be serialize()-able
	var/list/opaque_flags = list()
	/// managed flags
	/// * automatically managed by storyteller internally
	/// * datums must be serialize()-able
	var/list/managed_flags = list()


#warn impl all
