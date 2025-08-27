//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2023 Citadel Station developers.          *//

//* Versioning *//

// Migration Directives:
// * prefer append-update instead of change-remove.
//   append-update means write new, changed data instead of overwrite old data
//   this means that reverting a testmerge doesn't cause problems.

// todo: how to do migration in a downstream-friendly way? current
//       would require downstreams to manually edit code.
//       this is bad!

// current version; bump to trigger migrations
#define GAME_PREFERENCES_VERSION_CURRENT 1
// prefs start at this version when legacy
#define GAME_PREFERENCES_VERSION_LEGACY 1
// at or below this, we throw out all data
#define GAME_PREFERENCES_VERSION_DROP 0

//* Misc Keys *//

/// boolean value for if we're in hotkeys mode
#define GAME_PREFERENCE_MISC_KEY_HOTKEY_MODE "hotkey-mode"

//* Category Names

#define GAME_PREFERENCE_CATEGORY_ADMIN "Admin"
	#define GAME_PREFERENCE_SUBCATEGORY_ADMIN_GENERAL "General"
#define GAME_PREFERENCE_CATEGORY_AUDIO "Audio"
	#define GAME_PREFERENCE_SUBCATEGORY_AUDIO_AMBIENCE "Ambience"
	#define GAME_PREFERENCE_SUBCATEGORY_AUDIO_MUSIC "Music"
	#define GAME_PREFERENCE_SUBCATEGORY_AUDIO_SFX "SFX"
#define GAME_PREFERENCE_CATEGORY_GAME "Game"
	#define GAME_PREFERENCE_SUBCATEGORY_GAME_BEHAVIOR "Behavior"
	#define GAME_PREFERENCE_SUBCATEGORY_GAME_CHAT "Chat"
	#define GAME_PREFERENCE_SUBCATEGORY_GAME_HUD "HUD"
	#define GAME_PREFERENCE_SUBCATEGORY_GAME_TOOLTIPS "Tooltips"
#define GAME_PREFERENCE_CATEGORY_GRAPHICS "Game"
	#define GAME_PREFERENCE_SUBCATEGORY_GRAPHICS_PARALLAX "Parallax"
	#define GAME_PREFERENCE_SUBCATEGORY_GRAPHICS_RENDERING "Rendering"
#define GAME_PREFERENCE_CATEGORY_OBSERVER "Observer / Lobby"
	#define GAME_PREFERENCE_SUBCATEGORY_OBSERVER_MAIN "Observer"
	#define GAME_PREFERENCE_SUBCATEGORY_OBSERVER_PRESENCE "Presence"
#define GAME_PREFERENCE_CATEGORY_VORE "Vore"
