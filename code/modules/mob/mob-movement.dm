//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

/**
 * Called to initiate a move.
 *
 * * this proc will never modify inbound actor data. if you provide any, make absolute sure it's cached;
 *   do NOT make a datum for every move!
 * * return value is **null** on fail, not 0. if return value is 0, it means we can move again immediately.
 *
 * todo: rename to self_move()
 *
 * @params
 * * dir - direction moving in
 * * actor - (optional) actor data.
 *
 * @return predicted time to next move if successful, **null** if failure.
 */
/mob/proc/self_move_new(dir, datum/event_args/actor/actor)
	SHOULD_NOT_SLEEP(TRUE)
	SHOULD_NOT_OVERRIDE(TRUE)

	in_selfmove = TRUE

	. = do_self_move(dir, actor)
	if(. != null)
		// for now, all moves terminate throws.
		throwing?.terminate()

	in_selfmove = FALSE

/**
 * Override this proc as needed on subtypes.
 *
 * @return predicted time to next move if successful, **null** if failure.
 */
/mob/proc/do_self_move(dir, datum/event_args/actor/actor)
	SHOULD_NOT_SLEEP(TRUE)
	PROTECTED_PROC(TRUE)
	#warn impl on subtypes
