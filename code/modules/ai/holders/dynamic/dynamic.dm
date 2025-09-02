//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station developers.          *//

/datum/ai_holder/dynamic
	//* system *//


	//* combat *//

	/// in combat?
	/// * this is separate from overall state as it's
	///   effectively an if block used to divert planning to
	///   spend a tick now and then to perform target engagement.
	var/combat_active = FALSE
	/// actively engaging targets
	var/list/atom/combat_engaging_targets

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

	var/steering__dodge_aggressiveness
	/// if non-zero, wander every this many deciseconds on average
	var/steering__should_wander = 0


