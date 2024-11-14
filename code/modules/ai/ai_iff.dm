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
/datum/ai_iff/proc/evaluate(list/iff_factions, enraged)
	if(islist(iff_factions))
		if(length(always_allies & iff_factions))
			return AI_IFF_FRIENDLY
		if(enraged)
			return AI_IFF_HOSTILE
		if(length(maybe_allies & iff_factions))
			return AI_IFF_FRIENDLY
		if(length(enemies & iff_factions))
			return AI_IFF_HOSTILE
		return AI_IFF_NEUTRAL
	else
		if(iff_factions in always_allies)
			return AI_IFF_FRIENDLY
		if(enraged)
			return AI_IFF_HOSTILE
		if(iff_factions in maybe_allies)
			return AI_IFF_FRIENDLY
		if(iff_factions in enemies)
			return AI_IFF_HOSTILE
		return AI_IFF_NEUTRAL

/**
 * @params
 * * higher_level_result - result from a level higher
 * * iff_factions - string of their faction or factions
 * * enraged - we're very, very mad at them (usually from friendly fire)
 * * optimistic - use more friendly result instead of more hostile result
 *
 * @return AI_IFF_* result
 */
/datum/ai_iff/proc/chain_evaluate(higher_level_result, list/iff_factions, enraged, optimistic)
	var/our_result = evaluate(iff_factions, enraged)
	return optimistic ? max(our_result, higher_level_result) : min(our_result, higher_level_result)

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
