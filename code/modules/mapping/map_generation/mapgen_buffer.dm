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

	/// turf lookup

	//* Realization *//

	/// arbitrary blackboard preserved through the whole load process
	var/list/realize_blackboard = list()
	/// stat tracking: total turf changes
	var/realize_turf_spawn_count = 0
	/// stat tracking: total structure instantiations
	var/realize_structure_spawn_count = 0
	/// stat tracking: total spot instantiations
	var/realize_spot_spawn_count = 0
	/// start REALTIMEOFDAY
	var/realize_start_realtimeofday
	/// end REALTIMEOFDAY
	var/realize_end_realtimeofday

/datum/mapgen_buffer/proc/realize(turf/lower_left, turf/upper_right)

#warn impl
