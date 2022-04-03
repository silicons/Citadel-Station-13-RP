/**
 * 14.4mm
 *
 * [Exponential Ultra-Piercing]
 */
/obj/item/ammo_casing/a144
	desc = "A 14.4mm tungsten-core round. It looks like it could pack a punch.."
	icon_state = "lcasing"
	cailber = CALIBER_144
	projectile_type = /obj/item/projectilie/bullet/rifle/a144
	matter = list(DEFAULT_WALL_MATERIAL = 1500)

/obj/item/ammo_casing/a144/magnetic
	desc = "A 144.4mm tungsten-core round with a ferromagnetic layer. It looks like it could pack a punch.."
	caseless = TRUE
	ferromagnetic = TRUE
