//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

/datum/mapgen_buffer
	/// seed
	var/seed
	/// x 1 left of lower left corner
	var/base_x
	/// y 1 left of lower left corner
	var/base_y
	/// width
	var/width
	/// height
	var/height

	//* Generation *//

	/// arbitrary blackboard preserved through the generation process
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
	var/list/datum/mapgen_layer/generate_deciseconds_spent_on_layer = list()

	//* Application *//

	/// arbitrary blackboard preserved through the application process
	var/list/apply_blackboard = list()
	/// stat tracking: total turf changes
	var/apply_turf_spawn_count = 0
	// /// stat tracking: total structure instantiations
	// var/apply_structure_spawn_count = 0
	// /// stat tracking: total spot instantiations
	// var/apply_spot_spawn_count = 0
	// /// start REALTIMEOFDAY
	// var/apply_start_realtimeofday
	// /// end REALTIMEOFDAY
	// var/apply_end_realtimeofday

/datum/mapgen_buffer/proc/initialize(seed, base_x, base_y, width, height)
	src.seed = seed
	src.base_x = base_x
	src.base_y = base_y
	src.width = width
	src.height = height

// //* Generation Helpers *//

// /**
//  * block off a specified area from structural generation
//  */
// /datum/mapgen_buffer/proc/block_structures(x1, y1, x2, y2)
// 	#warn impl

// //* Generation - Terrain Helpers *//

// /**
//  * Undefined behavior if called after terrain phase.
//  */
// /datum/mapgen_buffer/proc/seal(x1, y1, x2, y2)
// 	if(x2 || y2)
// 		// block mode
// 		ASSERT(x1 <= x2)
// 		ASSERT(y1 <= y2)
// 		for(var/x in x1 to x2)
// 			for(var/y in y1 to y2)
// 				var/index = x + (y - 1) * width
// 				var/datum/mapgen_descriptor/terrain/terrain = generate_terrain[index]
// 				if(!terrain)
// 					generate_terrain[index] = GLOB.mapgen_terrain_descriptor_sealed
// 				else if(terrain.sealed)
// 				else
// 					terrain.sealed = TRUE
// 	else
// 		// turf mode
// 		var/index = x1 + (y1 - 1) * width
// 		var/datum/mapgen_descriptor/terrain/terrain = generate_terrain[index]
// 		if(!terrain)
// 			generate_terrain[index] = GLOB.mapgen_terrain_descriptor_sealed_baseturf
// 		else if(terrain.sealed)
// 		else
// 			terrain.sealed = TRUE

// /**
//  * Undefined behavior if called after terrain phase.
//  */
// /datum/mapgen_buffer/proc/structurize(x1, y1, x2, y2)
// 	if(x2 || y2)
// 		// block mode
// 		ASSERT(x1 <= x2)
// 		ASSERT(y1 <= y2)
// 		for(var/x in x1 to x2)
// 			for(var/y in y1 to y2)
// 				var/index = x + (y - 1) * width
// 				var/datum/mapgen_descriptor/terrain/terrain = generate_terrain[index]
// 				if(!terrain)
// 					terrain = new
// 					terrain.structurized = TRUE
// 					generate_terrain[index] = terrain
// 				else if(terrain.sealed)
// 				else
// 					terrain.structurized = TRUE
// 	else
// 		// turf mode
// 		var/index = x1 + (y1 - 1) * width
// 		var/datum/mapgen_descriptor/terrain/terrain = generate_terrain[index]
// 		if(!terrain)
// 			terrain = new
// 			terrain.structurized = TRUE
// 			generate_terrain[index] = terrain
// 		else if(terrain.sealed)
// 		else
// 			terrain.structurized = TRUE

// /**
//  * Undefined behavior if called after terrain phase.
//  */
// /datum/mapgen_buffer/proc/fill_turf(x1, y1, x2, y2, turf_type)
// 	ASSERT(x1 <= x2)
// 	ASSERT(y1 <= y2)
// 	for(var/x in x1 to x2)
// 		for(var/y in y1 to y2)
// 			var/index = x + (y - 1) * width
// 			var/datum/mapgen_descriptor/terrain/terrain = generate_terrain[index]
// 			if(!terrain)
// 				terrain = new
// 				terrain.turf_type = turf_type
// 				generate_terrain[index] = terrain
// 			else if(terrain.sealed)
// 			else
// 				terrain.turf_type = turf_type

