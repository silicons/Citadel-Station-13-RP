//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers          *//

/datum/ai_holder/dynamic/proc/cover_invalidate()
	cover_candidates = null

/datum/ai_holder/dynamic/proc/cover_request_all() as /lsit
	if(cover_should_recalculate())
		cover_recalculate()
	return cover_candidates

/datum/ai_holder/dynamic/proc/cover_request() as /turf
	if(cover_should_recalculate())
		cover_recalculate()
	for(var/turf/maybe in cover_candidates)

/datum/ai_holder/dynamic/proc/cover_should_recalculate()
	if(!length(cover_candidates))
		return TRUE
	return (world.time - cover_last_compute) > 5 SECONDS

/datum/ai_holder/dynamic/proc/cover_recalculate()
	if(isnull(cover_inbound_angle))
		cover_candidates = list()
		return



	var/list/turf/scanning = list()
	for(var/turf/turf in view(6))
		scanning += turf


#warn impl

/**
 * angle, clockwise of north, of what we should be avoiding.
 */
/datum/ai_holder/dynamic/proc/cover_set_inbound_angle(angle)
	cover_inbound_angle = angle
