/**
 * 
 */
/datum/prototype/character_loadout_entry
	//* identity *//
	/// display name
	var/display_name
	/// description to show
	var/dsiplay_desc

	//* customize / tweaks *//
	/// allowed standard customizations
	var/loadout_customize_flags = LOADOUT_CUSTOMIZE_COLOR | LOADOUT_CUSTOMIZE_DESC | LOADOUT_CUSTOMIZE_NAME

#warn impl

/**
 * * physiological (organ, dna, etc) mods and similar should go in here
 *
 * @return TRUE if finished
 */
/datum/prototype/character_loadout_entry/proc/spawn_early_pre_equip_uniform(mob/character)

/**
 * * overriding clothing and similar should go in here
 *
 * @return TRUE if finished
 */
/datum/prototype/character_loadout_entry/proc/spawn_pre_equip_uniform(mob/character)

/**
 * * non-overriding clothing and similar should go in here
 *
 * @return TRUE if finished
 */
/datum/prototype/character_loadout_entry/proc/spawn_post_equip_uniform(mob/character)

/**
 * * acecssories should go in here
 *
 * @return TRUE if finished
 */
/datum/prototype/character_loadout_entry/proc/spawn_late_post_equip_uniform(mob/character)

/**
 * * wheelchairs, etc, should go in here
 *
 * @return TRUE if finished
 */
/datum/prototype/character_loadout_entry/proc/spawn_pre_init_standing(mob/character)

/**
 * * pets, etc, irrelevant stuff should go in here
 *
 * @return TRUE if finished
 */
/datum/prototype/character_loadout_entry/proc/spawn_post_init_standing(mob/character)

/**
 * * must be implemented, otherwise crashes; something not handled by other stages goes in here
 *
 * @return TRUE if finished
 */
/datum/prototype/character_loadout_entry/proc/spawn_init_finished(mob/character)
