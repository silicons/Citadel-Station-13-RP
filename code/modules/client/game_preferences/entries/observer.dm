//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

/datum/game_preference_entry/toggle/observer_ghost_ears
	name = "Hear All Speech"
	description = "Hear all speech, regardless of distance"
	key = "ghost_ears"
	default_value = TRUE
	category = GAME_PREFERENCE_CATEGORY_OBSERVER
	subcategory = GAME_PREFERENCE_SUBCATEGORY_OBSERVER_MAIN
	legacy_key = "CHAT_GHOSTEARS"

/datum/game_preference_entry/toggle/observer_ghost_sight
	name = "See All Emotes"
	description = "See all emotes, regardless of distance"
	key = "ghost_sight"
	default_value = TRUE
	category = GAME_PREFERENCE_CATEGORY_OBSERVER
	subcategory = GAME_PREFERENCE_SUBCATEGORY_OBSERVER_MAIN
	legacy_key = "CHAT_GHOSTSIGHT"

/datum/game_preference_entry/toggle/observer_ghost_radio
	name = "Hear All Radio"
	description = "Hear all radio chatter, regardless of distance"
	key = "ghost_radio"
	default_value = TRUE
	category = GAME_PREFERENCE_CATEGORY_OBSERVER
	subcategory = GAME_PREFERENCE_SUBCATEGORY_OBSERVER_MAIN
	legacy_key = "CHAT_GHOSTRADIO"

/datum/game_preference_entry/toggle/observer_ghost_subtle
	name = "See Subtle Emotes"
	description = "See subtle emotes"
	key = "ghost_subtle"
	default_value = TRUE
	category = GAME_PREFERENCE_CATEGORY_OBSERVER
	subcategory = GAME_PREFERENCE_SUBCATEGORY_OBSERVER_MAIN
	legacy_key = "SUBTLE_SEE"

/datum/game_preference_entry/toggle/presence_anonymous_ghost_chat
	name = "Anonymous Ghost Chat"
	description = "Hide your ckey when speaking in deadchat."
	key = "hide_ckey_from_deadchat"
	category = GAME_PREFERENCE_CATEGORY_OBSERVER
	subcategory = GAME_PREFERENCE_SUBCATEGORY_OBSERVER_PRESENCE
	default_value = TRUE

/datum/game_preference_entry/toggle/presence_show_advanced_who
	name = "Show Status in Advanced Who"
	description = "Show your playing status in advanced who."
	key = "advanced_who_status"
	category = GAME_PREFERENCE_CATEGORY_OBSERVER
	subcategory = GAME_PREFERENCE_SUBCATEGORY_OBSERVER_PRESENCE
	default_value = FALSE

/datum/game_preference_entry/toggle/presence_announce_ghost_joinleave
	name = "Announce Observer Join/Leave"
	description = "Announce to deadchat when you enter or exit deadchat."
	key = "announce_ghost_joinleave"
	category = GAME_PREFERENCE_CATEGORY_OBSERVER
	subcategory = GAME_PREFERENCE_SUBCATEGORY_OBSERVER_PRESENCE
	default_value = FALSE
