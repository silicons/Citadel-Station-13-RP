//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

/datum/event_meta_new/localized/mob_migration
	/// mostly to allow these to be used as #define-like constants
	var/self_mob_migration_id = "generic"
	/// lookup these ids on a level; defaults to 'self_mob_migration_id'
	var/list/use_mob_migration_ids

/**
 * tl;dr: bad shit wanders in from edge of map
 * * only makes sense on planet maps
 */
/datum/event_new/localized/mob_migration

#warn impl
#warn impl on maps lol they need to know what can migrate in.
