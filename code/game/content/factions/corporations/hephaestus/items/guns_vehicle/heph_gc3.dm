//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

#warn exofab design
/obj/item/vehicle_module/weapon/ranged/gun/ballistic/heph_gc3
	name = "vehicle accelerator cannon (Heph. GC-3)"
	desc = "The Hephaestus GC-3 is a specialty armament used for 'mild to moderate' anti-armour purposes. \
	Low fire-rate, and terrible ammo economy, but that's the price of firing tungsten rods."
	#warn sprite

	internal_gun = /obj/item/gun/projectile/ballistic/vehicle/heph_gc3

/datum/firemode/heph_gc3
	cycle_cooldown = 2.5 SECONDS

/obj/item/gun/projectile/ballistic/vehicle/heph_gc3
	name = /obj/item/vehicle_module/weapon/ranged/gun/ballistic/heph_gc3::name
	desc = /obj/item/vehicle_module/weapon/ranged/gun/ballistic/heph_gc3::desc
	firemodes = list(
		/datum/firemode/heph_gc3,
	)

#warn impl all
