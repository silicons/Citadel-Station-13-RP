//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

/obj/machinery/overmap/peripheral/shields
	name = "vessel shield projector"
	desc = "A large shield projector that projects a navigational deflector around a ship."
	#warn sprite

	var/datum/overmap_ship_shield/binding
	/// shield priority; lower is invoked first
	var/shield_priority

/obj/machinery/overmap/peripheral/shields/on_host_entity_changed(obj/overmap/entity/old_entity, obj/overmap/entity/new_entity)
	. = ..()


/obj/machinery/overmap/peripheral/shields

/obj/machinery/overmap/peripheral/shields

/**
 * basic shield that pulls from a wire node underneath
 */
/obj/machinery/overmap/peripheral/shields/basic

	var/charge = 0
	var/charge_target = 350
	var/charge_max = 700

	/// in kilojoules
	var/cost_charge_per_unit
	/// in kilowatts
	var/cost_maintain_per_unit

	/// in kw
	var/power_rating = 1000
	var/power_setting = 500


#warn impl