// /**
//  * Undefined behavior if called after terrain phase.
//  */
// /datum/mapgen_buffer/proc/fill_biome(x1, y1, x2, y2, biome)
// 	ASSERT(x1 <= x2)
// 	ASSERT(y1 <= y2)
// 	for(var/x in x1 to x2)
// 		for(var/y in y1 to y2)
// 			var/index = x + (y - 1) * width
// 			var/datum/mapgen_descriptor/terrain/terrain = generate_terrain[index]
// 			if(!terrain)
// 				terrain = new
// 				terrain.biome = biome
// 				generate_terrain[index] = terrain
// 			else if(terrain.sealed)
// 			else
// 				terrain.biome = biome

// /**
//  * Undefined behavior if called after terrain phase.
//  */
// /datum/mapgen_buffer/proc/fill_terrain(x1, y1, x2, y2, turf_type, biome)
// 	ASSERT(x1 <= x2)
// 	ASSERT(y1 <= y2)
// 	for(var/x in x1 to x2)
// 		for(var/y in y1 to y2)
// 			var/index = x + (y - 1) * width
// 			var/datum/mapgen_descriptor/terrain/terrain = generate_terrain[index]
// 			if(!terrain)
// 				terrain = new
// 				terrain.turf_type = turf_type
// 				terrain.biome = biome
// 				generate_terrain[index] = terrain
// 			else if(terrain.sealed)
// 			else
// 				terrain.turf_type = turf_type
// 				terrain.biome = biome

#warn impl

//* Application *//

/**
 * This will annihilate anything already there, due to the lack of a sane system
 * to filter what to destroy.
 *
 * @params
 * * lower_left - 1, 1 of the buffer.
 *                remember that the buffer's base x / y are the 0, 0 of the buffer.
 * * context - (optional) mapgen context passed through for the purposes of subsystemizing / tick checking. currently does nothing.
 *             if context is not provided, we will use default CHECK_TICK, which may result in
 *             mapgen taking more CPU than we usually want.
 * * allow_crop - allow cropping; otherwise we runtime if we collide with world boundary.
 *
 * TODO: filter system
 * TODO: areas
 * TODO: structures
 */
/datum/mapgen_buffer/proc/apply(turf/lower_left, datum/mapgen_context/context, allow_crop)
	if(!allow_crop)
		var/upper_right_x = lower_left.x + width - 1
		var/upper_right_y = lower_left.y + height - 1
		if(upper_right_x > world.maxx)
			CRASH("upper right x out of bounds ([upper_right_x] > [world.maxx])")
		if(upper_right_y > world.maxx)
			CRASH("upper right y out of bounds ([upper_right_y] > [world.maxy])")

	apply_terrain_and_annihilate_bounds(lower_left, context)
	apply_spots(lower_left, context)

/datum/mapgen_buffer/proc/apply_terrain_and_annihilate_bounds(lower_left, datum/mapgen_context/context)
	PRIVATE_PROC(TRUE)

	var/ll_x = lower_left.x
	var/ll_y = lower_left.y
	var/ur_x = ll_x + width - 1
	var/ur_y = ll_y + height - 1

	var/start_x = 1
	var/start_y = 1
	var/end_x = width
	var/end_y = height

	var/offset_x = ll_x - 1
	var/offset_y = ll_y - 1

	var/z = lower_left.z
	var/datum/map_level/level = SSmapping.ordered_levels[z]

	if(ur_x > world.maxx)
		var/overflow_x = ur_x - world.maxx
		ur_x -= overflow_x
		end_x -= overflow_x
	if(ur_y > world.maxy)
		var/overflow_y = ur_y - world.maxy
		ur_y -= overflow_y
		end_y -= overflow_y

	for(var/buf_x in start_x to end_x)
		for(var/buf_y in start_y to end_y)
			// translate to real coordinates
			var/real_x = buf_x + offset_x
			var/real_y = buf_y + offset_y
			// load location
			var/turf/painting = locate(real_x, real_y, z)
			var/datum/mapgen_descriptor/terrain/terrain = generate_terrain[buf_x + (buf_y - 1) * width]
			// annihilate anything in it
			painting.empty(terrain.turf_type || level.base_turf, /turf/baseturf_bottom)
			// yield if needed
			CHECK_TICK

/datum/mapgen_buffer/proc/apply_spots(turf/lower_left, datum/mapgen_context/context)
	var/remapped_base_x = lower_left.x - 1
	var/remapped_base_y = lower_left.y - 1
	var/z = lower_left.z
	for(var/datum/mapgen_descriptor/spot/spot as anything in generate_spot)
		// apply descriptor
		spot.apply(remapped_base_x, remapped_base_y, z)
		// yield if needed
		CHECK_TICK
