//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

/datum/event_args/tesla_zap
	/// origin
	/// * copied as ref for speed, so we know what the bolt is from.
	/// * this means don't edit it numbnuts, this is an immutable!
	/// * kept when forking, as a ref
	var/datum/tesla_zap_initiation/initiation
	/// arbitrary k-v data list
	/// * kept when forking, as a copy
	var/alist/data
	/// already hit
	/// * things in here won't be hit again
	/// * not kept when forking
	var/alist/permutated
	/// bounce counts
	/// * the source is set to 1 at start
	/// * every time we bounce off of something this increments
	/// * kept when forking, as a copy
	var/alist/bounced

	/// energy in current arc, as kilojoules
	var/energy = 0

/**
 * call to init fresh
 */
/datum/event_args/tesla_zap/proc/init_fresh(datum/tesla_zap_initiation/initiation)
	#warn impl

// todo: de/serialize

/datum/event_args/tesla_zap/clone()
	var/datum/event_args/tesla_zap/cloned = new
	cloned.initiation = initiation
	cloned.data = data.Copy()
	cloned.permutated = permutated.Copy()
	cloned.energy = energy
	return cloned

/**
 * call to make an event_args to use to resume
 */
/datum/event_args/tesla_zap/proc/clone_as_bounce()
	#warn impl

/**
 * call to make an event_args to use to perform a fork
 */
/datum/event_args/tesla_zap/proc/clone_as_fork()
	#warn impl

//* simulation *//

/**
 * get fork chance at given node
 */
/datum/event_args/tesla_zap/proc/get_fork_chance(atom/movable/current)
	return 20

/**
 * get fork amount at given node
 */
/datum/event_args/tesla_zap/proc/get_fork_amount(atom/movable/current)
	return 2
