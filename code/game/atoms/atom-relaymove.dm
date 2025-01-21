//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

/**
 * Relaymove is such an important and weird issue that it gets its own file.
 */

/**
 * deprecated
 */
/atom/proc/relaymove_legacy()
	return

/**
 * called when a buckled mob tries to move
 */
/atom/proc/relaymove_from_buckled(mob/user, direction, datum/event_args/actor/actor)
	. = SEND_SIGNAL(src, COMSIG_ATOM_RELAYMOVE_FROM_BUCKLED, user, direction)
	if(. & COMPONENT_RELAYMOVE_HANDLED)
		return TRUE
	return relaymove_legacy(user, direction)

/**
 * called when a mob in us tries to move (mobs cannot move if they're not on a /turf, generally)
 */
/atom/proc/relaymove_from_contents(mob/user, direction, datum/event_args/actor/actor)
	return relaymove_legacy(user, direction)
