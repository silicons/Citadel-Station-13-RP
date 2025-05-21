//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

#warn impl

/datum/controller/characters/proc/init_loadout()

/datum/controller/characters/proc/tgui_loadout_context()
	var/list/instances = list()
	var/list/categories = list()
	for(var/id in id_lookup)
		var/datum/loadout_entry/entry = id_lookup[id]
		LAZYDISTINCTADD(categories[entry.category], entry.subcategory)
		var/list/instance = entry.tgui_entry_data()
		instances[instance["id"]] = instance

	. = list()
	.["instances"] = instances
	.["categories"] = categories
	.["maxEntries"] = LOADOUT_MAX_ITEMS
