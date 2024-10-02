//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

/**
 * A weapon that swings in an arc.
 *
 * * The weapon's reach becomes the arc's radius. Be very careful with high-radius weapons.
 */
/datum/melee_swing/simple_arc
	/// arc, in degrees
	///
	/// * 45 or below will generally hit forwards, then expand
	/// * 90 or below will generally hit forwards, and diagonal-forwards.
	/// * 180 or below will hit forwards, diagonal-forwards, and sides.
	var/arc_degrees = 90
	/// radius, in pixels
	///
	/// * null to default to weapon reach.
	var/arc_radius
	/// does the swing start from the mob?
	///
	/// * if it does, and arc is going to hit sides, we will hit our sides as well.
	var/start_on_top_of_attacker = FALSE

#warn impl

/datum/melee_swing/simple_arc/perform_scan(list/blackboard, atom/attacker, angle, atom/target)
