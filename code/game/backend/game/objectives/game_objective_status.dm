
//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 silicons                             *//

/**
 * completion status struct for objectives
 */
/datum/game_objective_status
	/// completion status enum
	var/completion_status = GAME_OBJECTIVE_COMPLETION_UNKNOWN
	/// ratio of completion, 0 to infinity inclusive; >= 1 means completed.
	var/ratio = 1
	/// qualitative description of completion: string or null
	var/explain = null

/**
 * GameObjectiveStatus{} ->
 *
 * status: GameObjectiveCompletionStatus;
 * ratio: number;
 * explain: string | null;
 */
/datum/game_objective_status/proc/tgui_objective_status()
	return list(
		"completion" = completion_status,
		"ratio" = ratio,
		"explain" = explain,
	)
