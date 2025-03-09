//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

/**
 * Style for /obj/machinery/door.
 */
/datum/prototype/door_style
	/// Our name
	var/name

	/// Our main icon
	///
	/// The icon must contain:
	/// * "[icon_state]-open", as a base state
	/// * "[icon_state]-closed", as a base state
	/// * "[icon_state]-opening", as a base state
	/// * "[icon_state]-closing", as a base state
	///
	/// The icon may contain:
	/// * "[icon_state]-open-panel", as an overlay
	/// * "[icon_state]-closed-panel", as an overlay
	var/icon
	/// Our base state
	var/icon_state

	/// The icon has a 'deny' state.
	///
	/// If set, the icon must contain:
	/// * "[icon_state]-deny", as a base state, if [icon_deny_is_overlay] is FALSE
	/// * "{icon_state]-deny", as an overlay, if [icon_deny_is_overlay] is TRUE
	var/icon_deny_exists = FALSE
	/// See [icon_deny_exists]
	var/icon_deny_is_overlay = FALSE

	/// We are weldable.
	///
	/// The icon must contain:
	/// * "[icon_state]-open-weld", as an overlay
	/// * "[icon_state]-closed-weld", as an overlay
	var/weldable = FALSE

#warn impl
