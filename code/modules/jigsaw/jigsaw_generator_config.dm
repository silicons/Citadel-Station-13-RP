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
	 */
	var/list/datum/jigsaw_spawn_config/spawn_configs = list()
