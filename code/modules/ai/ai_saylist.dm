//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

GLOBAL_LIST_INIT(ai_saylists, init_ai_saylists())

/proc/init_ai_saylists()
	. = list()
	for(var/datum/ai_saylist/saylist_path as anything in subtypesof(/datum/ai_saylist))
		if(saylist_path.abstract_type == saylist_path)
			continue
		var/datum/ai_saylist/saylist = new saylist_path
		if(.[saylist.id])
			stack_trace("collision between [.[saylist.id]:type] and [saylist.type]")
		.[saylist.id] = saylist

/**
 * Rearchitected saylist-like system, inspired by polaris.
 *
 * Instead of storing direct phrases, this is an API for shared-reference
 * saylists that you can pull strings out of when needing to do something.
 *
 * * Most arguments to procs are optional.
 * * 'emote', 'speech', and 'sound' are often pulled together.
 *   If you're doing something special, make sure emote / speech aren't
 *   duplicating / colliding.
 */
/datum/ai_saylist
	/// id. this must be unique and is how we're looked up.
	var/id

#warn impl all

/**
 * Pulled when, literally, doing nothing.
 */
/datum/ai_saylist/proc/pull_idle(atom/movable/agent, datum/ai_holder/holder) as /datum/ai_saylist_response
	return

/**
 * Pulled when interested in something/someone, like when the AI is examined
 * repeatedly or poked.
 */
/datum/ai_saylist/proc/pull_interested(atom/movable/agent, datum/ai_holder/holder, atom/target) as /datum/ai_saylist_response
	return

/**
 * Pulled when annoyed by someone, like the the holder is pat on the head or something
 * unnecessarily by people who think you're supposed to greet strangers
 * with headpats.
 */
/datum/ai_saylist/proc/pull_annoyed(atom/movable/agent, datum/ai_holder/holder, atom/target) as /datum/ai_saylist_response
	return

/**
 * When threatening someone.
 */
/datum/ai_saylist/proc/pull_threaten(atom/movable/agent, datum/ai_holder/holder, atom/target) as /datum/ai_saylist_response
	return

/**
 * When disengaging from someone
 */
/datum/ai_saylist/proc/pull_backoff(atom/movable/agent, datum/ai_holder/holder, atom/target) as /datum/ai_saylist_response
	return

/**
 * when investigating a potential target
 */
/datum/ai_saylist/proc/pull_investigating(atom/movable/agent, datum/ai_holder/holder, atom/target, turf/target_tile)
	return

/**
 * when engaging a target
 */
/datum/ai_saylist/proc/pull_engaging(atom/movable/agent, datum/ai_holder/holder, atom/target)
	return

/**
 * accept order
 */
/datum/ai_saylist/proc/pull_accept_order(atom/movable/agent, datum/ai_holder/holder, atom/target)
	return

/**
 * deny order
 */
/datum/ai_saylist/proc/pull_reject_order(atom/movable/agent, datum/ai_holder/holder, atom/target)
	return
