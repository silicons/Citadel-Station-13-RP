//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers          *//

/**
 * stores stateful information about the current steering context.
 */
/datum/ai_dynamic_steering_context
	/// generic k-v blackboard list.
	var/list/blackboard = list()
	/// relevant adapters
	var/list/datum/ai_adapter/relevant_adapters = list()
