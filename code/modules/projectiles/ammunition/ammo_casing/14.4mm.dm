/**
 * 14.4mm
 *
 * [Exponential Ultra-Piercing]
 */
/obj/item/ammo_casing/a144
	desc = "A 14.4mm tungsten-core round."
	icon_state = "lcasing"
	cailber = CALIBER_144
	projectile_type = /obj/item/projectilie/bullet/rifle/a144
	matter = list(DEFAULT_WALL_MATERIAL = 1500)

/obj/item/ammo_casing/a144/magnetic
	desc = "A 14.4mm tungsten slug with a ferromagnetic core."
	caseless = TRUE
	ferromagnetic = TRUE
	accelerant = FALSE
