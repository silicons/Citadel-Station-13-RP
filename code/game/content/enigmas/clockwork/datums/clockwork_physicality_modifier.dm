//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 silicons                             *//

/**
 * holder datum for clockwork modifiers to apply to a /datum/clockwork_physicality
 */
/datum/clockwork_physicality_modifier
	/// force resonance to this level or higher
	var/forced_resonance = 0
	/// force attunement to this level or higher
	var/forced_attunement = 0
	/// force knowledge to this level or higher
	var/forced_knowledge = 0

	/// dissipation rate multiplier
	var/dissipation_rate_modifier = 1
