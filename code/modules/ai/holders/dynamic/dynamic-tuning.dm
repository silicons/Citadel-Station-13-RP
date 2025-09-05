//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station developers.          *//

/datum/ai_holder/dynamic/proc/roll_reaction_time()
	return rand(tuning_reaction_time_low, tuning_reaction_time_high) * 0.01
