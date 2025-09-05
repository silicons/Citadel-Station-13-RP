//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station developers.          *//

/mob/living/ai_basic_move_supported()
	return TRUE

/mob/living/ai_basic_move(dir)
	#warn evaluate selfmove; it should handle delays.
	. = SelfMove(null, dir)

	return max(world.tick_lag, next_move - world.time)
