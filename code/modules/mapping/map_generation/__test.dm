//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

// todo: remove when mapgen is in production (not just adminspawn, but done per round)
//       as this gives the necessary code coverage to remove this.

GLOBAL_VAR(__mapgen_test_level)

/proc/__test_mapgen(datum/mapgen_pattern/pattern = new /datum/mapgen_pattern/test_pattern)
	if(!GLOB.__mapgen_test_level)
		var/datum/map_level/level = SSmapping.allocate_level()
		GLOB.__mapgen_test_level = level.z_index
	var/datum/mapgen_buffer/buffer = pattern

	#warn impl
