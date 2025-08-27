//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

/**
 * Backend store for game preferences.
 *
 * Unlike upcoming character backends, these are entirely
 * stateless as game preferences are cached on the subsystem / client,
 * not on ourselves.
 */
/datum/game_preference_backend
	VAR_PRIVATE/initialized = FALSE

/**
 * @return TRUE if initialized, FALSE if failed to initialize; caller should recreate us if so.
 */
/datum/game_preference_backend/proc/initialize()
	initialized = TRUE

/datum/game_preference_backend/proc/store(datum/game_preferences/read_from, ckey)

/datum/game_preference_backend/proc/load(datum/game_preferences/write_into, ckey)

