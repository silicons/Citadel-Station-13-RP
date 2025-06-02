//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

/**
 * light autocannon
 */
/datum/ammo_caliber/heph_vehicle_lac
	name = "HEPH-AC-22.4"
	diameter = 22.4
	length = 79

/obj/item/ammo_casing/heph_vehicle_lac
	name = "autocannon round (" + /datum/ammo_caliber/heph_vehicle_lac::name + ")"
	abstract_type = /obj/item/ammo_casing/heph_vehicle_lac
	casing_caliber = /datum/ammo_caliber/heph_vehicle_lac

/obj/item/ammo_casing/heph_vehicle_lac/standard

/obj/item/ammo_magazine/vehicle/heph_vehicle_lac
	ammo_caliber = /datum/ammo_caliber/heph_vehicle_lac

#warn exofab design
/obj/item/ammo_magazine/vehicle/heph_vehicle_lac/standard

/obj/projectile/bullet/heph_vehicle_lac
	abstract_type = /obj/projectile/bullet/heph_vehicle_lac

/obj/projectile/bullet/heph_vehicle_lac/standard
	damage_force = 22.5
	damage_tier = 4.5

#warn impl all
