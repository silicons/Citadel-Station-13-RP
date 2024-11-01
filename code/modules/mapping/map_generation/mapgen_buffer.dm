//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

/datum/mapgen_buffer
	/// x 1 left of lower left corner
	var/base_x
	/// y 1 left of lower left corner
	var/base_y
	/// width
	var/width
	/// height
	var/height

	//* Generation *//

	/// arbitrary blackboard preserved through the whole generation process
	var/list/generate_blackboard = list()
	/// row-major y = 1 to y = maximum lookup list
	///
	/// * basically, L[x + (y - 1) * width] = your turf
	/// * entry can be terrain descriptor or null
	var/list/datum/mapgen_descriptor/terrain/generate_terrain = list()
	/// list of structure descriptors generated
	var/list/datum/mapgen_descriptor/structure/generate_structure = list()
	/// list of spot descriptors generated
	var/list/datum/mapgen_descriptor/spot/generate_spot = list()
	/// start REALTIMEOFDAY
	var/generate_start_realtimeofday
	/// end REALTIMEOFDAY
	var/generate_end_realtimeofday
	/// list of deciseconds taken per layer; ordered per layers, with layer associated to time
	var/list/datum/mapgen_layer/generate_layer_timings = list()

	//* Application *//

	/// arbitrary blackboard preserved through the whole load process
	var/list/apply_blackboard = list()
	/// stat tracking: total turf changes
	var/apply_turf_spawn_count = 0
	/// stat tracking: total structure instantiations
	var/apply_structure_spawn_count = 0
	/// stat tracking: total spot instantiations
	var/apply_spot_spawn_count = 0
	/// start REALTIMEOFDAY
	var/apply_start_realtimeofday
	/// end REALTIMEOFDAY
	var/apply_end_realtimeofday

/datum/mapgen_buffer/proc/initialize(base_x, base_y, width, height)
	src.base_x = base_x
	src.base_y = base_y
	src.width = width
	src.height = height

//* Generation - Terrain Helpers *//

/**
 * Undefined behavior if called after terrain phase.
 */
/datum/mapgen_buffer/proc/seal(x1, y1, x2, y2)
	if(x2 || y2)
		// block mode
		ASSERT(x1 <= x2)
		ASSERT(y1 <= y2)
		for(var/x in x1 to x2)
			for(var/y in y1 to y2)
				var/index = x + (y - 1) * width
				var/datum/mapgen_descriptor/terrain/terrain = generate_terrain[index]
				if(!terrain)
					generate_terrain[index] = GLOB.mapgen_terrain_descriptor_sealed
				else if(terrain.sealed)
				else
					terrain.sealed = TRUE
	else
		// turf mode
		var/index = x1 + (y1 - 1) * width
		var/datum/mapgen_descriptor/terrain/terrain = generate_terrain[index]
		if(!terrain)
			generate_terrain[index] = GLOB.mapgen_terrain_descriptor_sealed_baseturf
		else if(terrain.sealed)
		else
			terrain.sealed = TRUE

/**
 * Undefined behavior if called after terrain phase.
 */
/datum/mapgen_buffer/proc/structurize(x1, y1, x2, y2)
	if(x2 || y2)
		// block mode
		ASSERT(x1 <= x2)
		ASSERT(y1 <= y2)
		for(var/x in x1 to x2)
			for(var/y in y1 to y2)
				var/index = x + (y - 1) * width
				var/datum/mapgen_descriptor/terrain/terrain = generate_terrain[index]
				if(!terrain)
					terrain = new
					terrain.structurized = TRUE
					generate_terrain[index] = terrain
				else if(terrain.sealed)
				else
					terrain.structurized = TRUE
	else
		// turf mode
		var/index = x1 + (y1 - 1) * width
		var/datum/mapgen_descriptor/terrain/terrain = generate_terrain[index]
		if(!terrain)
			terrain = new
			terrain.structurized = TRUE
			generate_terrain[index] = terrain
		else if(terrain.sealed)
		else
			terrain.structurized = TRUE

/**
 * Undefined behavior if called after terrain phase.
 */
/datum/mapgen_buffer/proc/fill_turf(x1, y1, x2, y2, turf_type)
	ASSERT(x1 <= x2)
	ASSERT(y1 <= y2)
	for(var/x in x1 to x2)
		for(var/y in y1 to y2)
			var/index = x + (y - 1) * width
			var/datum/mapgen_descriptor/terrain/terrain = generate_terrain[index]
			if(!terrain)
				terrain = new
				terrain.turf_type = turf_type
				generate_terrain[index] = terrain
			else if(terrain.sealed)
			else
				terrain.turf_type = turf_type

/**
 * Undefined behavior if called after terrain phase.
 */
/datum/mapgen_buffer/proc/fill_biome(x1, y1, x2, y2, biome)
	ASSERT(x1 <= x2)
	ASSERT(y1 <= y2)
	for(var/x in x1 to x2)
		for(var/y in y1 to y2)
			var/index = x + (y - 1) * width
			var/datum/mapgen_descriptor/terrain/terrain = generate_terrain[index]
			if(!terrain)
				terrain = new
				terrain.biome = biome
				generate_terrain[index] = terrain
			else if(terrain.sealed)
			else
				terrain.biome = biome

/**
 * Undefined behavior if called after terrain phase.
 */
/datum/mapgen_buffer/proc/fill_terrain(x1, y1, x2, y2, turf_type, biome)
	ASSERT(x1 <= x2)
	ASSERT(y1 <= y2)
	for(var/x in x1 to x2)
		for(var/y in y1 to y2)
			var/index = x + (y - 1) * width
			var/datum/mapgen_descriptor/terrain/terrain = generate_terrain[index]
			if(!terrain)
				terrain = new
				terrain.turf_type = turf_type
				terrain.biome = biome
				generate_terrain[index] = terrain
			else if(terrain.sealed)
			else
				terrain.turf_type = turf_type
				terrain.biome = biome

//* Application *//

/datum/mapgen_buffer/proc/apply(turf/lower_left, turf/upper_right)

#warn impl
