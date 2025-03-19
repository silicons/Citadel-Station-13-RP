//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

/**
 * The binding that lets a /datum/computer control a peripheral.
 *
 * * Technically, this doesn't need an actual /obj/item/computer_peripheral.
 *   The entire computer system is abstracted; item implementations are only that,
 *   an implementation.
 */
/datum/computer_peripheral_host
	/// tgui interface key; this is unique to computers, and is not
	/// a general interface resolving path.
	var/interface_key

/datum/computer_peripheral_host/proc/peripheral_ui_data()

/datum/computer_peripheral_host/proc/peripheral_ui_static_data()

/datum/computer_peripheral_host/proc/peripheral_push_ui_data()

/datum/computer_peripheral_host/proc/peripheral_ui_act()

/datum/computer_peripheral_host/proc/peripheral_ui_data()

/**
 * Physical bindings, used by /obj/item/computer_peripheral's
 */
/datum/computer_peripheral_host/physical
	/// bound peripheral
	var/obj/item/computer_peripheral/bound_peripheral
	/// expected binding peripheral type
	var/bound_peripheral_type



#warn impl all that
