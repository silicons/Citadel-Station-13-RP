
/mob/living/simple_mob/ai_polaris_attack(atom/A)
	if(!canClick()) // Still on cooldown from a "click".
		return FALSE
	return attack_target(A) // This will set click cooldown.

/mob/living/simple_mob/ai_polaris_ranged_attack(atom/A)
	if(!canClick()) // Still on cooldown from a "click".
		return FALSE
	return shoot_target(A)

/mob/living/simple_mob/ai_polaris_check_ranged_attack(atom/A)
	if(needs_reload)
		if(reload_count >= reload_max)
			try_reload()
			return FALSE
	return projectiletype ? TRUE : FALSE

/mob/living/simple_mob/ai_polaris_special_attack(atom/A)
	return special_attack_target(A)

/mob/living/simple_mob/ai_polaris_check_special_attack(atom/A)
	return can_special_attack(A) && should_special_attack(A) // Just because we can doesn't mean we should.

/mob/living/simple_mob/ai_polaris_is_ally(mob/living/L)
	. = ..()
	if(!.) // Outside the faction, try to see if they're friends.
		return L in friends

/mob/living/simple_mob/ai_polaris_get_id()
	if(access_card)
		return access_card.GetID()

/mob/living/simple_mob/ai_polaris_in_stasis()
	if(in_stasis)
		return TRUE
