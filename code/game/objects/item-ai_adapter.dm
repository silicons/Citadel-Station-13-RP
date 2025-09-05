//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station developers.          *//

/**
 * Generic item adapter.
 */
/datum/ai_adapter/item
	/// always valid melee object
	var/melee_always_valid = FALSE
	/// cutoff at which below we're considered pretty much
	/// worse than fists
	var/melee_auto_damage_cutoff = 10

#warn impl

/**
 * @params
 * * agent - (optional) entity the AI is controlling
 * * target - (optional) target we're attacking
 * * offensive_flags - AI_ADAPTER_OFFENSIVE_* flags
 *
 * @return score; higher has higher priority, generally.
 */
/datum/ai_adapter/item/proc/rate_melee_suitability(atom/movable/agent, atom/target, offensive_flags)
	var/obj/item/casted_item = delegate
	#warn default calcs
