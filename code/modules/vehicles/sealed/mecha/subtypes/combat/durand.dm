/datum/armor/vehicle/mecha/combat/durand
	melee = 0.45
	bullet = 0.45
	laser = 0.45
	energy = 0.35
	bomb = 0.5

/obj/vehicle/sealed/mecha/combat/durand
	desc = "An aging combat exosuit utilized by many corporations. Originally developed to combat hostile alien lifeforms."
	name = "Durand"
	icon_state = "durand"
	initial_icon = "durand"

	armor_type = /datum/armor/vehicle/mecha/combat/durand
	integrity = 1.25 * /obj/vehicle/sealed/mecha/combat::integrity
	integrity_max = 1.25 * /obj/vehicle/sealed/mecha/combat::integrity_max
	base_movement_speed = 2.5

	comp_hull_relative_thickness = 1.5 * /obj/vehicle/sealed/mecha/combat::comp_hull_relative_thickness
	comp_hull = /obj/item/vehicle_component/plating/hull/durable
	comp_armor_relative_thickness = 1.5 * /obj/vehicle/sealed/mecha/combat::comp_armor_relative_thickness
	comp_armor = /obj/item/vehicle_component/plating/armor/military

	module_slots = list(
		VEHICLE_MODULE_SLOT_WEAPON = 2,
		VEHICLE_MODULE_SLOT_HULL = 3,
		VEHICLE_MODULE_SLOT_SPECIAL = 1,
		VEHICLE_MODULE_SLOT_UTILITY = 4,
	)
	modules_intrinsic = list(
		/obj/item/vehicle_module/personal_shield/deflector/durand,
	)

	dir_in = 1 //Facing North.
	max_temperature = 30000
	force = 40
	wreckage = /obj/effect/decal/mecha_wreckage/durand

	icon_scale_x = 1.5
	icon_scale_y = 1.5

//Meant for random spawns.
/obj/vehicle/sealed/mecha/combat/durand/old
	desc = "An aging combat exosuit utilized by many corporations. Originally developed to combat hostile alien lifeforms. This one is particularly worn looking and likely isn't as sturdy."

/obj/vehicle/sealed/mecha/combat/durand/old/Initialize(mapload)
	. = ..()
	integrity = 25
	integrity_max = 250	//Just slightly worse.
	cell.charge = rand(0, (cell.charge/2))
