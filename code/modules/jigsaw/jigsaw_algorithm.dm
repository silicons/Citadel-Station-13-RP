//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2026 Citadel Station Developers           *//

/datum/jigsaw_algorithm

/datum/jigsaw_algorithm/proc/execute(datum/jigsaw_buffer/buffer, datum/jigsaw_generator_config/config) as /datum/jigsaw_generator_results
	return new /datum/jigsaw_generator_results

/datum/jigsaw_algorithm/proc/normalize_resultant_template_config(datum/jigsaw_template_resultant_config/config)
	for(var/key in config.required_templates)
		var/datum/prototype/jigsaw_template/template = key
		template.load_cached()

		if(config.required_templates[key] <= 0)
			config.required_templates -= key

	for(var/key in config.priority_templates)
		var/datum/prototype/jigsaw_template/template = key
		template.load_cached()

		if(config.priority_templates[key] <= 0)
			config.priority_templates -= key

	for(var/key in config.weighted_templates)
		var/datum/prototype/jigsaw_template/template = key
		template.load_cached()

/datum/jigsaw_algorithm/general

/datum/jigsaw_algorithm/general/execute(datum/jigsaw_buffer/buffer, datum/jigsaw_generator_config/config)
	var/datum/jigsaw_generator_results/results = new

	var/datum/map_context/map_context = new
	map_context.auto_marker_config = config.auto_marker_config

	var/datum/jigsaw_template_resultant_config/resultant_template_config = config.template_config.get_resultant_config()

	var/tile_budget_left = config.get_tile_budget(buffer.get_empty_tile_count())

	var/list/custom_budgets_left = config.custom_budgets.Copy()

	var/total_tick_usage = 0

	// give the server a bit of reprieve first if needed, this is generally called
	// right after other stuff is copied so we might already be over
	// tick budget if we're very unlucky
	CHECK_TICK

	var/iterations = 100

	/**
	 * list of open tiles to attempt attachment for.
	 * * content is list(x, y, dir).
	 * * dir is to the other tile, so the other tile needs to match reverse dir.
	 */
	var/list/open_tiles = list()
	var/datum/prototype/jigsaw_template/next_template
	var/any_passed = FALSE

	do
		iterations--

		var/pick_begin = TICK_USAGE
		var/list/picked = pick_next_template(buffer, resultant_template_config, tile_budget_left, custom_budgets_left)
		var/pick_end = TICK_USAGE
		total_tick_usage += pick_end - pick_begin

		var/datum/prototype/jigsaw_template/next_template = picked[1]
		var/next_required = picked[2]

		if(!next_template)
			break

		var/datum/jigsaw_generator_results/template_results = try_place_template(buffer, next_template, open_tiles, map_context)

		results.merge_from(template_results)

		if(template_results.failed)
			if(next_required)
				results.failed = TRUE
				break
		else
			any_passed = TRUE
			// update budgets
			tile_budget_left -= template_results.tile_budget_used
			for(var/key in template_results.custom_budgets_used)
				custom_budgets_left[key] -= template_results.custom_budgets_used[key]

	while(iterations > 0)

	// TODO: run spawn configs

	results.approximate_ms_used += TICK_USAGE_TO_MS(total_tick_usage)

	if(any_passed)
		buffer.enqueue_map_context(map_context)

	return results

