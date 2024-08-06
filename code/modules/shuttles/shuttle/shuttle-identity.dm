//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 silicons                             *//

//* Identity *//

/**
 * Get player-facing name
 */
/datum/shuttle/proc/get_display_name()
	return display_name || name
