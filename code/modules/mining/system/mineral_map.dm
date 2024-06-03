//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 silicons                             *//

/**
 * active mineral map loaded into a level for the purposes of being available to scanners.
 */
/datum/mineral_map
	/// round-local unique ID used so turfs know when they should be empty
	var/round_local_id
	/// next round local local id
	var/static/round_local_id_next = 0


#warn impl
