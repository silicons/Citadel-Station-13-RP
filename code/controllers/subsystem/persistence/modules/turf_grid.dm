//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 silicons                             *//

/**
 * turf grid module
 *
 * handles serializing/deserializing turf grids
 */
/datum/controller/subsystem/persistence

// currently unimplemented due to a lack of need

// todo: code this

#warn fuck

/datum/turf_grid_persistence
	var/width
	var/height
	var/list/datum/turf_grid_persistence_chunk/ordered_chunks
	var/chunk_size

/datum/turf_grid_persistence_chunk
	var/size
	var/list/dirt

/datum/turf_grid_persistence_chunk/proc/collect(start_x, start_y)

/datum/turf_grid_persistence_chunk/proc/apply(start_x, start_y)
