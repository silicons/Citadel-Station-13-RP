//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

/**
 * Generic "we did a loud thing" invocation to notify listeners.
 * * Called `trigger_aiming` but can be used to break cloak too in the future.
 */
/atom/movable/proc/trigger_aiming(trigger_flags)
	SEND_SIGNAL(src, COMSIG_MOVABLE_TRIGGER_AIMING, trigger_flags)
