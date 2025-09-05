//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station developers.          *//

/mob/get_self_ai_adapters() as /list
	. = ..()
	#warn abilities

/mob/get_equipment_ai_adapters() as /list
	. = ..()
	for(var/obj/item/item as anything in inventory.get_everything())
		#warn inventory
