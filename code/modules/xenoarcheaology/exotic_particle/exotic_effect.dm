//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 silicons                             *//

/**
 * xenoarcheology core: exotic effects
 *
 * description WIP
 */
/datum/exotic_effect
	/// name
	var/name

	//* Visuals *//

	/// should we be visible on turf?
	var/visible = FALSE
	/// visual priority; bigger number is higher priority
	///
	/// * the more devastating this effect is the higher this should be
	/// * e.g. something that just causes an uneasy feeling should be eclipsed by a particle that incinerates you
	var/visual_priority = 0



#warn impl all
