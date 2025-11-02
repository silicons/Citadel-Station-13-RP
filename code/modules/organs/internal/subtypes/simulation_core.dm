//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

/**
 * Simulation Cores
 *
 * * Replaces Soulcatchers which is a legacy Virgo concept.
 * * Allows the person owning it to make more avatars.
 * * Allows capturing mirrors that are considered 'reachable', including the person's own if they die.
 */
/obj/item/organ/internal/simulation_core
	name = "simulation core"
	desc = "A highly advanced computer core capable of running virtual reality simulations."
	organ_action_name = "Simulation Controller"
	organ_action_desc = "Access the controls for your simulation core."
	robotic = ORGAN_ROBOT

	var/datum/simulation_core/simulation

	/// captured mirrors
	/// * use the procs to add/remove, signals will be registered to check for validity
	var/list/obj/item/implant/mirror/captured_mirrors

#warn impl

/obj/item/organ/internal/simulation_core/proc/capture_mirror(obj/item/implant/mirror/mirror)

/obj/item/organ/internal/simulation_core/proc/release_mirror(obj/item/implant/mirror/mirror)

/**
 * Will not return any already captured.
 */
/obj/item/organ/internal/simulation_core/proc/scan_for_capturable_mirrors()

/**
 * Returns if a mirror can be maintained as a captured mirror.
 */
/obj/item/organ/internal/simulation_core/proc/check_mirror_capturing_distance(obj/item/implant/mirror/mirror)

