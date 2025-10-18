/obj/vehicle/sealed/mecha/combat/durand
	desc = "An aging combat exosuit utilized by many corporations. Originally developed to combat hostile alien lifeforms."
	name = "Durand"
	icon_state = "durand"
	initial_icon = "durand"

	base_movement_speed = 2.5

	dir_in = 1 //Facing North.
	integrity = 300
	integrity_max = 300			//Don't forget to update the /old variant if  you change this number.
	deflect_chance = 20
	damage_absorption = list("brute"=0.5,"fire"=1.1,"bullet"=0.65,"laser"=0.85,"energy"=0.9,"bomb"=0.8)
	max_temperature = 30000
	infra_luminosity = 8
	force = 40
	wreckage = /obj/effect/decal/mecha_wreckage/durand

	damage_minimum = 15			//Big stompy
	minimum_penetration = 25

	max_hull_equip = 2
	max_weapon_equip = 1
	max_utility_equip = 2
	max_universal_equip = 1
	max_special_equip = 1

	comp_hull = /obj/item/vehicle_component/plating/hull/durable
	comp_armor = /obj/item/vehicle_component/plating/armor/military

	defence_mode_possible = 1

	icon_scale_x = 1.5
	icon_scale_y = 1.5

//This is for the Mech stats / Menu system. To be moved later on.
/obj/vehicle/sealed/mecha/combat/durand/get_commands()
	var/output = {"<div class='wr'>
						<div class='header'>Special</div>
						<div class='links'>
						<a href='?src=\ref[src];toggle_defence_mode=1'>Toggle defence mode</a>
						</div>
						</div>
						"}
	output += ..()
	return output

//Meant for random spawns.
/obj/vehicle/sealed/mecha/combat/durand/old
	desc = "An aging combat exosuit utilized by many corporations. Originally developed to combat hostile alien lifeforms. This one is particularly worn looking and likely isn't as sturdy."

/obj/vehicle/sealed/mecha/combat/durand/old/Initialize(mapload)
	. = ..()
	integrity = 25
	integrity_max = 250	//Just slightly worse.
	cell.charge = rand(0, (cell.charge/2))
