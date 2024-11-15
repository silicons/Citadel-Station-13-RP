//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

/**
 * Adapter datum for AI to be able to parse its capabiltiies and
 * generate a list of what they can do.
 *
 * * An adapter binds to an entity. This may be the mob itself, something it can do,
 *   something it is operating, or something it is able to wield / handle.
 * * An adapter has a set of capabilities.
 *
 * ## Capabilities
 *
 * * Attack: Run an attack against a target or a list of targets.
 * * Maneuver: Move to a target location
 * * Splash: Run an AoE attack against a set of targets or an area
 */
/datum/ai_adapter
	//* API*//

	/// adapter types that we are
	var/adapter_types

	//*                        State / Blackboard                        *//
	//* This is set by the AI at will, and reset when a new AI binds us. *//
	//*             This should never hold hard references.              *//

	/// number of times we failed without a way to rectify
	///
	/// * anything but range / reload / cooldown, basically
	/// * used by participating AIs to know when to re-evaluate which adapter we're using
	var/bb_failure_strikes = 0
	/// are we currently active?
	///
	/// * helps avoid needing to have complex override behavior,
	///   as we can read this to know if an item is an active adapter 
	var/bb_is_active = FALSE

/datum/ai_adapter/proc/reset_state()
	bb_failure_strikes = 0
	bb_is_active = TRUE

/**
 * Check if we're ready
 * 
 * @return TRUE / FALSE
 */
/datum/ai_adapter/proc/is_ready()
	return FALSE

/**
 * Attempt to ready ourselves.
 * 
 * * Example: Drawing a weapon.
 * 
 * This is a blocking proc.
 * 
 * @params
 * * holder - the holder we're on
 * * telegraph_priority - if set, we are allowed to telegraph with that priority
 * * override - allow doing things like stowing other weapons, and whatnot
 * * force - allow trampling all state and ignoring most safety checks
 * 
 * @return TRUE if successful, FALSE if not
 */
/datum/ai_adapter/proc/ready(datum/ai_holder/holder, telegraph_priority, override, force)
	return FALSE

/**
 * Un-ready ourselves.
 * 
 * * Example: Stowing a weapon.
 * 
 * This is a blocking proc.
 * 
 * @params
 * * holder - the holder we're on
 * * telegraph_priority - if set, we are allowed to telegraph with that priority
 * 
 * @return TRUE if successful, FALSE if not
 */
/datum/ai_adapter/proc/unready(datum/ai_holder/holder, telegraph_priority)
	return TRUE
