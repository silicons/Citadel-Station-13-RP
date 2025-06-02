//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

/obj/vehicle/proc/try_attach_module(obj/item/vehicle_module/module, datum/event_args/actor/actor, silent)
	if(!can_attach_module(module, actor, silent))
		return FALSE
	return attach_module(module, actor)

/**
 * @return detached module; this is not necessarily an /item
 */
/obj/vehicle/proc/try_detach_module(obj/item/vehicle_module/module, datum/event_args/actor/actor, silent, put_in_hands)
	if(!can_detach_module(module, actor, silent))
		return null
	var/atom/movable/detached = detach_module(module, actor)
	if(!detached)
		return
	if(isitem(detached))
		var/obj/item/detached_item = detached
		if(put_in_hands)
			actor?.performer?.put_in_hands_or_drop(detached_item)
	if(detached.loc == src)
		detached.forceMove(drop_location())
	return detached

/obj/vehicle/proc/can_attach_module(obj/item/vehicle_module/module, datum/event_args/actor/actor, silent)
	return TRUE

/obj/vehicle/proc/can_detach_module(obj/item/vehicle_module/module, datum/event_args/actor/actor, silent)
	return TRUE

/obj/vehicle/proc/attach_module(obj/item/vehicle_module/module, datum/event_args/actor/actor)

/**
 * @return detached module; this is not necessarily an /item
 */
/obj/vehicle/proc/detach_module(obj/item/vehicle_module/module, datum/event_args/actor/actor)

#warn impl all
