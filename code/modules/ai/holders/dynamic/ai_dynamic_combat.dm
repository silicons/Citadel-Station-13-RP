//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station developers.          *//

GLOBAL_LIST_INIT(ai_dynamic_combat_routines, init_ai_dynamic_combat_routines())

/proc/init_ai_dynamic_combat_routines()
	. = list()
	for(var/datum/ai_dynamic_combat/combat_routine_path as anything in typesof(/datum/ai_dynamic_combat))
	#warn impl

/**
 * dynamic AI holder combat routines
 */
/datum/ai_dynamic_combat
	abstract_type = /datum/ai_dynamic_combat

	/// id. this must be unique and is how we're looked up.
	var/id

#warn impl
