//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

/obj/item/computer_peripheral/flashlight
	name = /obj/item/computer_peripheral::name + " (flashlight)"
	#warn sprite

	peripheral_host_type = /datum/computer_peripheral_host/physical/flashlight

	var/is_on = FALSE

	var/light_range_min = 2.5
	/// maximum selectable light range
	/// * null to default to minimum, which means this isn't changeable by the user
	var/light_range_max
	var/light_power_min = 0.75
	/// maximum selectable light range
	/// * null to default to minimum, which means this isn't changeable by the user
	var/light_power_max

	var/light_wedge = LIGHT_OMNI

/obj/item/computer_peripheral/flashlight/proc/request_toggle_state(new_state)

/obj/item/computer_peripheral/flashlight/proc/request_change_light(requested_range, requested_power)

#warn impl
