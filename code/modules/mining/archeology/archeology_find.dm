//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

/**
 * Generalized way to embed things in rocks.
 *
 * * drilling from start to end when this is found will extract cleanly if the tool is cautious enough
 * * you discover this by digging to start depth without going over
 */
/datum/archeology_find
	/// was safely found without breaking
	var/confirmed_border = FALSE
	/// can be dug out without being trapped in rock
	var/confirmed_fully = FALSE
	/// depth start (cm)
	var/depth_start
	/// depth end (cm)
	/// * we are safely extracted if we get to depth end
	var/depth_end
	/// stored entity
	/// * templates that eagerly start active use this, and stored entities get put in an
	///   /atom/movable/archeology_embedded_container
	/// * we will use this instead of the template if this exists
	var/atom/movable/active_entity
	/// template

	#warn template?

#warn what does this bind to?
/**
 * Common proc, binds to
 */
/datum/archeology_find/proc/ui_scanner_data()
	return list(
		"depthStart" = depth_start,
		"depthEnd" = depth_end,
	)

/datum/archeology_find/proc/spawn_at_encased(atom/where) as /atom/movable

/datum/archeology_find/proc/spawn_at(atom/where) as /atom/movable

#warn impl