/datum/jigsaw_algorithm/general/proc/try_place_template(datum/jigsaw_buffer/buffer, datum/prototype/jigsaw_template/template, list/open_tiles, datum/map_context/map_context) as /datum/jigsaw_generator_results
	var/datum/jigsaw_generator_results/results = new
	var/datum/dmm_context/dmm_context = map_context.create_blank_dmm_context()

	results.failed = TRUE

	var/tick_usage_used = 0

	var/iterations = 1000
	var/list/indices = list()

	do {
		var/shuffle_indices_begin = TICK_USAGE

		for(var/i in 1 to length(open_tiles))
			indices += i
		shuffle_inplace(indices)

		var/shuffle_indices_end = TICK_USAGE
		tick_usage_used += shuffle_indices_end - shuffle_indices_begin
	} while(FALSE)

	var/datum/jigsaw_pattern/computed_pattern = template.resultant_pattern

	while(length(indices))
		var/pick_n_take_begin = TICK_USAGE

		var/index = pick_n_take(indices)
		var/list/open_tile = open_tiles[index]
		var/x = open_tile[1]
		var/y = open_tile[2]
		var/dir = open_tile[3]

		var/datum/jigsaw_buffer_tile/tile = buffer.grid[x + buffer.width * (y - 1)]
		if(!tile)
			CRASH("invalid tile at [x] [y] [dir].")

		var/list/our_tags
		var/list/our_require
		var/list/our_exclude

		var/pick_n_take_end = TICK_USAGE
		tick_usage_used += pick_n_take_end - pick_n_take_begin
		CHECK_TICK

		// check bounds and get tag match
		switch(dir)
			if(NORTH)
				if(y == buffer.height)
					continue
				var/datum/jigsaw_buffer_tile/other_tile = buffer.grid[x + buffer.width * y]
				if(other_tile)
					// already filled
					continue
				our_tags = tile.north_tags
				our_require = tile.north_require
				our_exclude = tile.north_exclude

			if(SOUTH)
				if(y == 1)
					continue
				var/datum/jigsaw_buffer_tile/other_tile = buffer.grid[x + buffer.width * (y - 2)]
				if(other_tile)
					// already filled
					continue
				our_tags = tile.south_tags
				our_require = tile.south_require
				our_exclude = tile.south_exclude

			if(EAST)
				if(x == buffer.width)
					continue
				var/datum/jigsaw_buffer_tile/other_tile = buffer.grid[x + 1 + buffer.width * (y - 1)]
				if(other_tile)
					// already filled
					continue
				our_tags = tile.east_tags
				our_require = tile.east_require
				our_exclude = tile.east_exclude

			if(WEST)
				if(x == 1)
					continue
				var/datum/jigsaw_buffer_tile/other_tile = buffer.grid[x - 1 + buffer.width * (y - 1)]
				if(other_tile)
					// already filled
					continue
				our_tags = tile.west_tags
				our_require = tile.west_require
				our_exclude = tile.west_exclude

		// we got the tags, try to match against the template
		var/match_begin = TICK_USAGE

		var/matched = FALSE
		var/their_x_offset
		var/their_y_offset
		var/their_dir

		// cache for speed
		var/list/attachment_points = computed_pattern.calculated_attachment_points
		for(var/i in 1 to length(attachment_points))
			var/list/attachment_point = attachment_points[i]

			var/list/their_tags = attachment_point[4]
			var/list/their_require = attachment_point[5]
			var/list/their_exclude = attachment_point[6]

			// match tags
			// lack of require = anything goes
			var/tag_pass = (!length(our_tags & their_exclude)) && (!length(our_exclude & their_tags)) && \
				(length(our_require & their_tags) == length(our_require)) && (!length(their_require & our_tags) == length(their_require))

			if(!tag_pass)
				continue

			// attempt emplace after aligning
			their_x_offset = attachment_point[1]
			their_y_offset = attachment_point[2]
			their_dir = attachment_point[3]
			matched = TRUE
			break

		var/match_end = TICK_USAGE
		tick_usage_used += match_end - match_begin
		CHECK_TICK

		if(!matched)
			continue

		var/emplaced = FALSE
		var/emplace_begin = TICK_USAGE

		// now attempt emplace
		#warn compute x/y
		emplaced = buffer.emplace_template_at(template, computed_x, computed_y, their_dir, dmm_context)

		var/emplace_end = TICK_USAGE
		tick_usage_used += emplace_end - emplace_begin
		CHECK_TICK

		if(emplaced)
			results.success = TRUE
			break
		else
			// failed to emplace, try next attachment point
			continue

	results.approximate_ms_used += TICK_USAGE_TO_MS(tick_usage_used)

	if(results.failed)
		qdel(dmm_context)
	else
		map_context.register_dmm_context(dmm_context)

	return results

/**
 * @return list(template, required)
 */
/datum/jigsaw_algorithm/general/proc/pick_next_template(datum/jigsaw_buffer/buffer, datum/jigsaw_template_resultant_config/resultant, tile_budget_left, list/custom_budgets_left)
	// non-weighted templates only get one try each

	if(length(resultant.required_templates))
		var/datum/prototype/jigsaw_template/template = pick(resultant.required_templates)
		resultant.required_templates[template] -= 1
		if(resultant.required_templates[template] <= 0)
			resultant.required_templates -= template
		return list(template, TRUE)

	if(length(resultant.priority_templates))
		var/datum/prototype/jigsaw_template/template = pick(resultant.priority_templates)
		resultant.priority_templates[template] -= 1
		if(resultant.priority_templates[template] <= 0)
			resultant.priority_templates -= template
		return list(template, FALSE)

	var/list/datum/prototype/jigsaw_template/valid_weighted_templates = list()
	for(var/datum/prototype/jigsaw_template/template as anything in resultant.weighted_templates)
		if(template.resultant_pattern.cached_tile_cost > tile_budget_left)
			resultant.weighted_templates -= template
			continue

		if(template.custom_budgets)
			var/valid = TRUE
			for(var/key in template.custom_budgets)
				if(template.custom_budgets[key] > custom_budgets_left[key])
					valid = FALSE
					break

			if(!valid)
				resultant.weighted_templates -= template
				continue

		valid_weighted_templates[template] = resultant.weighted_templates[template]

	return list(
		pickweight(valid_weighted_templates),
		FALSE,
	)
