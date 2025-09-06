//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers          *//

/datum/ai_holder/dynamic/proc/emnity_loop(dt)
	var/elapsed = max(0, world.time - emnity_last_tick) * 0.1
	for(var/atom/target as anything in emnity_list)
		#warn falloff?

/datum/ai_holder/dynamic/proc/emnity_get_top()
	. = length(emnity_list)
	return . ? emnity_list[.] : null

/datum/ai_holder/dynamic/proc/emnity_set(atom/target, amount)
	amount = max(amount, 0)

	var/old_emnity = emnity_list?[target] || 0
	if(old_emnity == amount)
		return

	if(!emnity_list)
		emnity_list = list()

	var/old_top = emnity_list[length(emnity_list)]
	BINARY_INSERT_ASSOC_NUMBER(emnity_list, target, amount)

	if(amount == 0)
		emnity_list -= target
	var/new_top = emnity_list[length(emnity_list)]

	on_emnity_change(target, old_emnity, amount)
	if(old_top != new_top)
		on_emnity_swap(old_top, new_top)

	if(!length(emnity_list))
		emnity_list = null

/datum/ai_holder/dynamic/proc/emnity_drop(atom/target)
	emnity_set(target, 0)

/datum/ai_holder/dynamic/proc/emnity_adjust(atom/target, amount)
	emnity_set(target, emnity_list?[target] + amount)

/datum/ai_holder/dynamic/proc/on_emnity_swap(atom/old_top_emnity, atom/new_top_emnity)
	return

/datum/ai_holder/dynamic/proc/on_emnity_change(atom/entity, old_emnity, new_emnity)
	return
