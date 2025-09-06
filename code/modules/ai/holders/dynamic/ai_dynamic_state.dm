//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers          *//

/datum/ai_dynamic_state
	/// blackboard
	/// * for the love of god do not put hard references in here, use weakrefs
	var/list/blackboard = list()

	/// frustration
	/// * automatic tuning variable; goes up as we are unable to get to
	///   a target.
	/// * allows us to have a higher chance of giving up or repositioning
	var/frustration = 0

	/// anger
	/// * automatic tuning variable; goes up as we take damage from targets
	/// * will cause AI to consider more ballsy moves and stop caring
	///   about overkill on offensive adapters,
	///   and more likely to use resources.
	var/anger = 0

	/// can ever move?
	var/movement_supported = FALSE
	/// can currently move?
	var/movement_evaluation = FALSE

#warn impl
