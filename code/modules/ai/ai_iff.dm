//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

/**
 * Stores IFF faction data for an AI holder or AI network
 */
/datum/ai_iff
	/// explicitly never-attack, always-ally IFF factions
	var/list/always_allies
	/// allies unless too much aggression happens
	var/list/maybe_allies
	/// explicit enemies / engage-on-sight
	var/list/enemies

/**
 * @return AI_IFF_* result
 */
/datum/ai_iff/proc/evaluate(list/iff_factions)
	#warn impl

/**
 * @return AI_IFF_* result
 */
/datum/ai_iff/proc/chain_evaluate(higher_level_result, list/iff_factions)
	#warn impl

/**
 * used for networks
 *
 * * coalesce_optimistic() / coalesce_pessimistic() must be manually called after
 */
/datum/ai_iff/proc/unsafe_merge_from(datum/ai_iff/other)
	if(other.always_allies)
		if(always_allies)
			always_allies |= other.always_allies
		else
			always_allies = other.always_allies.Copy()
	if(other.maybe_allies)
		if(maybe_allies)
			maybe_allies |= other.maybe_allies
		else
			maybe_allies = other.maybe_allies.Copy()
	if(other.enemies)
		if(enemies)
			enemies |= other.enemies
		else
			enemies = other.enemies.Copy()

/**
 * used for networks
 */
/datum/ai_iff/proc/coalesce_optimistic()
	if(always_allies)
		if(maybe_allies)
			maybe_allies -= always_allies
		if(enemies)
			enemies -= always_allies
	if(maybe_allies)
		enemies -= maybe_allies

/**
 * used for networks
 */
/datum/ai_iff/proc/coalesce_pessimistic()
	if(enemies)
		if(maybe_allies)
			maybe_allies -= enemies
		if(always_allies)
			always_allies -= enemies
	if(maybe_allies)
		always_allies -= maybe_allies
