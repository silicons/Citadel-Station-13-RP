//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

/**
 * A network of bound AIs.
 *
 * * Initial members will, by default, determine many things like overall IFF.
 */
/datum/ai_network
	/// a list of AI holders in us
	var/list/datum/ai_holder/members = list()
	/// our combined IFF datum
	var/datum/ai_iff/iff_holder

/datum/ai_network/New(list/datum/ai_holder/initial_members)
	for(var/datum/ai_holder/holder as anything in initial_members)
		holder.join_network(src, TRUE, TRUE)
	full_update_network()

/datum/ai_network/Destroy()
	for(var/datum/ai_holder/holder as anything in members)
		holder.leave_network()
	ASSERT(!length(members))
	return ..()

/datum/ai_network/proc/on_join(datum/ai_holder/holder, initial_member, defer_updates)
	if(initial_member)
		if(holder.iff_holder)
			if(!iff_holder)
				iff_holder = new
			iff_holder.unsafe_merge_from(holder.iff_holder)
			if(!defer_updates)
				iff_holder.coalesce_optimistic()

/datum/ai_network/proc/on_leave(datum/ai_holder/holder)
	return

/datum/ai_network/proc/full_update_network()
	iff_holder?.coalesce_optimistic()
