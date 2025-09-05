//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station developers.          *//

/datum/ai_holder/dynamic
	//* system *//

	/// default idle tick-rate. you usually shouldn't touch this.
	/// * this is not the movement handler, this is the tick() handler.
	var/system_idle_tick_interval = 5 SECONDS

	//* introspection *//

	#ifdef AI_INTROSPECTION
	/// stores last X thoughts
	var/list/introspection_thoughts
	#endif

	//* state *//

	/// main state holder. unlike combat / steering routine contexts,
	/// this doesn't get wiped.
	var/datum/ai_dynamic_state/state
	/// currently active task
	var/datum/ai_dynamic_task/state_task

	//* adapters *//

	/// available adapters
	var/list/datum/ai_adapter/adapter_list
	/// last adapter update
	var/adapter_last_update = 0

	//* combat *//

	/// active combat routine
	var/datum/ai_dynamic_combat/combat_routine
	/// active combat routine context
	var/datum/ai_dynamic_combat_context/combat_routine_context
	/// last time combat adapters were reconsidered
	var/combat_last_adapter_update = 0

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
	var/datum/ai_dynamic_steering_context/steering_routine_context
	/// last time movement adapters were reconsidered
	var/steering_last_adapter_update = 0

	//* tuning *//

	/// reaction time low
	var/tuning_reaction_time_low = 1.75
	var/tuning_reaction_time_high = 3.75

/datum/ai_holder/dynamic/proc/assign_task(datum/ai_dynamic_task/task)
	task.assign_to_holder(src)

/datum/ai_holder/dyanmic/proc/evict_active_task()
	#warn impl
