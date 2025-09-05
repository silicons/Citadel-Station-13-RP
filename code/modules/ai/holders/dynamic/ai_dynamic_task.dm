//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers          *//

/**
 * a task for a dynamic ai.
 *
 * this contains things like prioritization information
 * as well as what's needed to actually perform it, like
 * synchronous / lockstepped movement.
 *
 * * dynamic tasks are created per-holder, never shared.
 * * dynamic tasks should always use **weak references** or at the very least
 *   use component signals to listen for deletion if referencing something else.
 *   tasks are time-independent and the AI holder system can potentially store
 *   tasks for a long time, as unlikely as it is.
 */
/datum/ai_dynamic_task
	/// the holder we belong to
	var/datum/ai_holder/dynamic/holder

	/// preemption level
	/// * we can pre-empt things at or below our level
	var/preempt_level = AI_DYNAMIC_PREEMPT_IDLE

	/// override steering controller entirely
	/// * you usually don't want to do this
	var/override_steering = FALSE

	/// lock steering.
	/// * prevents assigning steering targets without 'force' parameter, which
	///   should only be used by ourselves
	var/lock_steering = FALSE
	/// lock normal actions.
	/// * this prevents the ai from doing things like swapping hands
	///   and using items that may interrupt a do_after.
	/// * this doesn't include locking movement. use [override_steering] for that.
	var/lock_normal_actions = FALSE
	/// lock special actions.
	/// * this prevents the ai from doing things specially marked as non-interfering,
	///   like firing a laser eye ability or anything else that doesn't interrupt
	///   most 'active hand' do_after's
	/// * resisting is considered part of this, even if it
	///   affects clickdelay.
	var/lock_special_actions = FALSE

/datum/ai_dynamic_task/proc/assign_to_holder(datum/ai_holder/dynamic/holder, preempt_level)
	if(src.holder)
		if(src.holder != holder)
			CRASH("attempted to reassign task")
		return
	src.holder = holder
	src.preempt_level = preempt_level
	#warn inject into a list?

/**
 * are we still valid?
 */
/datum/ai_dynamic_task/proc/is_valid()
	return TRUE

/datum/ai_dynamic_task/proc/on_finish()
	#warn impl / hook

/datum/ai_dynamic_task/proc/on_evicted()
	#warn impl / hook

/**
 * Run on holder tick.
 */
/datum/ai_dynamic_task/proc/on_tick(cycles)
	return

#warn impl

/**
 * * if override_steering is enabled, this will be called in place of the normal steering cycle.
 * @return ds before movement re-schedule.
 */
/datum/ai_dynamic_task/proc/on_move_override(cycles)
	// randomly wait 100-300ms if we're not actually doing anything.
	return rand(1, 3)
