//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

/datum/game_preference_entry/toggle/behavior_help_intent_firing
	name = "Help Intent Gun Safety"
	description = "If on, do not allow firing weapons in help intent."
	key = "help_intent_gun_safety"
	legacy_key = "HELP_INTENT_SAFETY"
	default_value = FALSE
	category = GAME_PREFERENCE_CATEGORY_GAME
	subcategory = GAME_PREFERENCE_SUBCATEGORY_GAME_BEHAVIOR

/datum/game_preference_entry/toggle/chat_legacy_name_highlight
	name = "Emphasize Name Mentions"
	description = "Enlargen messages calling you by name."
	key = "legacy_name_mention"
	legacy_key = "CHAT_MENTION"
	category = GAME_PREFERENCE_CATEGORY_GAME
	subcategory = GAME_PREFERENCE_SUBCATEGORY_GAME_CHAT

/datum/game_preference_entry/toggle/chat_runechat
	name = "Overhead Chat"
	key = "runechat"
	legacy_key = "OVERHEAD_CHAT"
	description = "Enable rendering messages sent by mobs over their icon on the map."
	category = GAME_PREFERENCE_CATEGORY_GAME
	subcategory = GAME_PREFERENCE_SUBCATEGORY_GAME_CHAT

/datum/game_preference_entry/toggle/chat_show_ooc
	name = "OOC enabled"
	description = "Toggles whether you see OOC (Out of Character) chat."
	legacy_key = "CHAT_OOC"
	key = "toggle_ooc"
	category = GAME_PREFERENCE_CATEGORY_GAME
	subcategory = GAME_PREFERENCE_SUBCATEGORY_GAME_CHAT

/datum/game_preference_entry/toggle/chat_show_looc
	name = "LOOC enabled"
	description = "Toggles whether you see LOOC (Local Out of Character) chat."
	legacy_key = "CHAT_LOOC"
	key = "toggle_looc"
	category = GAME_PREFERENCE_CATEGORY_GAME
	subcategory = GAME_PREFERENCE_SUBCATEGORY_GAME_CHAT

/datum/game_preference_entry/toggle/chat_show_dsay
	name = "Deadchat enabled"
	description = "Toggles whether you see dead chat."
	legacy_key = "CHAT_DEAD"
	key = "toggle_deadchat"
	category = GAME_PREFERENCE_CATEGORY_GAME
	subcategory = GAME_PREFERENCE_SUBCATEGORY_GAME_CHAT

/datum/game_preference_entry/toggle/chat_show_legacy_chat_tags
	name = "Chat Tags"
	description = "Legacy chat visual system for tags to the left of messages; you should likely keep this on."
	key = "legacy_chat_tags"
	default_value = TRUE
	legacy_key = "CHAT_SHOWICONS"
	category = GAME_PREFERENCE_CATEGORY_GAME
	subcategory = GAME_PREFERENCE_SUBCATEGORY_GAME_CHAT

/datum/game_preference_entry/toggle/chat_show_language_indicators
	name = "Language Indicators"
	description = "Show language indicators in the chat when you hear a known language."
	key = "language_indicators"
	default_value = TRUE
	legacy_key = "LANGUAGE_INDICATOR"
	category = GAME_PREFERENCE_CATEGORY_GAME
	subcategory = GAME_PREFERENCE_SUBCATEGORY_GAME_CHAT

/datum/game_preference_entry/dropdown/hud_style
	name = "HUD Style"
	description = "Set the style of your inventory / game HUD"
	key = "hud_style"
	category = GAME_PREFERENCE_CATEGORY_GAME
	subcategory = GAME_PREFERENCE_SUBCATEGORY_GAME_HUD
	legacy_savefile_key = "UI_style"

/datum/game_preference_entry/dropdown/hud_style/New()
	options = list()
	for(var/key in all_ui_styles)
		options += key
	..()

/datum/game_preference_entry/dropdown/hud_style/on_set(client/user, value, first_init)
	. = ..()
	user.set_ui_style(value)
	user.mob.resync_rendering()

/datum/game_preference_entry/simple_color/hud_color
	name = "HUD Color"
	description = "Manually recolor your inventory / game HUD"
	key = "hud_color"
	category = GAME_PREFERENCE_CATEGORY_GAME
	subcategory = GAME_PREFERENCE_SUBCATEGORY_GAME_HUD
	default_value = "#ffffff"
	legacy_savefile_key = "UI_style_color"

/datum/game_preference_entry/simple_color/hud_color/on_set(client/user, value, first_init)
	. = ..()
	user.set_ui_color(value)
	user.mob.resync_rendering()

/datum/game_preference_entry/number/hud_alpha
	name = "HUD Alpha"
	description = "Manually set the transparency of your inventory / game HUD"
	key = "hud_alpha"
	category = GAME_PREFERENCE_CATEGORY_GAME
	subcategory = GAME_PREFERENCE_SUBCATEGORY_GAME_HUD
	default_value = 255
	min_value = 0
	max_value = 255
	round_to_nearest = 1
	legacy_savefile_key = "UI_style_alpha"

/datum/game_preference_entry/number/hud_alpha/on_set(client/user, value, first_init)
	. = ..()
	user.set_ui_alpha(value)
	user.mob.resync_rendering()

/datum/game_preference_entry/dropdown/tooltip_style
	name = "Tooltips Style"
	description = "Set the HUD style of pop up tooltips."
	key = "tooltip_style"
	category = GAME_PREFERENCE_CATEGORY_GAME
	subcategory = GAME_PREFERENCE_SUBCATEGORY_GAME_TOOLTIPS
	legacy_savefile_key = "tooltipstyle"

/datum/game_preference_entry/dropdown/tooltip_style/New()
	options = all_tooltip_styles.Copy()
	..()

/datum/game_preference_entry/toggle/tooltip_on_mobs
	name = "Mob Tooltips"
	key = "tooltip_on_mobs"
	category = GAME_PREFERENCE_CATEGORY_GAME
	subcategory = GAME_PREFERENCE_SUBCATEGORY_GAME_TOOLTIPS
	legacy_key = "MOB_TOOLTIPS"
