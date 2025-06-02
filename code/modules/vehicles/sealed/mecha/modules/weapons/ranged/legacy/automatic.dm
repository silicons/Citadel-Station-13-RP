#warn /obj/item/vehicle_module/weapon/ranged/gun/ballistic/heph_ac2
/obj/item/vehicle_module/weapon/ranged/legacy/ballistic/lmg
	name = "\improper Ultra AC 2"
	desc = "A superior version of the standard Hephaestus Autocannon MK2 design."
	icon_state = "mecha_uac2"
	projectile = /obj/projectile/bullet/pistol/medium
	fire_sound = 'sound/weapons/Gunshot_machinegun.ogg'

#warn /obj/item/vehicle_module/weapon/ranged/gun/ballistic/heph_gc3
/obj/item/vehicle_module/weapon/ranged/legacy/ballistic/gauss_rifle
	name = "\improper gauss rifle"
	desc = "The current standard in non-laser, anti-armor firepower, this weapon is the same as those mounted on light tanks for their primary weapon. Fires a single nickle-iron slug at high speed. Requires a long charge time between shots. "
	icon_state = "mecha_uac2-rig"
	projectile = /obj/projectile/bullet/mecha/a12mm_gauss
	fire_sound = 'sound/weapons/Gunshot_cannon.ogg'

/obj/item/vehicle_module/weapon/ranged/legacy/ballistic/lmg_heavy
	name = "\improper AC 10"
	desc = "The original in anti-mech firepower, the standard Hephaestus Autocannon MK10 design fires AP slugs in order to damage other heavy armor suits. This does mean its rate between bursts is longer than most."
	icon_state = "mecha_uac2"
	equip_cooldown = 1 SECONDS
	projectile = /obj/projectile/bullet/rifle/a762/ap
	fire_sound = 'sound/weapons/Gunshot_deagle.ogg'
	projectiles = 20 //Mag size
	projectiles_per_shot = 2
	deviation = 0.3
	projectile_energy_cost = 60
	fire_cooldown = 2

/obj/item/vehicle_module/weapon/ranged/legacy/ballistic/lmg/rigged
	name = "jury-rigged machinegun"
	desc = "The cross between a jackhammer and a whole lot of zipguns."
	icon_state = "mecha_uac2-rig"
	equip_cooldown = 12
	projectile = /obj/projectile/bullet/pistol
	deviation = 0.5

	equip_type = EQUIP_UTILITY
