//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

/datum/map_gear_pack/station_armory

/**
 * light multi-modal energy sidearm
 */
/datum/map_gear_pack/station_armory/nt_isd_sidearm
	gear = list(
		/obj/item/gun/projectile/energy/nt_isd/sidearm/loaded = 1,
	)

/**
 * somewhat more powerful multi-modal energy rifle
 */
/datum/map_gear_pack/station_armory/nt_isd_carbine
	gear = list(
		/obj/item/gun/projectile/energy/nt_isd/carbine/loaded = 1,
	)

/**
 * anti-armor energy rifle
 */
/datum/map_gear_pack/station_armory/nt_isd_lance
	gear = list(
		/obj/item/gun/projectile/energy/nt_isd/lance/loaded = 1,
	)

/**
 * splash anti-technology disruption rifle
 */
/datum/map_gear_pack/station_armory/emp_rifle
	gear = list(
		/obj/item/gun/projectile/energy/ionrifle/loaded = 1,
	)

/**
 * armor piercing / near-unblockable anti-technology destruction rifle
 */
/datum/map_gear_pack/station_armory/ion_rifle
	gear = list(
		/obj/item/gun/projectile/energy/ionrifle/loaded = 1,
	)

/**
 * light ballistic sidearm
 */
/datum/map_gear_pack/station_armory/ballistic_sidearm
	gear = list(
		/obj/item/gun/projectile/ballistic/nt_expedition/heavy_sidearm/pistol = 1,
	)

/datum/map_gear_pack/station_armory/ballistic_sidearm/with_ammo
	gear = list(
		/obj/item/gun/projectile/ballistic/nt_expedition/heavy_sidearm/pistol/loaded = 1,
		/obj/item/ammo_magazine/nt_expedition/heavy_sidearm/pistol = 3,
	)

/**
 * light ballistic submachine gun
 */
/datum/map_gear_pack/station_armory/ballistic_smg
	gear = list(
		/obj/item/gun/projectile/ballistic/nt_expedition/heavy_sidearm/smg = 1,
	)

/datum/map_gear_pack/station_armory/ballistic_smg/with_ammo
	gear = list(
		/obj/item/gun/projectile/ballistic/nt_expedition/heavy_sidearm/smg/loaded = 1,
		/obj/item/ammo_magazine/nt_expedition/heavy_sidearm/smg = 3,
	)

/**
 * semi-automatic rifle
 * * generally should be red armory
 */
/datum/map_gear_pack/station_armory/ballistic_semirifle
	gear = list(
		/obj/item/gun/projectile/ballistic/nt_expedition/light_rifle/semirifle = 1,
	)

/datum/map_gear_pack/station_armory/ballistic_semirifle/with_ammo
	gear = list(
		/obj/item/gun/projectile/ballistic/nt_expedition/light_rifle/semirifle/loaded = 1,
		/obj/item/ammo_magazine/nt_expedition/light_rifle/stick = 3,
	)

/**
 * bolt-action rifle
 */
/datum/map_gear_pack/station_armory/ballistic_boltrifle
	gear = list(
		/obj/item/gun/projectile/ballistic/nt_expedition/heavy_rifle/singleshot = 1,
	)

/datum/map_gear_pack/station_armory/ballistic_boltrifle/with_ammo
	gear = list(
		/obj/item/gun/projectile/ballistic/nt_expedition/heavy_rifle/singleshot/loaded = 1,
		/obj/item/ammo_magazine/nt_expedition/heavy_rifle/stripper_clip = 3,
	)

#warn shotguns, armor
