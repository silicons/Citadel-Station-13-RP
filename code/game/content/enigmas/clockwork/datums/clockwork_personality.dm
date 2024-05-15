//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 silicons                             *//

/**
 * epoch-based technology are considered to be semi-intelligent, in that
 * they have personalities and biases.
 *
 * the smarter things are flat out half-sapient or fully sapient,
 * but even simple tools have an inherent bias based on the user.
 */
/datum/clockwork_personality
	/// how curious something is; how willing the object is
	/// to do / act in a novel way
	///
	/// value: 0 to INFINITY, as multiplier.
	var/curious = 1
	/// how aggressive something is; how willing the object is
	/// to act in a negative manner to achieve a goal
	///
	/// value: 0 to INFINITY, as multiplier.
	var/aggressive = 1
	/// how proactive something is; how likely the object is to
	/// do things in advance of when it is strictly necessary
	///
	/// value: 0 to INFINITY, as multiplier.
	var/proactive = 1
	/// how much the object cares about the user being the 'correct' / 'legitimate' user
	///
	/// value: 0 to INFINITY, as multiplier.
	var/righteous = 1
	/// how likely the object is to do things that will hurt people, especially
	/// those whom are not attuned with its alignment
	///
	/// value: 0 to INFINITY, as multiplier.
	var/malice = 1
	
