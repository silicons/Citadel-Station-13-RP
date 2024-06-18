//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 silicons                             *//

/**
 * makes something glow under thermals
 */
/datum/component/thermal_image
	/// do we spread outwards?
	var/spreads_outwards = FALSE

/datum/component/thermal_image/Initialize()
	if(!ismovable(parent))
		return COMPONENT_INCOMPATIBLE
	return ..()

/datum/component/thermal_image/RegisterWithParent()
	. = ..()
	RegisterSignal(parent, COMSIG_MOVABLE_MOVED, PROC_REF(update))
	build(parent)

/datum/component/thermal_image/UnregisterFromParent()
	. = ..()
	UnregisterSignal(parent, COMSIG_MOVABLE_MOVE)
	clean(parent)

/datum/component/thermal_image/proc/update(atom/movable/source, atom/oldloc)
	var/atom/newloc = source.loc

	if((newloc == oldloc) || (isturf(newloc) && isturf(oldloc)))
		return

	#warn uhh

/datum/component/thermal_image/proc/build(atom/movable/root = parent)

/datum/component/thermal_image/proc/clean(atom/movable/root = parent)

/**
 * makes something spread its thermal glow to containers holding it as well
 */
/datum/component/thermal_image/recursing
	spreads_outwards = TRUE

#warn impl

