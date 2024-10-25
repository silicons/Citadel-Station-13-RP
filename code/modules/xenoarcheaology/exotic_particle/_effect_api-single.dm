//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers          *//

//* API: Single Target *//

/**
 * @params
 * * target_or_targets - an atom, or a list of atoms to hit
 * * power - how hard to hit the atoms in question
 * * polarity_config - polarity configuration to use
 * * visual_delegate - the renderer to use for visuals
 */
/datum/exotic_particle/proc/affect_single(list/atom/target_or_targets, power, datum/exotic_polarity/polarity_config, datum/exotic_cast_visuals/visual_delegate)
	for(var/datum/exotic_effect_instance/effect_instance as anything in effects)
		#warn impl

/**
 * @params
 * * targets - a list of targets to hit
 * * power - strength of emission
 * * polarities - a list of relevant k-v polarities to hit them with
 * * visuals - the visual renderer
 */
/datum/exotic_effect/proc/affect_single(list/atom/targets, power, list/polarities, datum/exotic_cast_visuals/visuals)
	return
