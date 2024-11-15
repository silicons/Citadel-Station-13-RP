//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

/datum/ai_adapter
	/// splash: only hits mobs
	var/splash_hint_mob_only = FALSE
	/// splash: requires line of sight
	var/splash_hint_requires_sight = FALSE
	/// splash: requires reachable projectile raycast
	var/splash_hint_projectile_raycast = FALSE
	/// splash: is a limited resource
	var/splash_hint_limited_resource = FALSE
	/// splash: min range
	var/splash_min_range
	/// splash: max range
	var/splash_max_range

/**
 * @return AI_ADAPTER_STATUS_* or /datum/ai_adapter_return
 */
/datum/ai_adapter/proc/query_splash(datum/ai_holder/requesting, atom/primary_target, list/atom/all_targets)

/**
 * @return AI_ADAPTER_STATUS_* or /datum/ai_adapter_return
 */
/datum/ai_adapter/proc/run_splash(datum/ai_holder/requesting, turf/center)

#warn impl / rework ?
