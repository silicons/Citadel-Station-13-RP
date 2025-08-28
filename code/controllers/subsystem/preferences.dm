//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

/**
 * Game preference manager.
 */
SUBSYSTEM_DEF(preferences)
	name = "Preferences"
	init_order = INIT_ORDER_PREFERENCES
	init_stage = INIT_STAGE_EARLY
	subsystem_flags = SS_NO_FIRE

	var/datum/game_preference_backend/backend
	var/list/datum/game_preference_entry/entries_by_key
	var/static/list/datum/game_preferences/preferences_by_key = list()

/datum/controller/subsystem/preferences/Initialize()
	backend = new /datum/game_preference_backend/sqlite
	backend.initialize()
	init_preference_entries()
	for(var/key in preferences_by_key)
		var/datum/game_preferences/prefs = preferences_by_key[key]
		prefs.initialize()
	return SS_INIT_SUCCESS

/datum/controller/subsystem/preferences/proc/resolve_preference_entry(datum/game_preference_entry/entrylike)
	if(ispath(entrylike))
		entrylike = initial(entrylike.key)
		entrylike = entries_by_key[entrylike]
	else if(istype(entrylike))
	else
		entrylike = entries_by_key[entrylike]
	return entrylike

/datum/controller/subsystem/preferences/proc/init_preference_entries()
	. = list()
	for(var/datum/game_preference_entry/casted as anything in subtypesof(/datum/game_preference_entry))
		if(initial(casted.abstract_type) == casted)
			continue
		casted = new casted
		if(!casted.key || !istext(casted.key))
			STACK_TRACE("bad key: [casted.key]")
			continue
		if(!isnull(.[casted.key]))
			STACK_TRACE("dupe key between [casted.type] and [.[casted.key]:type]")
			continue
		.[casted.key] = casted
	entries_by_key = .

/**
 * @params
 * * key - client **`key`**. **not** `ckey`! the raw key is needed for
 *         book-keeping purposes.
 */
/datum/controller/subsystem/preferences/proc/resolve_game_preferences(key)
	var/ckey = ckey(key)
	if(!istype(preferences_by_key[ckey], /datum/game_preferences))
		var/datum/game_preferences/initializing = new(key)
		preferences_by_key[ckey] = initializing
		if(initialized)
			initializing.initialize()
	var/datum/game_preferences/found = preferences_by_key[ckey]
	if(initialized && !found.initialized)
		found.initialize()
	return found

#warn Migration procs are only for testmerge.

/datum/controller/subsystem/preferences/proc/__migrate_key(key)
	ASSERT(backend)

	var/datum/game_preferences/found = preferences_by_key[ckey(key)]
	if(!found)
		#warn make it but don't cache it as we will be dropping it right after

/datum/controller/subsystem/preferences/proc/__migrate_everything()
	ASSERT(backend)

	var/datum/db_query/key_query = SSdbcore.NewQuery(
		{"
			SELECT UNIQUE `ckey` FROM [DB_PREFIX_TABLE_NAME("game_preferences")] INNER JOIN [DB_PREFIX_TABLE_NAME("player_lookup")];
		"}
	)
	var/list/ckeys_to_migrate = list()
	while(key_query.NextRow())
		ckeys_to_migrate += key_query.item[1]

	message_admins("Performing migration of [length(ckeys_to_migrate)] ckeys worth of preferences.")
	to_chat(world, SPAN_BOLDANNOUNCE("Performing migration of all game preferences. The server may lag for a bit."))

	var/mark_every = 100
	for(var/i in 1 to length(ckeys_to_migrate))
		var/the_ckey = ckeys_to_migrate[i]
		if((i % mark_every) == 0)
			message_admins("Prefs migration: migrated [i - 1] so far, currently at '[the_ckey]'")
		if(TICK_CHECK)
			// back off a bit
			stoplag(rand(0, 7))
		__migrate_key(the_ckey)

	message_admins("Prefs migration: complete")
	to_chat(world, SPAN_BOLDANNOUNCE("Migrated [length(ckeys_to_migrate)] player global preferences successfully."))

	return length(ckeys_to_migrate)
