//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station developers.          *//

/datum/ai_holder/dynamic/proc/assign_task(datum/ai_dynamic_task/task)
	task.assign_to_holder(src)

/datum/ai_holder/dyanmic/proc/evict_active_task()
	#warn impl
