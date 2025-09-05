//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station developers.          *//

/datum/ai_holder/dynamic/proc/adapter_full_update()

/datum/ai_holder/dynamic/proc/adapter_combat_update()

/datum/ai_holder/dynamic/proc/adapter_steering_update()

/**
 * Called more frequently, automatically, than full update.
 * * Checks if all adapters in us are still valid and alive. Drops
 *   references to ones that are not.
 */
/datum/ai_holder/dynamic/proc/adapter_gc_cycle()

/datum/ai_holder/dynamic/proc/adapter_get_all_from_agent()

/datum/ai_holder/dynamic/proc/adapter_queue_update()

/datum/ai_holder/dynamic/proc/adapter_removed(datum/ai_adapter/adapter)

/datum/ai_holder/dynamic/proc/adapter_added(datum/ai_adapter/adapter)

#warn impl
