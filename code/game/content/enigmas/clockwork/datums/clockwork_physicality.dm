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
