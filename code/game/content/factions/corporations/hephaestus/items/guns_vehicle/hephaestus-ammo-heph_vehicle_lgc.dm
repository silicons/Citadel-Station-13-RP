//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

/**
 * light magnetic accelerator rounds
 */
/datum/ammo_caliber/heph_vehicle_lgc
	name = "HEPH-ACC-44"
	diameter = 44
	length = 300

/obj/item/ammo_casing/heph_vehicle_lgc
	name = "accelerator round (" + /datum/ammo_caliber/heph_vehicle_lgc::name + ")"
	abstract_type = /obj/item/ammo_casing/heph_vehicle_lgc
	casing_caliber = /datum/ammo_caliber/heph_vehicle_lgc

/obj/item/ammo_casing/heph_vehicle_lac/standard

/obj/item/ammo_magazine/vehicle/heph_vehicle_lgc
	ammo_caliber = /datum/ammo_caliber/heph_vehicle_lgc

#warn exofab design
/obj/item/ammo_magazine/vehicle/heph_vehicle_lgc/standard

/obj/projectile/bullet/heph_vehicle_lgc
	abstract_type = /obj/projectile/bullet/heph_vehicle_lgc

/obj/projectile/bullet/heph_vehicle_lgc/standard
	damage_force = 52.5
	damage_tier = 5
	#warn piercing

#warn impl all
