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
	//* location *//
	/// side length (we are a square)
	var/size
	/// bottomleft x
	var/start_x
	/// bottomleft y
	var/start_y

	//* state / config *//
	/// modes that are stored
	var/modes
	/// are we collected?
	var/collected

	//* storage *//
	var/list/dirt

/datum/turf_grid_persistence_chunk/New(start_x, start_y, size)
	src.start_x = start_x
	src.start_y = start_y
	src.size = size
	src.collected = FALSE

/datum/turf_grid_persistence_chunk/serialize()
	. = ..()
	#warn impl

/datum/turf_grid_persistence_chunk/deserialize(list/data)
	. = ..()
	#warn impl

/datum/turf_grid_persistence_chunk/proc/collect(z, modes)
	// reset
	collected = FALSE
	dirt = null

	// prepare
	src.modes = modes
	var/list/collecting_dirt = list()

	// collect
	var/list/turfs = ordered_turfs(z)
	for(var/i in 1 to length(turfs))
		var/turf/T = turfs[i]
		if(isnull(T))
			// add nulls
			collecting_dirt += null
			continue
		// dirt: null if it's not a turf with modifiable dirt or existing
		if(T.tracks_dirt && isnull(T.tracking_dirt_permanent) || (T.tracking_dirt < DIRT_TILE_MINIMUM_PERSIST))
			collecting_dirt += T.tracking_dirt
		else
			collecting_dirt += null

	// finalize
	if(modes & TURF_GRID_PERSIST_MODE_DIRT)
		src.dirt = collecting_dirt

/datum/turf_grid_persistence_chunk/proc/apply(z)
	// collect turfs
	var/list/turfs = ordered_turfs(z)

	// cache for speed
	var/list/dirt = src.dirt

	// process
	for(var/i in 1 to length(turfs))
		var/turf/T = turfs[i]

		if(dirt && isnull(T.tracking_dirt_permanent) && T.tracks_dirt)
			#warn impl

/**
 * includes nulls!
 *
 * bottom left to top right, row-first (1-1, 2-1, 3-1, ..., 1-2, ...)
 */
/datum/turf_grid_persistence_chunk/proc/ordered_turfs(z)
	. = list()
	for(var/x in start_x to start_x + size - 1)
		for(var/y in start_y to start_y + size - 1)
			. += locate(x, y, z)
