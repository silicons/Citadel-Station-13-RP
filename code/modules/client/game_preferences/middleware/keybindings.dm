//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 silicons                             *//

/datum/game_preference_middleware/keybindings
	name = "Keybindings"
	key = "keybindings"

/datum/game_preference_middleware/keybindings/serialize_prefs_to_list(datum/game_preferences/prefs, list/errors_out)
	. = ..()

/datum/game_preference_middleware/keybindings/deserialize_prefs_from_list(datum/game_preferences/prefs, list/data, list/errors_out)
	..()

#warn impl all

/datum/game_preference_middleware/keybindings/on_initial_load(datum/game_preferences/prefs)
	prefs.active?.set_macros()
	prefs.active?.update_movement_keys(src)
	return ..()

/datum/game_preference_middleware/keybindings/handle_reset(datum/game_preferences/prefs)
	. = ..()

	prefs.keybindings_key_lookup = list()
	// don't change their hotkey mode.. unless it was never there.
	prefs.keybindings_hotkey_mode = \
		isnull(prefs.keybindings_hotkey_mode)? TRUE : !!prefs.keybindings_hotkey_mode
	var/hotkey_mode = prefs.keybindings_hotkey_mode
	var/list/defaults = deep_copy_list(hotkey_mode? GLOB.hotkey_keybinding_list_by_key : GLOB.classic_keybinding_list_by_key)
	prefs.keybindings_key_lookup = defaults

	prefs.push_ui_modules(updates = list((src.key) = list(
		"bindings" = prefs.keybindings_key_lookup,
		"hotkeyMode" = prefs.keybindings_hotkey_mode,
	)))

/datum/game_preference_middleware/keybindings/handle_topic(datum/game_preferences/prefs, action, list/params)
	. = ..()
	if(.)
		return
	switch(action)
		if("reset")
			handle_reset(prefs)
			return TRUE
		if("hotkeys")
			var/value = params["value"]
			if(prefs.keybindings_hotkey_mode == value)
				return TRUE
			prefs.keybindings_hotkey_mode = !!value
			prefs.mark_dirty()
			prefs.push_ui_modules(updates = list((src.key) = list(
				"hotkeyMode" = value,
			)))
			prefs.active?.set_macros()
			return TRUE
		if("addBind")
			var/keybind_id = params["keybind"]
			// key can be blank if we're only using ctrl/alt/shift!!
			var/key = params["key"]
			var/alt_depressed = params["alt"]
			var/shift_depressed = params["shift"]
			var/ctrl_depressed = params["ctrl"]
			var/is_numpad = params["numpad"]
			var/replacing_key = params["replaceKey"]
			var/adding_key = "[alt_depressed? "Alt":""][ctrl_depressed? "Ctrl":""][shift_depressed? "Shift":""][is_numpad? "Numpad":""][key]"
			if(!adding_key)
				return TRUE
			if(adding_key == replacing_key)
				return TRUE
			if(!isnull(replacing_key))
				prefs.keybindings_key_lookup[replacing_key] -= keybind_id
			if(isnull(prefs.keybindings_key_lookup[adding_key]))
				prefs.keybindings_key_lookup[adding_key] = list()
			if(!(keybind_id in prefs.keybindings_key_lookup[adding_key]))
				prefs.keybindings_key_lookup[adding_key] += keybind_id
			prefs.push_ui_modules(updates = list((src.key) = list(
				"bindings" = prefs.keybindings_key_lookup,
			)))
			prefs.active?.update_movement_keys()
			return TRUE
		if("removeBind")
			var/keybind_id = params["keybind"]
			var/key = params["key"]
			if(!key)
				return TRUE
			prefs.keybindings_key_lookup[key] -= keybind_id
			prefs.push_ui_modules(updates = list((src.key) = list(
				"bindings" = prefs.keybindings_key_lookup,
			)))
			prefs.active?.update_movement_keys()
			return TRUE

/datum/game_preference_middleware/keybindings/handle_sanitize(datum/game_preferences/prefs, list/errors_out)
	. = ..()
	if(isnull(prefs.keybindings_hotkey_mode))
		prefs.keybindings_hotkey_mode = TRUE
	else
		prefs.keybindings_hotkey_mode = !!prefs.keybindings_hotkey_mode
	var/list/keys_by_bind_id = list()
	//! legacy: get rid of known trash values
	prefs.keybindings_key_lookup -= "Unbound"
	//! end
	for(var/key in prefs.keybindings_key_lookup)
		var/had_something = FALSE
		if(islist(prefs.keybindings_key_lookup[key]))
			var/list/keybind_ids = prefs.keybindings_key_lookup[key]
			if(length(keybind_ids) > MAX_COMMANDS_PER_KEY)
				keybind_ids.len = MAX_COMMANDS_PER_KEY
			for(var/bind_id in prefs.keybindings_key_lookup[key])
				var/datum/keybinding/found = GLOB.keybindings_by_name[bind_id]
				if(isnull(found))
					prefs.keybindings_key_lookup[key] -= bind_id
					continue
				if(isnull(keys_by_bind_id[bind_id]))
					keys_by_bind_id[bind_id] = list()
				if(length(keys_by_bind_id[bind_id]) > MAX_KEYS_PER_KEYBIND)
					prefs.keybindings_key_lookup[key] -= bind_id
					continue
				keys_by_bind_id[bind_id] += key
				had_something = TRUE
		if(!had_something)
			prefs.keybindings_key_lookup -= key

/datum/game_preference_middleware/keybindings/prefs_ui_data(mob/user, datum/tgui/ui)
	. = ..()
	var/datum/game_preferences/prefs = ui.src_object
	.["bindings"] = prefs.keybindings_key_lookup
	var/list/constructed_keybinds = list()
	for(var/key in GLOB.keybindings_by_name)
		var/datum/keybinding/keybind = GLOB.keybindings_by_name[key]
		if(!keybind.is_visible(user?.client))
			continue
		constructed_keybinds[++constructed_keybinds.len] = keybind.tgui_keybinding_data()
	.["keybinds"] = constructed_keybinds
	.["hotkeyMode"] = prefs.keybindings_hotkey_mode
	.["maxBinds"] = MAX_KEYS_PER_KEYBIND
	.["maxPerKey"] = MAX_COMMANDS_PER_KEY

//? Preferences Helpers

/datum/game_preferences/proc/keybindings_is_hotkeys_mode()
	if(!initialized)
		return TRUE
	return keybindings_hotkey_mode

//? UI Design Assertions

#if MAX_KEYS_PER_KEYBIND != 3
	#error TGUI for prefs is only designed for 3 bindings per keybind datum. Fix it if you want more.
#endif
