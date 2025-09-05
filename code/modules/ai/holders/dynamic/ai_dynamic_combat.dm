//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers          *//

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

	/// tick interval. if the holder ticks slower than this,
	/// its tickrate is boosted to this.
	/// * this means if the holder ticks faster than this
	///   it still ticks faster than this. do not rely on tick cycle
	///   for timing.
	var/request_minimum_tick_interval = 2 SECONDS

	/// id. this must be unique and is how we're looked up.
	var/id

	/// automatically try to resist out of stuns and more
	var/standard_resist_subroutines = TRUE
	/// automatically try to take cover if under heavy fire
	var/standard_cover_subroutines = TRUE
	#warn impl
	/// automatically engage targets with standard handling
	var/standard_combat_subroutines = TRUE
	#warn impl

#warn impl

/datum/ai_dynamic_combat/proc/on_enter(datum/ai_holder/hodler)
	return

/datum/ai_dynamic_combat/proc/on_Exit(datum/ai_holder/hodler)
	return

/datum/ai_dynamic_combat/proc/tick_standard_subroutines(datum/ai_holder/holder, datum/ai_dynamic_combat_context/context)
	if(standard_resist_subroutines)
		standard_resist_subroutines(holder, context)
	#warn impl

/datum/ai_dynamic_combat/proc/auto_standard_resist_subroutines(datum/ai_holder/holder, datum/ai_dynamic_combat_context/context)
	if(standard_resist_subroutines)
		standard_resist_subroutines(holder, context)

/datum/ai_dynamic_combat/proc/standard_resist_subroutines(datum/ai_holder/holder, datum/ai_dynamic_combat_context/context)
	#warn impl


