//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

/**
 * A map generation pattern.
 *
 * Map generation is done by:
 *
 * * painting an ordered list of layers into a pattern, producing a buffer
 * * 'applying' a buffer, which actually loads it into the 'real world'.
 *
 * Map generation is done with a seed, base x / y for where in the abstract 2d plane
 * of that seed the level is in, and finally, a width and a height.
 *
 * There's three separate sets of buffers in a mapgen buffer:
 *
 * * terrain; a dense 2d grid of generated terrain tuples
 * * structure; a list of structures to load in
 * * spot; a list of spots to .. well, do things to.
 *
 * Terrain, structure, and spot are applied in that order, but can be staged
 * by layers in any order.
 *
 * ## Biomes
 *
 * Biomes are intentionally not defined, as this lets you define them in your code.
 * That said, these biomes are internally used, and are constant:
 *
 * * 'unknown': for unset
 * * 'ignore': used on anything that is mapgen blocked.
 */
/datum/mapgen_pattern
	/// layers
	var/list/datum/mapgen_layer/layers = list()

/**
 * prepare all layers
 *
 * @return TRUE / FALSE on success / failure.
 */
/datum/mapgen_pattern/proc/ready()
	for(var/i in 1 to length(layers))
		var/datum/mapgen_layer/layer = layers[i]
		if(ispath(layer))
			layer = new layer
			layers[i] = layer
		else if(IS_ANONYMOUS_TYPEPATH(layer))
			layer = new layer
			layers[i] = layer
		if(!layer.ready())
			return FALSE
	return TRUE

/**
 * generate a buffer
 *
 * @params
 * * seed - the seed to use
 * * base_x - the offset of the 0, 0 of the buffer, where 1, 1 is the first lower-left turf.
 * * base_y - the offset of the 0, 0 of the buffer, where 1, 1 is the first lower-left turf.
 * * width - buffer size
 * * height - buffer size
 * * context - (optional) context passed through for the purposes of subsystemizing / tick checking. currently does nothing.
 *             if context is not provided, we will use default CHECK_TICK, which may result in
 *             mapgen taking more CPU than we usually want.
 */
/datum/mapgen_pattern/proc/generate(seed = "default", base_x = 0, base_y = 0, width = world.maxx, height = world.maxy, datum/mapgen_context/context) as /datum/mapgen_buffer
	if(!ready())
		CRASH("failed to ready a mapgen pattern.")

	var/datum/mapgen_buffer/buffer = new(seed, base_x, base_y, width, height)
	var/datum/mapgen_context/context = new

	var/start_tick_usage
	var/end_tick_usage

	for(var/datum/mapgen_layer/layer as anything in layers)
		start_tick_usage = world.tick_usage
		layer.draw(buffer, context)
		end_tick_usage = world.tick_usage
		buffer.generate_deciseconds_spent_on_layer[layer] = TICK_DELTA_TO_MS(end_tick_usage - start_tick_usage)

	return buffer

// vv wrapper
// very dangerous, will trample everything underneath. use with extreme caution.
// can be called with (ll_x, ll_y, ur_x, ur_y, z, seed)
// can be called with (turf/lower_left, width, height, seed)
/datum/mapgen_pattern/proc/__debug_generate_chunk(ll_x, ll_y, ur_x, ur_y, z, seed)
	if(isturf(ll_x))
		// remap parameters, end to start
		seed = ur_y
		z = ll_x:z
		ur_y = ll_x:y + ur_x - 1
		ur_x = ll_x:x + ll_y - 1
		ll_y = ll_x:y
		ll_x = ll_x:x

	#warn impl

// vv wrapper
// very dangerous, will trample everything underneath. use with extreme caution.
/datum/mapgen_pattern/proc/__debug_generate_level(z, seed)
	if(isturf(z))
		z = z:z
	__debug_generate_chunk(1, 1, world.maxx, world.maxy, z, seed)
