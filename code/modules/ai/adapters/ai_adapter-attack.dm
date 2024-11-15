//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

/datum/ai_adapter
	/// attack: only hits mobs
	var/attack_hint_mob_only = FALSE
	/// attack: requires line of sight
	var/attack_hint_requires_sight = FALSE
	/// attack: requires reachable projectile raycast
	var/attack_hint_projectile_raycast = FALSE
	/// attack: is a limited resource
	var/attack_hint_limited_resource = FALSE
	/// attack: min range
	var/attack_min_range
	/// attack: max range
	var/attack_max_range

/**
 * @return AI_ADAPTER_STATUS_* or /datum/ai_adapter_return
 */
/datum/ai_adapter/proc/query_attack(datum/ai_holder/requesting, atom/target)

/**
 * @return AI_ADAPTER_STATUS_* or /datum/ai_adapter_return
 */
/datum/ai_adapter/proc/run_attack(datum/ai_holder/requesting, atom/target)

#warn impl
