//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station developers.          *//

/datum/ai_holder/dynamic
	//* system *//


	//* introspection *//

	#ifdef AI_INTROSPECTION
	/// stores last X thoughts
	var/list/introspection_thoughts
	#endif

	//* state *//

	/// currently active task
	var/datum/ai_dynamic_task/state_task
	/// blackboard.
	/// * if you put a value in, you are expected to clean it up.
	///   this (almost) never gets automatically reset
	/// * this means if you put a reference type in you better
	///   clean it up!!!
	var/list/state_blackboard

	//* combat *//

	/// in combat?
	/// * this is separate from overall state as it's
	///   effectively an if block used to divert planning to
	///   spend a tick now and then to perform target engagement.
	var/combat_active = FALSE
	/// actively engaging targets
	var/list/atom/combat_engaging_targets
	/// active combat routine
	var/datum/ai_dynamic_combat/combat_routine
	/// combat routine blackboard
	var/list/combat_routine_blackboard

	//* cover *//

	/// last time cover was computed
	var/cover_last_compute
	/// taking cover candidate turfs
	/// * lazy list
	/// * cover is its own module away from combat
	///   due to being very useful and also very expensive
	///   and hard to get right
	var/list/turf/cover_candidates

	//* emnity *//

	/// sorted emnity list
	/// * uses direct references for speed,
	///   we know we will check for 'qdeleted' and other crap
	///   atleast every 10-20 seconds so it's Fine(tm)
	/// * highest emnity is further down the list
	/// * highest emnity is priority target, generally
	/// * lazy list
	var/list/atom/emnity_list

	//* steering *//

	/// current steering routine
	var/datum/ai_dynamic_steering/steering_routine
	/// blackboard for steering routine
	var/list/steering_routine_blackboard

	//* tuning *//

	/// reaction time low
	var/tuning_reaction_time_low = 1.75
	var/tuning_reaction_time_high = 3.75

/datum/ai_holder/dynamic/proc/assign_task(datum/ai_dynamic_task/task)
	task.assign_to_holder(src)

/datum/ai_holder/dyanmic/proc/evict_active_task()
	#warn impl
