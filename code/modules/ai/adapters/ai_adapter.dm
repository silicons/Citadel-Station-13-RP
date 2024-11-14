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
	/// adapter types that we are
	var/adapter_types
