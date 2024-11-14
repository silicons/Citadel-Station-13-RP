//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

/datum/ai_adapter
	/// maneuver: requires LoS
	///
	/// * This is used for prefiltering. The actual check happens in a proc.
	var/maneuver_hint_requires_los = FALSE
	/// maneuver: low range
	///
	/// * This is the lowest range that a manevuering action can end at.
	/// * This is used for prefiltering. The actual check happens in a proc.
	var/maneuver_range_low
	/// maneuver: high range
	///
	/// * This is the high range that a manevuering action can end at.
	/// * This is used for prefiltering. The actual check happens in a proc.
	var/maneuver_range_high

/datum/ai_adapter/proc/query_maneuver(datum/ai_holder/requesting, turf/target)

/datum/ai_adapter/proc/run_maneuver(datum/ai_holder/requesting, turf/target)

#warn impl
