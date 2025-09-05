//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station developers.          *//

/mob/ai_get_self_adapters()
	. = ..()
	for(var/datum/ability/ability as anything in abilities)
		var/datum/ai_adapter/maybe_adapter = ability.request_ai_adapter()
		if(maybe_adapter)
			. += maybe_adapter

/mob/ai_get_equipment_adapters()
	. = ..()
	var/list/obj/item/processing = inventory.get_everything()
	var/safety = 2000
	while(length(processing))
		if((--safety) <= 0)
			CRASH("infinite loop detected in recursive inventory ai adapter query")
		var/obj/item/popping = processing
		--processing.len

		var/datum/ai_adapter/maybe_adapter = popping.request_ai_adapter()
		if(maybe_adapter)
			. += maybe_adapter

		if(popping.obj_storage && !popping.obj_storage.is_locked(src))
			processing += popping.obj_storage.contents_unsafe_immutable()
