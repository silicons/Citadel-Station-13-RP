//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station developers.          *//

/datum/ai_holder/dynamic/proc/emnity_loop(dt)

/datum/ai_holder/dynamic/proc/emnity_get_top()
	. = length(emnity_list)
	return . ? emnity_list[.] : null

/datum/ai_holder/dynamic/proc/emnity_set(atom/target, amount)

/datum/ai_holder/dynamic/proc/emnity_add(atom/target, amount)

/datum/ai_holder/dynamic/proc/on_emnity_swap(atom/old_top_emnity, atom/new_top_emnity)

#warn impl all
