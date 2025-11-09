//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

/**
 * Datumized overmap peripherals. Used so things other than /obj/machinery/overmap/peripheral can, well,
 * be a peripheral.
 */
/datum/overmap_ship_peripheral

/datum/overmap_ship_peripheral/proc/get_required_control_flags()
	return SHIP_CONTROL_PERIPHERALS

/datum/overmap_ship_peripheral/proc/ui_component_path()
	return ""
	#warn default comp

/datum/overmap_ship_peripheral/proc/ui_peripheral_data()

/datum/overmap_ship_peripheral/proc/ui_peripheral_act(datum/event_args/actor/actor)

/datum/overmap_ship_peripheral/proc/ui_peripheral_push(list/data)
	push_ui_data(data = data)
	for(var/obj/machinery/overmap/console/ship_controls/controller as anything in host_entity?.ship?.consoles)
		controller.push_ui_nested_data(updates = list(ref(src) = data))

#warn impl

#warn impl
