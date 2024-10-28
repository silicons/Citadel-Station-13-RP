//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

/**
 * caches the result of procedural generation
 */
/datum/nanoswarm_pattern
	/// our orchestration pattern
	var/pattern
	/// un

	/// list of glyph IDs associated to effect list
	var/list/effects_by_id = list()

/datum/nanoswarm_pattern/New(pattern)
	src.pattern = pattern

/datum/nanoswarm_pattern/proc/effects_for_id(id)

