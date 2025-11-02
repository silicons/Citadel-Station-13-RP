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

//* VERBS *//

/mob/living/carbon/proc/__speak_into_simulation_core(message as text)
	set name = "NSay"
	set desc = "Speak into your simulation core as your self-avatar."
	set category = VERB_CATEGORY_IC

/mob/living/carbon/proc/__emote_into_simulation_core(message as text)
	set name = "NMe"
	set desc = "Emote into your simulation core as your self-avatar."
	set category = VERB_CATEGORY_IC

/mob/living/carbon/proc/__narrate_into_simulation_core(message as text)
	set name = "NNarrate"
	set desc = "Narrate to everyone inside your simulation core from a third-person perspective."
	set category = VERB_CATEGORY_IC

#warn impl all
