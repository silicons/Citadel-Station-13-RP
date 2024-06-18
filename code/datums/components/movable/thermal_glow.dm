//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 silicons                             *//

/**
 * the actual thermal glow
 */
/datum/component/thermal_glow
	var/atom/movable/render/thermal_glow/render
	var/updating = FALSE

/datum/component/thermal_glow/Initialize()
	if(!ismovable(parent))
		return COMPONENT_INCOMPATIBLE
	render = new
	return ..()

/datum/component/thermal_glow/RegisterWithParent()
	. = ..()
	RegisterSignal(parent, COMSIG_ATOM_COMPILED_OVERLAYS, PROC_REF(update))
	parent:vis_contents += render

/datum/component/thermal_glow/UnregisterFromParent()
	. = ..()
	UnregisterSignal(parent, COMSIG_ATOM_COMPILED_OVERLAYS)
	parent:vis_contents -= render

/datum/component/thermal_glow/proc/update(atom/movable/source)
	render.copy_overlays(source)

/atom/movable/render/thermal_glow
	#warn impl

/atom/movable/proc/add_thermal_glow_source(source)
	var/had = HAS_TRAIT(src, TRAIT_MOVABLE_THERMAL_GLOW)
	ADD_TRAIT(src, TRAIT_MOVABLE_THERMAL_GLOW, source)
	if(!had)
		AddComponent(/datum/component/thermal_glow)

/atom/movable/proc/remove_thermal_glow_source(source)
	var/had = HAS_TRAIT(src, TRAIT_MOVABLE_THERMAL_GLOW)
	REMOVE_TRAIT(src, TRAIT_MOVABLE_THERMAL_GLOW, source)
	var/has = HAS_TRAIT(src, TRAIT_MOVABLE_THERMAL_GLOW)
	if(had && !has)
		DelComponent(/datum/component/thermal_glow)
