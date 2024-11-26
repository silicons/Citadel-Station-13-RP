//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

/datum/document
	/// serialized hash
	///
	/// * if non-null, we are permanently stored, and to make a mutable one we will need to be cloned.
	var/serialized
	/// fragments
	var/list/fragments = list()

#warn impl

/**
 * Gets a mutable copy of ourselves.
 */
/datum/document/proc/get_mutable()
