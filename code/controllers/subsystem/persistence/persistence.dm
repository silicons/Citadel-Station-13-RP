//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2023 Citadel Station developers.          *//

// todo: tgui system panel

SUBSYSTEM_DEF(persistence)
	name = "Persistence"
	init_order = INIT_ORDER_PERSISTENCE
	subsystem_flags = SS_NO_FIRE

	/// used to ensure global-ness
	/// this is a "abcd-1234" like 4 characters dash 4 characters hexadecimal string.
	//  todo: should this really be on a subsystem..
	var/static/round_global_descriptor

	/// world already loaded?
	var/static/world_loaded = FALSE
	/// world saved how many times?
	var/static/world_saved_count = 0
	/// world load in progress; block.
	var/static/world_serialization_mutex = FALSE
	/// world is non-canon; do not save world automatically
	//  todo: interface on subsystem panel
	var/static/world_non_canon = FALSE

/datum/controller/subsystem/persistence/PreInit(recovering)
	// set up round_global_descriptor
	// this is preinit because other subsystems require this during their init.
	if(isnull(round_global_descriptor))
		init_round_global_descriptor()
	return ..()

/datum/controller/subsystem/persistence/proc/init_round_global_descriptor()
	// no (real) chance of collisions
	var/hex_string = "[num2hex(world.realtime)]"
	var/list/built = list()
	for(var/i in 1 to ceil(length(hex_string) / 4))
		built += copytext(hex_string, 1 + (i - 1) * 4, 1 + (i) * 4)
	round_global_descriptor = jointext(built, "-")

/datum/controller/subsystem/persistence/vv_edit_var(var_name, var_value, mass_edit, raw_edit)
	switch(var_name)
		if(NAMEOF(src, round_global_descriptor))
			return FALSE // no
	return ..()

/datum/controller/subsystem/persistence/Initialize()
	LoadPersistence()

	// todo: should this be here? save_the_world is in ticker.
	if(CONFIG_GET(flag/persistence))
		load_the_world()

	return ..()

/datum/controller/subsystem/persistence/Shutdown()
	SavePersistence()
	return ..()

/**
  * Loads all persistent information from disk.
  */
/datum/controller/subsystem/persistence/proc/LoadPersistence()
	LoadPanicBunker()

/**
  * Saves all persistent information to disk.
  */
/datum/controller/subsystem/persistence/proc/SavePersistence()
	SavePanicBunker()

//* ID Mapping *//

/**
 * gets ID of host map datum
 *
 * you usually want level_id_of_z instead.
 *
 * @return null if map shouldn't persist (levels under it still can!! careful!!), otherwise map id for persistence
 */
/datum/controller/subsystem/persistence/proc/map_id_of_z(z)
	var/datum/map/map = SSmapping.ordered_levels[z]?.parent_map
	return map?.id

/**
 * gets ID of level
 *
 * @return null if level shouldn't persist, otherwise level id for persistence
 */
/datum/controller/subsystem/persistence/proc/level_id_of_z(z)
	var/datum/map_level/level = SSmapping.ordered_levels[z]
	return level.persistence_allowed? (level.persistence_id || level.id) : null
