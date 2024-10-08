/datum/category_item/catalogue/fauna/giant_snake
	name = "Snake"
	desc = "An Earth reptile with a distinct lack of limbs, \
	snakes ambulate by slithering across the ground. Snakes \
	possess a wide variety of colorations and patterns, and are \
	sometimes owned as pets by enthusiasts. Many are venemous, \
	although there are harmless species, as well as species which \
	consume their prey via more specific techniques, such as \
	constriction."
	value = CATALOGUER_REWARD_TRIVIAL

/mob/living/simple_mob/vore/aggressive/giant_snake
	name = "giant snake"
	desc = "Snakes. Why did it have to be snakes?"
	catalogue_data = list(/datum/category_item/catalogue/fauna/giant_snake)

	icon_dead = "snake-dead"
	icon_living = "snake"
	icon_state = "snake"
	icon = 'icons/mob/vore64x64.dmi'

	iff_factions = MOB_IFF_FACTION_FARM_PEST

	maxHealth = 200
	health = 200
	randomized = TRUE

	legacy_melee_damage_lower = 5
	legacy_melee_damage_upper = 12

	base_pixel_x = -16
	base_pixel_y = -16

	ai_holder_type = /datum/ai_holder/polaris/simple_mob/melee

// Activate Noms!
/mob/living/simple_mob/vore/aggressive/giant_snake
	swallowTime = 2 SECONDS // Hungry little bastards.
