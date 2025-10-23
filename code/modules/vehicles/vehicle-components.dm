//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

/**
 * Creates initial components. This should be idempotent in effect; it should
 * replace things already there if needed.
 */
/obj/vehicle/proc/create_initial_components()
	return

/obj/vehicle/proc/recreate_all_components_to_initial()
	destroy_all_components()
	create_initial_components()

/**
 * Destroy all components
 */
/obj/vehicle/proc/destroy_all_components()
	QDEL_LAZYLIST(components)

/**
 * @return list or string
 */
/obj/vehicle/proc/examine_render_components(datum/event_args/examine/examine)
	return list()

/obj/vehicle/proc/can_install_component(obj/item/vehicle_component/v_comp, datum/event_args/actor/actor, silent, force)

/obj/vehicle/proc/can_fit_component(obj/item/vehicle_component/v_comp, datum/event_args/actor/actor, silent)

/obj/vehicle/proc/user_install_component(obj/item/vehicle_component/v_comp, datum/event_args/actor/actor)

/obj/vehicle/proc/user_uninstall_component(obj/item/vehicle_component/v_comp, datum/event_args/actor/actor, put_in_hands)

/obj/vehicle/proc/install_component(obj/item/vehicle_component/v_comp, datum/event_args/actor/actor, silent, force)

/obj/vehicle/proc/uninstall_component(obj/item/vehicle_component/v_comp, datum/event_args/actor/actor, silent, force, atom/new_loc) as /obj/item/vehicle_component

/obj/vehicle/proc/on_component_attached(obj/item/vehicle_component/v_comp)
	SHOULD_CALL_PARENT(TRUE)
	SHOULD_NOT_SLEEP(TRUE)
	queue_update_component_refs()

/obj/vehicle/proc/on_component_detached(obj/item/vehicle_component/v_comp)
	SHOULD_CALL_PARENT(TRUE)
	SHOULD_NOT_SLEEP(TRUE)
	queue_update_component_refs()

#warn impl
