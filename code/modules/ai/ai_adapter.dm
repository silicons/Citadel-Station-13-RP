//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers          *//

/**
 * A thing that lets an AI, well, do things.
 *
 * Adapters are always called with:
 * * the ai holder
 * * the movable agent
 *
 * # Evaluate / Act
 * 'evaluate' and 'act' procs are explicitly to ask 'can I' and to say 'perform the action'.
 * They should not take into account things like ammo conversation behaviors, as that's
 * a question of 'should I' and not 'can I'.
 *
 * 'evaluate' should return a score from 0 to 1 of estimated probability of success.
 * 'act' should return TRUE if something was done, FALSE otherwise.
 */
/datum/ai_adapter
	/// bound datum, if any.
	var/datum/delegate
	/// expected datum type
	var/delegate_type = /datum

	/// broadphase flags; this is done to make narrowing down
	/// a large list of ai adapters very fast.
	/// * uses `AI_ADAPTER_BROADPHASE_*` flags.
	var/broadphase_flags = NONE

	/// offensive flags
	var/offensive_flags = NONE
	/// locomotion flags
	var/locomotion_flags = NONE

/datum/ai_adapter/New(datum/delegate)
	ASSERT(istype(delegate, delegate_type))
	src.delegate = delegate

/datum/ai_adapter/Destroy()
	delegate = null
	return ..()

/datum/ai_adapter/proc/is_valid(datum/ai_holder/holder)
	. = FALSE

#warn true/false return for act is not potentially the right move; if it requires a delay to do something / multi-telegraphed-steps, etc

//* offensive *//

/datum/ai_adapter/proc/offensive_evaluate(datum/ai_holder/holder, atom/movable/agent, list/atom/targets, offensive_flags)
	return 0

/datum/ai_adapter/proc/offensive_act(datum/ai_holder/holder, atom/movable/agent, list/atom/targets, offensive_flags)
	return AI_ADAPTER_RETURN_INVALID

//* locomotion *//

/datum/ai_adapter/proc/locomotion_evaluate(datum/ai_holder/holder, atom/movable/agent, turf/move_to, locomotion_flags)
	return 0

/datum/ai_adapter/proc/locomotion_act(datum/ai_holder/holder, atom/movable/agent, turf/move_to, locomotion_flags)
	return AI_ADAPTER_RETURN_INVALID

//* recovery *//

#warn impl
