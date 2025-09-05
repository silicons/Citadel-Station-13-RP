//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers          *//

/datum/ai_holder/dynamic
	//* system *//

	/// default idle tick-rate. you usually shouldn't touch this.
	/// * this is not the movement handler, this is the tick() handler.
	var/system_idle_tick_interval = 5 SECONDS

	//* state *//

	/// main state holder. unlike combat / steering routine contexts,
	/// this doesn't get wiped.
	var/datum/ai_dynamic_state/state

	//* adapters *//

	/// available adapters
	var/list/datum/ai_adapter/adapter_list
	/// last adapter update
	var/adapter_last_update = 0
	/// last adapter gc update
	/// * gc updates are fired off way more frequently than normal updates,
	///   and must run every 10 or so seconds maximum
	var/adapter_last_gc = 0

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

	//* tasking *//

	/// currently active task
	var/datum/ai_dynamic_task/state_task

	//* tuning *//

	/// reaction time low in **milliseconds**
	var/tuning_reaction_time_low = 175
	/// reaction time high in **milliseconds**
	var/tuning_reaction_time_high = 375

/datum/ai_holder/dynamic/tick()
	// don't you dare, guncoder
	SHOULD_NOT_OVERRIDE(TRUE)

	on_custom_tick()

	#warn impl
