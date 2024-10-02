//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

/datum/melee_swing_cycle
	/// the attacking atom
	///
	/// * non-mobs can use melee swings, so this is not the same as clickchain;
	///   clickchains are only initiated by mobs
	var/atom/attacker
	/// the actor-performer clickchain data
	///
	/// * this can be null!
	var/datum/event_args/actor/clickchain/clickchain

	/// the melee swing datum we represent a swing of
	var/datum/melee_swing/swing
	/// blackboard variable for the swing to store arbitary data as needed during a swing
	var/list/swing_blackboard

	/// world.time this swing was initiated
	var/start_time
	/// already hit
	///
	/// * a swing cycle can only hit one thing at a time, ever
	var/list/atom/already_hit = list()

/datum/melee_swing_cycle/New(atom/attacker, datum/melee_swing/swing, datum/event_args/actor/clickchain/clickchain, list/initial_blackboard)
	src.attacker = attacker
	src.swing = swing
	src.clickchain = clickchain
	src.swing_blackboard = initial_blackboard || list()

/datum/melee_swing_cycle/proc/do_the_swing(atom/from_atom)

/datum/melee_swing_cycle/proc/moved_hook(atom/source)

#warn impl all
#warn debug visualizations
