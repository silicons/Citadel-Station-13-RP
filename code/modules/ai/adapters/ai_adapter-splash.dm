//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

/datum/ai_adapter
	/// splash: only hits mobs
	var/splash_hint_mob_only = FALSE
	/// splash: is a limited resource
	var/splash_hint_limited_resource = FALSE
	/// splash: min range
	var/splash_min_range
	/// splash: max range
	var/splash_max_range

/datum/ai_adapter/proc/query_splash(datum/ai_holder/requesting, atom/primary_target, list/atom/all_targets)

/datum/ai_adapter/proc/run_splash(datum/ai_holder/requesting, atom/target)

#warn impl / rework ?
