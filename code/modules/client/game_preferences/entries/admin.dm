//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

/datum/game_preference_entry/toggle/admin_global_looc
	name = "Remote LOOC Sight"
	description = "See all LOOC, regardless of location."
	key = "admin_global_looc"
	category = GAME_PREFERENCE_CATEGORY_ADMIN
	subcategory = GAME_PREFERENCE_SUBCATEGORY_ADMIN_GENERAL
	admin_only = TRUE
	default_value = TRUE


/datum/game_preference_entry/toggle/admin_obfuscate_stealth_dsay
	name = "Obfuscate Stealthmin Dsay"
	description = "Randomize ckey to a list of joke ckeys when dsay'ing while stealthed."
	key = "admin_obfuscate_stealth_dsay"
	category = GAME_PREFERENCE_CATEGORY_ADMIN
	subcategory = GAME_PREFERENCE_SUBCATEGORY_ADMIN_GENERAL
	admin_only = TRUE
	default_value = TRUE


/datum/game_preference_entry/toggle/admin_stealth_hides_ghost
	name = "Stealthmin Hides Ghost"
	description = "Hide your ghost while stealthed."
	key = "admin_hide_stealth_ghost"
	category = GAME_PREFERENCE_CATEGORY_ADMIN
	subcategory = GAME_PREFERENCE_SUBCATEGORY_ADMIN_GENERAL
	admin_only = TRUE
	default_value = TRUE

/datum/game_preference_entry/simple_color/admin_ooc_color
	name = "OOC Color (Admin)"
	description = "Choose your OOC color. Do not make it too eye-searing. Set to #000001 or reset to default to sync with server color."
	key = "admin_ooc_color"
	category = GAME_PREFERENCE_CATEGORY_ADMIN
	subcategory = GAME_PREFERENCE_SUBCATEGORY_ADMIN_GENERAL
	admin_only = TRUE
	default_value = "#000001"


/datum/game_preference_entry/simple_color/admin_ooc_color/is_visible(client/user)
	return ..() && CONFIG_GET(flag/allow_admin_ooccolor)
