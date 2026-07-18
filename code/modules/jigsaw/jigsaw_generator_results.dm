//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2026 Citadel Station Developers           *//

/datum/jigsaw_generator_results
	/**
	 * Considered failed.
	 * * To ensure nothing was placed, you should still check the other variables.
	 *   Failing to place required templates (Even if some were already placed) is considered a failure.
	 */
	var/failed = FALSE

	var/list/datum/prototype/jigsaw_template/placed_counts = list()

	var/approximate_ms_used = 0
	var/tile_budget_used = 0
	var/list/custom_budgets_used = list()

/datum/jigsaw_generator_results/serialize()
	. = ..()
	.["failed"] = failed

	var/list/placed_counts_serialized = list()
	for(var/datum/prototype/jigsaw_template/template in placed_counts)
		placed_counts_serialized[template.id] = placed_counts[template]
	.["placed_counts"] = placed_counts_serialized

	.["approximate_ms_used"] = approximate_ms_used
	.["tile_budget_used"] = tile_budget_used
	.["custom_budgets_used"] = custom_budgets_used.Copy()
