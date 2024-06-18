//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 silicons                             *//

/**
 * makes something glow under thermals
 */
/datum/component/thermal_image
	/// do we spread outwards?
	var/spreads_outwards = FALSE

/**
 * makes something spread its thermal glow to containers holding it as well
 */
/datum/component/thermal_image/recursing
	spreads_outwards = TRUE

#warn impl

