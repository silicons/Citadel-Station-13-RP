//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station developers.          *//

/**
 * a task for a dynamic ai.
 *
 * this contains things like prioritization information
 * as well as what's needed to actually perform it, like
 * synchronous / lockstepped movement.
 *
 * * dynamic tasks should always use **weak references** or at the very least
 *   use component signals to listen for deletion if referencing something else.
 *   tasks are time-independent and the AI holder system can potentially store
 *   tasks for a long time, as unlikely as it is.
 */
/datum/ai_dynamic_task

/**
 * are we still valid?
 */
/datum/ai_dynamic_task/proc/is_valid()
	return TRUE

#warn impl
