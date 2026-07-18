//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2026 Citadel Station Developers           *//

/datum/jigsaw_generator_config
	/**
	 * Tile budget.
	 * * Overrules [tile_budget_ratio] if set.
	 */
	var/tile_budget
	/**
	 * Tile budget as a ratio of available tiles.
	 */
	var/tile_budget_ratio
	/**
	 * Custom budgets, key-value list of string-number.
	 * * This list may not be edited by the generator.
	 */
	var/list/custom_budgets = list()

	/**
	 * Set to override auto-marker settings. Otherwise, this uses
	 * the map's auto-marker config.
	 */
	var/datum/turf_auto_marker_config/auto_marker_config

	/**
	 * Template config
	 */
	var/datum/jigsaw_template_config/template_config

	/**
	 * Spawn configs to use.
	 * * If more than one is specified, one is chosen at random.
	 * * This list may not be edited by the generator.
	 */
	var/list/datum/jigsaw_spawn_config/spawn_configs = list()

/datum/jigsaw_generator_config/clone()
	var/datum/jigsaw_generator_config/clone = new

	clone.tile_budget = src.tile_budget
	clone.tile_budget_ratio = src.tile_budget_ratio
	clone.custom_budgets = src.custom_budgets.Copy()
	clone.auto_marker_config = src.auto_marker_config.clone()
	clone.template_config = src.template_config.clone()
	clone.spawn_configs = deep_clone_list(src.spawn_configs)

	return clone
