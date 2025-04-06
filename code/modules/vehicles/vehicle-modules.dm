//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

#warn impl all

/**
 * @return TRUE / FALSE success / failure
 */
/obj/vehicle/proc/user_attach_module(obj/item/vehicle_module/module, datum/event_args/actor/actor, to_hardpoint_id, silent, force)

/**
 * @return detached **item**
 */
/obj/vehicle/proc/user_detach_module(obj/item/vehicle_module/module, datum/event_args/actor/actor, silent, force, atom/drop_at, put_in_hands)
	RETURN_TYPE(/obj/item)

/**
 * @return TRUE / FALSE
 */
/obj/vehicle/proc/can_attach_module(obj/item/vehicle_module/module, datum/event_args/actor/actor, to_hardpoint_id, silent)

/**
 * @return TRUE / FALSE
 */
/obj/vehicle/proc/can_detach_module(obj/item/vehicle_module/module, datum/event_args/actor/actor, silent)

/**
 * @return TRUE / FALSE success / failure
 */
/obj/vehicle/proc/attach_module(obj/item/vehicle_module/module, datum/event_args/actor/actor, to_hardpoint_id, silent)
	#warn hardpoint
	modules += module
	module.vehicle = src

/**
 * @return detached **item**
 */
/obj/vehicle/proc/detach_module(obj/item/vehicle_module/module, datum/event_args/actor/actor, silent)
	RETURN_TYPE(/obj/item)
	if(module.vehicle != src)
		return null
	#warn hardpoint
	modules -= module
	module.vehicle = null
	return module.vehicle_detaching_cleanup(src, actor, hardpoint_id, silent)
