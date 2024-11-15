//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

/**
 * An optional AI adapter return.
 */
/datum/ai_adapter_return
	/// action status
	var/status = AI_ADAPTER_STATUS_SUCCESS
	/// fail reason, if STATUS_FAIL, as enum.
	var/fail_reason = AI_ADAPTER_FAIL_UNKNOWN

	/// cooldown: if STATUS_COOLDOWN, we need this much more timeblocker
	///
	/// * optional
	var/status_cooldown_wait_for

	/// blocked: if STATUS_BLOCKED, this is the first blocker
	///
	/// * optional
	var/atom/status_blocked_first_obstacle

	/// too far: if STATUS_BAD_RANGE, this is how much closer (or further) we have to be
	///
	/// * optional
	/// * negative = go closer by that much
	/// * positive = go further by that much
	var/status_bad_range_offset_by
