/datum/armor/vehicle_plating/hull

/datum/armor/vehicle_plating_redirection/hull

/obj/item/vehicle_component/plating/hull
	name = "mecha hull"
	icon = 'icons/mecha/mech_component.dmi'
	icon_state = "hull"
	w_class = WEIGHT_CLASS_HUGE
	origin_tech = list(TECH_DATA = 2, TECH_ENGINEERING = 2)
	materials_base = list(MAT_STEEL = 3500, MAT_GLASS = 200)

	component_type = MECH_HULL
	emp_resistance = 0	// Amount of emp 'levels' removed.
	integrity_danger_mod = 0.5	// Multiplier for comparison to integrity_max before problems start.
	integrity_max = 50
	internal_damage_flag = MECHA_INT_FIRE

	step_delay = 2

/obj/item/vehicle_component/plating/hull/durable
	name = "durable mecha hull"
	step_delay = 4
	integrity_danger_mod = 0.3
	integrity_max = 100

/obj/item/vehicle_component/plating/hull/lightweight
	name = "lightweight mecha hull"
	step_delay = 1
	integrity_danger_mod = 0.3

/obj/item/vehicle_component/plating/hull/heavy_duty
	name = "heavy duty mecha hull"
	step_delay = 5
	integrity_danger_mod = 0.2
	integrity_max = 2500

