//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

/datum/ai_holder
	/// IFF data
	///
	/// * If connected to a network, it combines with ours.
	var/datum/ai_iff/iff_holder

/**
 * @params
 * * iff_factions - An IFF faction, or a list of IFF factions
 */
/datum/ai_holder/proc/evaluate_iff(list/iff_factions)
	return iff_holder.chain_evaluate(network?.iff_holder.evaluate(iff_factions), iff_factions)
