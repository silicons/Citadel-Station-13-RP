//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

/datum/game_preference_backend/sqlite
	VAR_PRIVATE/sqlite_path = "data/sqlite/game_preferences.db"
	VAR_PRIVATE/database/sqlite

/datum/game_preference_backend/sqlite/initialize()
	sqlite = new /database()

/datum/game_preference_backend/sqlite/store(datum/game_preferences/read_from, ckey, player_id)

/datum/game_preference_backend/sqlite/load(datum/game_preferences/write_into, ckey, player_id)

