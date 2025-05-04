//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

/datum/adjacency_group_holder
	var/atom/movable/parent
	var/group_key
	var/datum/adjacency_group/group
	/// if exists, is called with (src, group, adjacent_dirs, adjacent_overlap)
	var/datum/callback/on_group_join
	/// if exists, is called with (src, group)
	var/datum/callback/on_group_leave

/datum/adjacency_group_holder/New(atom/movable/parent, group_key)
	ASSERT(ismovable(parent))
	src.parent = parent
	src.group_key = group_key

/datum/adjacency_group_holder/proc/on_parent_move(atom/old_loc)
	if(old_loc == parent.loc)
		return
	#warn update

/datum/adjacency_group_holder/proc/leave_group()

/datum/adjacency_group_holder/proc/form_group()


/datum/adjacency_group
	var/group_key
	var/list/datum/adjacency_group_holder/holders
	/// custom data you can put in; you are in charge of knowing what type this should be and casting as such,
	/// as byond has no generics.
	var/data

/datum/adjacency_group/New(group_key)
	src.group_key = group_key

/datum/adjacency_group/Destroy()
	#warn impl
	return ..()

/atom/movable/proc/movable_adjacency_group_join(datum/adjacency_group_holder/holder, datum/adjacency_group/group, adjacent_dirs, adjacent_overlap)
	return

/atom/movable/proc/movable_adjacency_group_leave(datum/adjacency_group_holder/holder, datum/adjacency_group/group)
	return

/atom/movable/proc/movable_adjacency_group_merge(datum/adjacency_group_holder/holder, datum/adjacency_group/staying_intact, datum/adjacency_group/group/merging_in)
	return
