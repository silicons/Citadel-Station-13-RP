//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 silicons                             *//

/**
 * Corrosponds to DynamicConfig in tgui/interfaces/common.
 */
/datum/tgui_dynamic_config
	/// key = list(data)
	var/list/options = list()
	/// schema; list of:
	/// * text for a single entry
	/// * list for a set of equally spaced shared entries
	/// todo: more types
	var/list/layout = list()
	/// are we compiled?
	var/compiled = FALSE
	/// items left in group
	var/left_in_group = 0
	/// current group
	var/list/group_buffer

/datum/tgui_dynamic_config/proc/schema()
	ASSERT(compiled)
	return list(
		"options" = options,
		"layout" = layout,
	)

/datum/tgui_dynamic_config/proc/compile()
	ASSERT(!left_in_group)
	compiled = TRUE

/datum/tgui_dynamic_config/proc/create_group_for(next_x_entries)
	ASSERT(next_x_entries)
	group_buffer = list()
	left_in_group = next_x_entries

/datum/tgui_dynamic_config/proc/add_key(key)
	var/appending

	if(left_in_group)
		group_buffer += key
		--left_in_group
		if(!left_in_group)
			appending = group_buffer
			group_buffer = null
	else
		appending = key

	if(appending)
		layout[++layout.len] = appending

/**
 * changes --> key = value to change
 *
 * @return list after changes
 */
/datum/tgui_dynamic_config/proc/modify_options_inplace(list/previous, list/changes)
	for(var/key in changes)
		previous[key] = reduce_value(previous[key], changes[key], key)
	return previous

/datum/tgui_dynamic_config/proc/filter_values_inplace(list/values)
	for(var/key in values)
		values[key] = reduce_value(null, values[key], key)
	return values

/**
 * unlike filter, we will default values that aren't there.
 */
/datum/tgui_dynamic_config/proc/sanitize_values_inplace(list/values)
	for(var/key in options) // note how we're using options, not values
		values[key] = reduce_value(null, values[key], key)
	return values

/**
 * @return value that should be set after the change
 */
/datum/tgui_dynamic_config/proc/reduce_value(previous, next, key)
	var/list/entry = options[key]
	switch(entry["type"])
		if("text")
			// check null
			if(isnull(next))
				return entry["default"] || ""
			// trim
			return copytext_char(next, 1, 1 + entry["max"])
		if("number")
			// null / NaN check
			if(!is_safe_number(next))
				return entry["default"] || 0
			// round
			if(entry["round"])
				next = round(next, entry["round"])
			// clamp
			return clamp(
				next,
				isnull(entry["min"])? -INFINITY : entry["min"],
				isnull(entry["max"])? INFINITY : entry["max"],
			)
		if("toggle")
			// check null
			if(isnull(next))
				return entry["default"]
			// enforce booleanlike value
			return !!next
		if("dropdown")
			// enforce in list
			if(next in entry["options"])
				return next
			return entry["default"] || entry["options"][1]

/datum/tgui_dynamic_config/proc/with_string(key, name, desc, max_length = 512, multi_line = FALSE, default)
	RETURN_TYPE(/datum/tgui_dynamic_query)
	ASSERT(!options[key])
	options[key] = list(
		"name" = name,
		"desc" = desc,
		"default" = default,
		"type" = "text",
		"max" = max_length,
	)
	add_key(key)

/datum/tgui_dynamic_config/proc/with_number(key, name, desc, min_value = -INFINITY, max_value = INFINITY, round_to, default)
	RETURN_TYPE(/datum/tgui_dynamic_query)
	ASSERT(!options[key])
	options[key] = list(
		"name" = name,
		"desc" = desc,
		"default" = default,
		"type" = "number",
		"min" = min_value,
		"max" = max_value,
		"round" = round_to,
	)
	add_key(key)

/datum/tgui_dynamic_config/proc/with_toggle(key, name, desc, default)
	RETURN_TYPE(/datum/tgui_dynamic_query)
	ASSERT(!options[key])
	options[key] = list(
		"name" = name,
		"desc" = desc,
		"default" = default,
		"type" = "toggle",
	)
	add_key(key)

/**
 * associate choices to descs if wanted
 */
/datum/tgui_dynamic_config/proc/with_dropdown(key, name, desc, list/choices = list(), default)
	RETURN_TYPE(/datum/tgui_dynamic_query)
	ASSERT(!options[key])
	options[key] = list(
		"name" = name,
		"desc" = desc,
		"default" = default,
		"type" = "dropdown",
		"choices" = choices,
	)
	add_key(key)
