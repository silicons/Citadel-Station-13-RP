//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station developers.          *//

/**
 * context returned by ai holder dynamic combat routines
 * evaluating themselves for what they can / cannot do
 *
 * this is then kept on the ai holder.
 */
/datum/ai_dynamic_combat_context
	/// generic k-v blackboard list.
	var/list/blackboard = list()

	/// is the routine valid / logical?
	var/can_reasonably_run = FALSE
	/// useful combat adapters
	var/list/datum/ai_adapter/relevant_adapters = list()


#warn impl
