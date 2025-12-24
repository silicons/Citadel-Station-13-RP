//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

/**
 * A single saycode transmission cycle
 */
/datum/saycode_transmit
	/// tracks who already heard this
	/// * [atom] = TRUE
	var/list/heard = list()

#warn impl

/**
 * Shallow-copies for redirection.
 * * This allows us to redirect it through say, a holopad
 * * This will keep 'heard' linked between the two datums
 *   to mitigate double-hears.
 */
/datum/saycode_transmit/proc/shallow_copy_for_redirection()
	var/datum/saycode_transmit/transmit = new
	transmit.heard = src.heard
	return transmit
