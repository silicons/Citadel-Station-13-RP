//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

/**
 * Handles a tesla zap impact.
 *
 * @params
 * * zap_struct - the head of the bolt. We own this reference unless it's passed back via 'return'.
 *
 * @return /datum/event_args/tesla_zap to give back. null to terminate.
 */
/atom/movable/proc/tesla_act_new(datum/event_args/tesla_zap/zap_struct)
	// var/list/shock_results =
	#warn how do we handle this? who's doing the scaling?
	return zap_struct
