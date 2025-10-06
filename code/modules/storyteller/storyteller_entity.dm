//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

/**
 * Something persistent spawned by storyteller and kept "alive".
 * This will count towards chaos / danger / whatever until it "dies",
 * at which point it's GC'd.
 */
/datum/storyteller_entity
	/// can be spawned ... in some way.
	var/spawn_allow_misc = FALSE
	/// can be spawned for the overmap in general
	var/spawn_allow_overmap = FALSE
	/// can be spawned at a particular location in overmap
	var/spawn_allow_overmap_targeted = FALSE
	/// can be spawned on an overmap entity
	var/spawn_allow_overmap_entity = FALSE
	/// can be spawned on a particular spot on an overmap entity
	var/spawn_allow_overmap_entity_targeted = FALSE

#warn impl
