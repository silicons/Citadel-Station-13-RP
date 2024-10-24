//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers          *//

/**
 * hits a specific set of entities
 */
/datum/exotic_projection/direct
	/// things to hit associated to power
	var/list/atom/targets
	/// number of hits to perform
	var/strikes = 1
	/// strength mult per hit
	var/falloff_mult = 1
	/// strength subtract per hit
	var/falloff_sub = 0
	/// strength at which to drop
	var/drop_strength = 0

	#warn uhhhhh how do we do polarity..

/datum/exotic_projection/direct/initialize(list/targets)
	if(!islist(targets))
		targets = list(targets)
	src.targets = targets
	return TRUE

#warn impl
