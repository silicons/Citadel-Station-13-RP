//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

/// key value id = middleware instance
GLOBAL_LIST_INIT(game_preference_middleware, init_game_preference_middleware())

/proc/init_game_preference_middleware()
	var/list/keyed_middleware = list()
	for(var/datum/game_preference_middleware/middleware as anything in subtypesof(/datum/game_preference_middleware))
		middleware = new middleware
		keyed_middleware[middleware.key] = middleware
	GLOB.game_preference_middleware = keyed_middleware
	return keyed_middleware

/datum/game_preference_middleware
	/// category name
	var/name
	/// key; used internally for lookup and tgui, this should not change without tgui-side changes
	var/key

/datum/game_preference_middleware/proc/serialize_prefs_to_list(datum/game_preferences/prefs, list/errors_out)
	return list()

/datum/game_preference_middleware/proc/deserialize_prefs_from_list(datum/game_preferences/prefs, list/data, list/errors_out)
	return

/**
 * return TRUE to stop handling
 *
 * we assume the 'usr' has been validated by the prefs datum!
 */
/datum/game_preference_middleware/proc/handle_topic(datum/game_preferences/prefs, action, list/params)
	return FALSE

/**
 * when we want to reset whatever this handles
 */
/datum/game_preference_middleware/proc/handle_reset(datum/game_preferences/prefs)
	prefs.mark_dirty()

/**
 * sanitize everything
 */
/datum/game_preference_middleware/proc/handle_sanitize(datum/game_preferences/prefs, list/errors_out)
	prefs.mark_dirty()

/**
 * on initial load
 */
/datum/game_preference_middleware/proc/on_initial_load(datum/game_preferences/prefs)
	return

/**
 * Initial data to send to TGUI. Not automatically updated.
 */
/datum/game_preference_middleware/proc/prefs_ui_data(datum/game_preferences/prefs)
	return list()

/**
 * Push data to TGUI.
 */
/datum/game_preference_middleware/proc/push_prefs_ui_data(datum/game_preferences/prefs, list/data)
	#warn impl
