//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

/**
 * I'll let you guess what this one does.
 */
/datum/mapgen_layer/structure/randy_random
	/// our structure draw descriptor; typepath or instance
	var/datum/mapgen_structure_draw/structure_provider
	/// allow duplicates?
	///
	/// * how this works is weird; it can duplicate if you give templates list
	///   two duplicates, as we copy the templates list if this is set
	///   and remove from it.
	var/allow_duplicates = FALSE
	/// iterations to go for before giving up if stalled
	var/retry_limit = 10

/datum/mapgen_layer/structure/randy_random/draw(datum/mapgen_buffer/buffer)

#warn impl
 