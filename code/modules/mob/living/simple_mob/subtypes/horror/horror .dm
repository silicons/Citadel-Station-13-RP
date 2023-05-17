/datum/prototype/struct/catalogue_entry/fauna/horror
	name = "%#ERROR#%"
	desc = "%ERROR% SCAN DATA REDACTED. RETURN SCANNER TO A \
	CENTRAL ADMINISTRATOR FOR IMMEDIATE MAINTENANCE. %ERROR%"
	value = CATALOGUER_REWARD_TRIVIAL
	unlocked_by_any = list(/datum/prototype/struct/catalogue_entry/fauna/horror)

// Obtained by scanning all X.
/datum/prototype/struct/catalogue_entry/fauna/all_horrors
	name = "Coll-LL-ec-T-io$#@ - %REDACTED!!!%"
	desc = "You have REJECTED a large $%*^ of different MAINTENANCE MODE, \
	and therefore you have been SLATED FOR &&!!%) sum of points, through this \
	%%ERROR%%."
	value = CATALOGUER_REWARD_TRIVIAL
	unlocked_by_all = list(
		/datum/prototype/struct/catalogue_entry/fauna/horror/bradley,
		/datum/prototype/struct/catalogue_entry/fauna/horror/Eddy,
		/datum/prototype/struct/catalogue_entry/fauna/horror/Master,
		/datum/prototype/struct/catalogue_entry/fauna/horror/Rickey,
		/datum/prototype/struct/catalogue_entry/fauna/horror/Sally,
		/datum/prototype/struct/catalogue_entry/fauna/horror/BigTim,
		/datum/prototype/struct/catalogue_entry/fauna/horror/Smiley,
		/datum/prototype/struct/catalogue_entry/fauna/horror/Steve,
		/datum/prototype/struct/catalogue_entry/fauna/horror/TinyTim,
		/datum/prototype/struct/catalogue_entry/fauna/horror/Willy
		)

/mob/living/simple_mob/horror
	tt_desc = "Homo Horrificus"
	faction = "horror"
	icon = 'icons/mob/horror_show/GHPS.dmi'
	icon_gib = "generic_gib"
	taser_kill = 0
	meat_type = /obj/item/reagent_containers/food/snacks/meat
	bone_type = /obj/item/stack/material/bone
	hide_type = /obj/item/stack/hairlesshide
	exotic_type = /obj/item/stack/sinew

	mob_class = MOB_CLASS_ABERRATION

/datum/ai_holder/simple_mob/horror
	hostile = TRUE // The majority of simplemobs are hostile, gaslamps are nice.
	cooperative = FALSE
	retaliate = TRUE //so the monster can attack back
	returns_home = FALSE
	can_flee = FALSE
	speak_chance = 3
	wander = TRUE
	base_wander_delay = 9

/mob/living/simple_mob/horror
	min_oxy = 0
	max_oxy = 0
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0
	minbodytemp = 0
	maxbodytemp = 700
