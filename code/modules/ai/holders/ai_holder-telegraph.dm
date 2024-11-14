//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

/datum/ai_holder
	/// current telegraph priority
	var/telegraph_priority
	/// current telegraph flags
	var/telegraph_flags
	/// current telegraph notch
	var/telegraph_notch
	/// next telegraph notch
	var/static/telegraph_notch_next = 0

/**
 * Asynchronous telegraphed action
 *
 * * You don't actually need to have the on_finish callback do everything.
 *   As an example, do_after() can require someone to stand still; if you set
 *   a telegraph for the AI to stand still for that amount of time, it will
 *   work out without us having to do anything ourselves.
 *
 * @params
 * * time - amount of time to telegraph
 * * priority - AI_TELEGRAPH_PRIORITY_* define, or just a number. higher beats lower.
 * * flags - AI_TELEGRAPH_FLAG_* flags, for things we shouldn't do while telegraphing
 * * on_success - callback that will be called asynchronously with () if and only if we are successful
 * * on_finish - callback that will be called asynchronously with additional arg of (status) on finish
 */
/datum/ai_holder/proc/telegraph(time, priority, flags, datum/callback/on_success, datum/callback/on_finish)
	set waitfor = FALSE
	var/result = telegraph_sync(time, priority)
	if(result == AI_TELEGRAPH_STATUS_SUCCESS)
		on_success?.InvokeAsync()
	on_finish?.InvokeAsync(result)

/**
 * Synchronous telegraphed action
 *
 * * This will block anywhere from 'not at all' to 'the full duration of time'.
 *   Do not rely on this proc for cancellation timing; this proc's only job is to immediately
 *   break when we finish, and break **when we feel like it** if interrupted.
 *
 * todo: can we use the AI scheduling subsystem for this? telegraphs are nice
 *       but we don't want it to be a sleeping proc as we want
 *       its CPU usage to be managed by the MC.
 *
 * @params
 * * time - amount of time to telegraph
 * * priority - AI_TELEGRAPH_PRIORITY_* define, or just a number. higher beats lower.
 * * flags - AI_TELEGRAPH_FLAG_* flags, for things we shouldn't do while telegraphing
 *
 * @return AI_TELEGRAPH_STATUS_*
 */
/datum/ai_holder/proc/telegraph_sync(time, priority, flags)
	// todo: do we need a telegraph-stacking/extension system for similar telegraphs that can be
	//       done one by one? probably not, right?
	if(!interrupt_telegraph(priority))
		return AI_TELEGRAPH_STATUS_YIELDED
	var/end_time = world.time + time

	telegraph_notch = ++telegraph_notch_next
	if(telegraph_notch_next >= SHORT_REAL_LIMIT)
		telegraph_notch_next = -SHORT_REAL_LIMIT + 1
	telegraph_flags = flags
	telegraph_priority = priority

	var/our_notch = telegraph_notch
	while(world.time < end_time)
		sleep(min(end_time - world.time, 1 SECONDS))
		if(our_notch != telegraph_notch)
			return AI_TELEGRAPH_STATUS_INTERRUPTED

	telegraph_notch = telegraph_flags = telegraph_priority = null
	return AI_TELEGRAPH_STATUS_SUCCESS

/**
 * Interrupts ongoing telegraphs at given or lower priority
 *
 * @params
 * * priority - AI_TELEGRAPH_PRIORITY_* define, or just a number. higher beats lower.
 */
/datum/ai_holder/proc/interrupt_telegraph(priority)
	if(isnull(telegraph_priority))
		return TRUE
	if(telegraph_priority <= priority)
		telegraph_priority = telegraph_flags = telegraph_notch = null
		return TRUE
	return FALSE
