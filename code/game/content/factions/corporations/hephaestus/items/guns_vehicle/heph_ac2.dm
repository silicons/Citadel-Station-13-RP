//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

#warn exofab design
/obj/item/vehicle_module/weapon/ranged/gun/ballistic/heph_ac2
	name = "vehicle autocannon (Heph. AC-2)"
	desc = "The Hephaestus AC-2 is a standard weapon used on many lighter exosuits and vehicles. \
	Packs a decent punch to pretty much anything."
	#warn sprite

/datum/firemode/heph_ac2
	cycle_cooldown = 0.3 SECONDS

/datum/firemode/heph_ac2/burst_3
	burst_amount = 3
	burst_delay = 0.2 SECONDS
	cycle_cooldown = 0.6 SECONDS
	#warn test dispersrion
	projectile_base_dispersion = 10

/obj/item/gun/projectile/ballistic/vehicle/heph_ac2
	name = /obj/item/vehicle_module/weapon/ranged/gun/ballistic/heph_ac2::name
	desc = /obj/item/vehicle_module/weapon/ranged/gun/ballistic/heph_ac2::desc
	firemodes = list(
		/datum/firemode/heph_ac2,
		/datum/firemode/heph_ac2/burst_3,
	)

#warn impl all
