
// Helper proc to turn AI 'busy' mode on or off without having to check if there is an AI, to simplify writing code.
/mob/living/proc/ai_polaris_set_busy(value)
	var/datum/ai_holder/polaris/ai_holder = src.ai_holder
	if(istype(ai_holder))
		ai_holder.busy = value

/mob/living/proc/ai_polaris_is_busy()
	var/datum/ai_holder/polaris/ai_holder = src.ai_holder
	if(!istype(ai_holder))
		return FALSE
	return ai_holder.busy

// Helper proc to check for the AI's stance.
// Returns null if there's no AI holder, or the mob has a player and autopilot is not on.
// Otherwise returns the stance.
/mob/living/proc/ai_polaris_get_stance()
	var/datum/ai_holder/polaris/ai_holder = src.ai_holder
	if(!istype(ai_holder))
		return null
	if(client && !ai_holder.autopilot)
		return null
	return ai_holder.stance

// Similar to above but only returns 1 or 0.
/mob/living/proc/ai_is_polaris()
	if(!istype(ai_holder, /datum/ai_holder/polaris))
		return FALSE
	return ai_polaris_get_stance() ? TRUE : FALSE

// 'Taunts' the AI into attacking the taunter.
/mob/living/proc/ai_polaris_taunt(atom/movable/taunter, force_target_switch = FALSE)
	var/datum/ai_holder/polaris/ai_holder = src.ai_holder
	if(istype(ai_holder))
		ai_holder.receive_taunt(taunter, force_target_switch)

/mob/living/proc/ai_polaris_attack(atom/A)
	return FALSE

/mob/living/proc/ai_polaris_ranged_attack(atom/A)
	return FALSE

// Test if the AI is allowed to attempt a ranged attack.
/mob/living/proc/ai_polaris_check_ranged_attack(atom/A)
	return FALSE

/mob/living/proc/ai_polaris_special_attack(atom/A)
	return FALSE

// Is the AI allowed to attempt to do it?
/mob/living/proc/ai_polaris_check_special_attack(atom/A)
	return FALSE

/mob/living/proc/ai_polaris_say(message)
	return say(message)

/mob/living/proc/ai_polaris_is_ally(mob/living/L)
	return shares_iff_faction(L)

/mob/living/proc/ai_polaris_get_id()

/mob/living/proc/ai_polaris_in_stasis()

// Respects move cooldowns as if it had a client.
// Also tries to avoid being superdumb with moving into certain tiles (unless that's desired).
/mob/living/proc/ai_polaris_move(turf/newloc, safety = TRUE)
	if(check_move_cooldown())
//		if(!newdir)
//			newdir = get_dir(get_turf(src), newloc)

		// Check to make sure moving to newloc won't actually kill us. e.g. we're a slime and trying to walk onto water.
		if(istype(newloc))
			if(safety && !newloc.is_safe_to_enter(src))
				return POLARIS_AI_MOVEMENT_FAILED

		// Move()ing to another tile successfully returns 32 because BYOND. Would rather deal with TRUE/FALSE-esque terms.
		// Note that moving to the same tile will be 'successful'.
		var/turf/old_T = get_turf(src)

		// An adjacency check to avoid mobs phasing diagonally past windows.
		// This might be better in general movement code but I'm too scared to add it, and most things don't move diagonally anyways.
		if(!old_T.Adjacent(newloc))
			return POLARIS_AI_MOVEMENT_FAILED

		. = SelfMove(newloc) ? POLARIS_AI_MOVEMENT_SUCCESSFUL : POLARIS_AI_MOVEMENT_FAILED
		if(. == POLARIS_AI_MOVEMENT_SUCCESSFUL)
			setDir(get_dir(old_T, newloc))
			// Apply movement delay.
			// Player movement has more factors but its all in the client and fixing that would be its own project.
			applyMoveCooldown(movement_delay())
		return

	. = POLARIS_AI_MOVEMENT_ON_COOLDOWN // To avoid superfast mobs that aren't meant to be superfast. Is actually -1.
