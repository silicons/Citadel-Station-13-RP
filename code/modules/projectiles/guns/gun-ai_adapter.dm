//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station developers.          *//

/**
 * Generic gun adapter.
 */
/datum/ai_adapter/item/gun

#warn impl

/datum/ai_adapter/item/gun/proc/detect_shots_remaining()

/datum/ai_adapter/item/gun/proc/detect_shots_before_reload()

/**
 * @params
 * * agent - (optional) entity the AI is controlling
 * * target - (optional) target we're attacking
 * * offensive_flags - AI_ADAPTER_OFFENSIVE_* flags
 *
 * @return score; higher has higher priority, generally.
 */
/datum/ai_adapter/item/gun/proc/rate_gun_suitability(atom/movable/agent, atom/target, offensive_flags)
	var/obj/item/gun/casted_item = delegate
	#warn default calcs
