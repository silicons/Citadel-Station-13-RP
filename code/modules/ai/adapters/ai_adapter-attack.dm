//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

/datum/ai_adapter
	/// attack: only hits mobs
	var/attack_hint_mob_only = FALSE
	/// attack: is a limited resource
	var/attack_hint_limited_resource = FALSE
	/// attack: min range
	var/attack_min_range
	/// attack: max range
	var/attack_max_range

/datum/ai_adapter/proc/query_attack(datum/ai_holder/requesting, atom/target)

/datum/ai_adapter/proc/run_attack(datum/ai_holder/requesting, atom/target)

#warn impl
