//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

/datum/language_holder
	/// inherents
	/// * what the person knows by heart; no sources needed
	/// * associate to `LANGUAGE_KNOWLEDGE_LEVEL_*` define.
	var/list/inherent_ids
	/// id = list(source = level)
	var/list/sourced_ids
	/// resultant id = level
	var/list/resultant_ids

/datum/language_holder/proc/set_sourced_level(id, source, level)
	#warn impl

/datum/language_holder/proc/remove_sourced_level(id, source)
	if(!sourced_ids)
		return
	var/list/maybe_id = sourced_ids[id]
	if(!maybe_id)
		return
	maybe_id -= source
	if(!length(maybe_id))
		sourced_ids -= id
	update_resultant_levels()

/datum/language_holder/proc/set_inherent_level(id, level)
	if(!inherent_ids)
		inherent_ids = list()
	inherent_ids[id] = level
	update_resultant_levels()

/datum/language_holder/proc/remove_inherent_level(id)
	if(!inherent_ids)
		return
	inherent_ids -= id
	if(!length(inherent_ids))
		inherent_ids = null
	update_resultant_levels()

/datum/language_holder/proc/wipe_sourced_ids()
	sourced_ids = null
	update_resultant_levels()

/datum/language_holder/proc/update_resultant_levels()
	. = inherent_ids ? inherent_ids.Copy() : list()
	for(var/id in sourced_ids)
		var/list/sources = sourced_ids[id]
		for(var/source in sources)
			.[id] = max(.[id], sources[source])
	if(length(.))
		resultant_ids = .

/datum/language_holder/proc/get_knowledge_level(id)
	return resultant_ids?[id]

#warn stuff

/datum/language_holder/ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state, datum/event_args/actor/actor)
	. = ..()
	if(.)
		return
	#warn admin check
	switch(action)
		if("intrinsicSet")
		if("intrinsicDel")
		if("sourceDel")
		if("sourceSet")


/datum/language_holder/ui_interact(mob/user, datum/tgui/ui, datum/tgui/parent_ui)
	. = ..()

/datum/language_holder/ui_static_data(mob/user, datum/tgui/ui)
	. = ..()
	.["intrinsic"] = inherent_ids
	.["sourced"] = sourced_ids

/datum/language_holder/proc/update_ui_languages()
	#warn push data
