//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 silicons                             *//

/**
 * holder datum for clockwork data on /mob and others
 *
 * represents an actor's stats; this is, in-fact, mob-specific.
 */
/datum/clockwork_physicality
	/// a mob's connection to the Hierophant Network
	/// goes up when invocations or machinery are used
	///
	/// high enough, and you can hear the whispers of the network even without
	/// being in possession of a slab.
	var/resonance = 0
	/// charge loss per second in %
	/// lost charge is sent into the nearest subnet,
	var/charge_dissipation = 0.005
	/// charge in kilojoules
	var/charge = 0

	//* modifiers *//

	/// force resonance to this level or higher
	var/forced_resonance = 0
	/// force attunement to this level or higher
	var/forced_attunement = 0
	/// force knowledge to this level or higher
	var/forced_knowledge = 0

	/// dissipation rate multiplier
	var/dissipation_rate_modifier = 1
