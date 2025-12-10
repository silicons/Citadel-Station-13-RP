//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

#warn impl

/**
 * effectively acts as a signal grid relay that datums can register signals onto.
 */
/datum/component/signal_grid
	dupe_mode = COMPONENT_DUPE_UNIQUE
	registered_type = /datum/component/signal_grid
	/// target spatial grid
	var/datum/signal_grid/grid
	/// target grid width
	var/grid_width
	/// last grid index
	var/current_index

/datum/component/signal_grid/Initialize(datum/signal_grid/grid, datum/callback/on_signal)
	. = ..()
	if(. == COMPONENT_INCOMPATIBLE)
		return
	if(!ismovable(parent))
		return COMPONENT_INCOMPATIBLE

	src.grid = grid
	src.grid_width = grid.width

/datum/component/signal_grid/RegisterWithParent()
	..()
	construct()

/datum/component/signal_grid/UnregisterFromParent()
	teardown()
	..()

/datum/component/signal_grid/proc/construct(atom/root = parent)
	while(ismovable(root))
		RegisterSignal(root, COMSIG_MOVABLE_MOVED, PROC_REF(update))
		root = root.loc
	if(isturf(root))
		var/idx = ceil(root.x / TURF_CHUNK_RESOLUTION) + grid_width * (ceil(root.y / TURF_CHUNK_RESOLUTION) - 1)
		grid.direct_insert(parent, root.z, idx)
		current_index = idx

/datum/component/signal_grid/proc/teardown(atom/root = parent)
	while(ismovable(root))
		UnregisterSignal(root, COMSIG_MOVABLE_MOVED)
		root = root.loc
	if(isturf(root))
		grid.direct_remove(parent, root.z, current_index)
		current_index = null

/datum/component/signal_grid/proc/update(atom/movable/source, atom/oldloc)
	var/atom/newloc = source.loc
	if(newloc == oldloc)
		return
	// turf --> turf, try to do an optimized, lazy update
	if(isturf(oldloc) && isturf(newloc) && (oldloc.z == newloc.z))
		var/new_index = ceil(newloc.x / TURF_CHUNK_RESOLUTION) + grid_width * (ceil(newloc.y / TURF_CHUNK_RESOLUTION) - 1)
		var/z = oldloc.z
		if(new_index != current_index)
			grid.direct_remove(parent, z, current_index)
			grid.direct_insert(parent, z, new_index)
			current_index = new_index
	// turf --> somewhere else or somewhere else --> turf or somewhere else --> somewhere else, do full cycle
	else
		teardown(oldloc)
		construct(newloc)

/datum/component/signal_grid/proc/register_listener(datum/listener, signal, procref)

/datum/component/signal_grid/proc/unregister_listener(datum/listener, signal)

/datum/proc/RegisterSpatialSignal(atom/movable/target, signal_type, proc_type, override)
	var/datum/component/signal_grid/target_grid_comp = target.LoadComponent(/datum/component/signal_grid)
	RegisterSignal(target_grid_comp, signal_type, proc_type, override)

/datum/proc/UnregisterSpatialSignal(atom/movable/target, signal_type)
	var/datum/component/signal_grid/target_grid_comp = target.GetComponent(/datum/component/signal_grid)
	if(!target_grid_comp)
		return
	UnregisterSignal(target_grid_comp, signal_type)

/**
 * Don't use this directly, use the [SEND_SPATIAL_SIGNAL] define.
 */
/datum/controller/subsystem/dcs/proc/_SendSpatialSignal(turf/location, range, sigtype, list/arguments)
	// invoke handlers with (location, ...arguments)

#warn impl
