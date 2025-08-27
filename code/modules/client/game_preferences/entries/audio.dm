//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

/datum/game_preference_entry/toggle/ambience_area_ambience
	name = "Area Ambience"
	key = "area_ambience"
	default_value = TRUE
	category = GAME_PREFERENCE_CATEGORY_AUDIO
	subcategory = GAME_PREFERENCE_SUBCATEGORY_AUDIO_AMBIENCE

/datum/game_preference_entry/toggle/ambience_supermatter_hum
	name = "Supermatter Hum"
	key = "supermatter_ambience"

	default_value = TRUE
	category = GAME_PREFERENCE_CATEGORY_AUDIO
	subcategory = GAME_PREFERENCE_SUBCATEGORY_AUDIO_AMBIENCE

/datum/game_preference_entry/toggle/ambience_weather
	name = "Weather Sounds"
	key = "weather_ambience"

	default_value = TRUE
	category = GAME_PREFERENCE_CATEGORY_AUDIO
	subcategory = GAME_PREFERENCE_SUBCATEGORY_AUDIO_AMBIENCE

/datum/game_preference_entry/toggle/ambience_atmospherics
	name = "Atmos Machinery Sounds"
	key = "atmos_machine_ambience"
	default_value = TRUE

	category = GAME_PREFERENCE_CATEGORY_AUDIO
	subcategory = GAME_PREFERENCE_SUBCATEGORY_AUDIO_AMBIENCE

/datum/game_preference_entry/toggle/sfx_instruments
	name = "Instruments"
	description = "Play sounds from in-game instruments."
	key = "instrument_music"

	default_value = TRUE
	category = GAME_PREFERENCE_CATEGORY_AUDIO
	subcategory = GAME_PREFERENCE_SUBCATEGORY_AUDIO_SFX

/datum/game_preference_entry/toggle/music_lobby
	name = "Lobby Music"
	description = "Play music in the lobby."
	key = "lobby_music"

	default_value = TRUE
	category = GAME_PREFERENCE_CATEGORY_AUDIO
	subcategory = GAME_PREFERENCE_SUBCATEGORY_AUDIO_MUSIC

/datum/game_preference_entry/toggle/music_lobby/toggled(client/user, state)
	if(state)
		user.playtitlemusic()
	else
		user.media?.stop_music()

/datum/game_preference_entry/toggle/music_admin
	name = "Admin Music"
	description = "Play admin MIDIs (or really just music nowadays)."
	key = "admin_music"

	default_value = TRUE
	category = GAME_PREFERENCE_CATEGORY_AUDIO
	subcategory = GAME_PREFERENCE_SUBCATEGORY_AUDIO_MUSIC

/datum/game_preference_entry/toggle/music_jukebox
	name = "Jukebox Music"
	description = "Play in-game jukebox music."
	key = "jukebox_music"

	default_value = TRUE
	category = GAME_PREFERENCE_CATEGORY_AUDIO
	subcategory = GAME_PREFERENCE_SUBCATEGORY_AUDIO_MUSIC

/datum/game_preference_entry/toggle/music_jukebox/toggled(client/user, state)
	// todo: jukebox / music rework
	if(state)
		user.mob?.update_music()
	else
		user.mob?.stop_all_music()
