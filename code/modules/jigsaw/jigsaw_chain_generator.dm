//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2026 Citadel Station Developers           *//

/**
 * Runs multiple generator cycles on a buffer.
 */
/datum/jigsaw_chain_generator
	var/datum/jigsaw_chain_generator_config/config

/datum/jigsaw_chain_generator/New(datum/jigsaw_chain_generator_config/config)
	src.config = config

/datum/jigsaw_chain_generator/proc/generate(datum/jigsaw_buffer/buffer)
	var/datum/jigsaw_chain_generator_results/results = new

	config.prepare()
	var/list/datum/jigsaw_generator_config/generator_configs = config.get_generator_configs()

	for(var/datum/jigsaw_generator_config/generator_config in generator_configs)
		var/datum/jigsaw_generator/generator = new(generator_config)
		var/datum/jigsaw_generator_results/generator_results = generator.generate(buffer)

		results.add(generator_results)
		results.total_approximate_ms_used += generator_results.approximate_ms_used
		results.total_tile_budget_used += generator_results.tile_budget_used
		for(var/key in generator_results.custom_budget_used)
			results.total_custom_budget_used[i] += generator_results.custom_budget_used[i]

	return results

	#warn impl
