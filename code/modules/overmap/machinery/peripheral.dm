//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

/datum/overmap_ship_peripheral/peripheral_binding
	var/obj/machinery/overmap/peripheral/peripheral

/datum/overmap_ship_peripheral/peripheral_binding/New(obj/machinery/overmap/peripheral/peripheral)

/datum/overmap_ship_peripheral/peripheral_binding/Destroy()

/datum/overmap_ship_peripheral/peripheral_binding/get_required_control_flags()

/datum/overmap_ship_peripheral/peripheral_binding/ui_component_path()

/**
 * Peripherals for ships
 */
/obj/machinery/overmap/peripheral
	var/datum/overmap_ship_peripheral/peripheral_binding/peripheral_binding
	/// ship control flags required to control us
	/// * none = cannot be remote controlled or viewed, not 'any'!
	var/ship_control_flags = SHIP_CONTROL_PERIPHERALS
	/// UI component path
	/// * [name]Standalone gets loaded if interacted with manually
	/// * [name] gets loaded if embedded in ship control window
	var/ui_component_path = ""
	#warn impl

/obj/machinery/overmap/peripheral/ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state, datum/event_args/actor/actor)
	. = ..()

/obj/machinery/overmap/peripheral/ui_interact(mob/user, datum/tgui/ui, datum/tgui/parent_ui)
	. = ..()

/obj/machinery/overmap/peripheral/ui_data(mob/user, datum/tgui/ui)
	. = ..()

/obj/machinery/overmap/peripheral/ui_static_data(mob/user, datum/tgui/ui)
	. = ..()
	.["data"] = ui_peripheral_data()


/obj/machinery/overmap/peripheral/proc/ui_peripheral_data()

/obj/machinery/overmap/peripheral/proc/ui_peripheral_act(datum/event_args/actor/actor, local)

/obj/machinery/overmap/peripheral/proc/ui_peripheral_push(list/data)
	push_ui_data(data = data)
	for(var/obj/machinery/overmap/console/ship_controls/controller as anything in host_entity?.ship?.consoles)
		controller.push_ui_nested_data(updates = list(ref(src) = data))

#warn impl
