//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

/datum/ai_holder
	/// discovered attack adapters
	var/tmp/list/datum/ai_adapter/attack/adapters_for_attack
	/// discovered defense adapters
	var/tmp/list/datum/ai_adapter/defense/adapters_for_defense
	/// discovered recovery adapters
	var/tmp/list/datum/ai_adapter/recovery/adapters_for_recovery
	/// discovered maneuvering adapters
	var/tmp/list/datum/ai_adapter/maneuver/adapters_for_maneuvering
	/// adapter types we care about
	var/adapters_supported
	/// adapters should be invalidated at
	var/tmp/adapters_invalidate_at

#warn impl
