// Contains code for speaking and emoting.

/datum/ai_holder/polaris


/datum/ai_holder/polaris/proc/should_threaten()
	if(!threaten)
		return FALSE // We don't negotiate.
	if(target in attackers)
		return FALSE // They (or someone like them) attacked us before, escalate immediately.
	if(!will_threaten(target))
		return FALSE // Pointless to threaten an animal, a mindless drone, or an object.
	if(stance in STANCES_COMBAT)
		return FALSE // We're probably already fighting or recently fought if not in these stances.
	if(last_threaten_time && threaten_delay && last_conflict_time + threaten_timeout > world.time)
		return FALSE // We threatened someone recently, so lets show them we mean business.
	return TRUE // Lets give them a chance to choose wisely and walk away.

/datum/ai_holder/polaris/proc/threaten_target()
	holder.face_atom(target) // Constantly face the target.

	if(!threatening) // First tick.
		threatening = TRUE
		last_threaten_time = world.time

		if(holder.ai_saylist)
			holder.ai_polaris_say(SAFEPICK(holder.ai_saylist.say_threaten))
			playsound(holder.loc, holder.ai_saylist.threaten_sound, 50, 1) // We do this twice to make the sound -very- noticable to the target.
			playsound(target.loc, holder.ai_saylist.threaten_sound, 50, 1) // Actual aim-mode also does that so at least it's consistant.
	else // Otherwise we are waiting for them to go away or to wait long enough for escalate.
		if(target in list_targets()) // Are they still visible?
			var/should_escalate = FALSE

			if(threaten_delay && last_threaten_time + threaten_delay < world.time) // Waited too long.
				should_escalate = TRUE

			if(should_escalate)
				threatening = FALSE
				set_stance(STANCE_APPROACH)
				if(holder.ai_saylist)
					holder.ai_polaris_say(SAFEPICK(holder.ai_saylist.say_escalate))
			else
				return // Wait a bit.

		else // They left, or so we think.
			if(last_threaten_time + threaten_timeout < world.time)	// They've been gone long enough, probably safe to stand down
				threatening = FALSE
			set_stance(STANCE_IDLE)
			if(holder.ai_saylist)
				holder.ai_polaris_say(SAFEPICK(holder.ai_saylist.say_stand_down))
				playsound(holder.loc, holder.ai_saylist.stand_down_sound, 50, 1) // We do this twice to make the sound -very- noticable to the target.
				playsound(target.loc, holder.ai_saylist.stand_down_sound, 50, 1) // Actual aim-mode also does that so at least it's consistant.

// Determines what is deserving of a warning when STANCE_ALERT is active.
/datum/ai_holder/polaris/proc/will_threaten(mob/living/the_target)
	if(!isliving(the_target))
		return FALSE // Turrets don't give a fuck so neither will we.
	/*
	// Find a nice way of doing this later.
	if(istype(the_target, /mob/living/simple_mob) && istype(holder, /mob/living/simple_mob))
		var/mob/living/simple_mob/us = holder
		var/mob/living/simple_mob/them = target

		if(them.intelligence_level < us.intelligence_level) // Todo: Bitflag these.
			return FALSE // Humanoids don't care about drones/animals/etc. Drones don't care about animals, and so on.
		*/
	return TRUE

// Temp defines to make the below code a bit more readable.
#define COMM_SAY				"say"
#define COMM_AUDIBLE_EMOTE		"audible emote"
#define COMM_VISUAL_EMOTE		"visual emote"

/datum/ai_holder/polaris/proc/handle_idle_speaking()
	if(rand(0,200) < speak_chance)
		// Check if anyone is around to 'appreciate' what we say.
		var/alone = TRUE
		for(var/m in viewers(holder))
			var/mob/M = m
			if(M.client)
				alone = FALSE
				break
		if(alone) // Forever alone. No point doing anything else.
			return

		var/list/comm_types = list() // What kinds of things can we do?
		if(!holder.ai_saylist)
			return

		if(holder.ai_saylist.speak.len)
			comm_types += COMM_SAY
		if(holder.ai_saylist.emote_hear.len)
			comm_types += COMM_AUDIBLE_EMOTE
		if(holder.ai_saylist.emote_see.len)
			comm_types += COMM_VISUAL_EMOTE

		if(!comm_types.len)
			return // All the relevant lists are empty, so do nothing.

		switch(pick(comm_types))
			if(COMM_SAY)
				holder.ai_polaris_say(SAFEPICK(holder.ai_saylist.speak))
			if(COMM_AUDIBLE_EMOTE)
				holder.audible_emote(SAFEPICK(holder.ai_saylist.emote_hear))
			if(COMM_VISUAL_EMOTE)
				holder.visible_emote(SAFEPICK(holder.ai_saylist.emote_see))

#undef COMM_SAY
#undef COMM_AUDIBLE_EMOTE
#undef COMM_VISUAL_EMOTE

// Handles the holder hearing a mob's say()
// Does nothing by default, override this proc for special behavior.
/datum/ai_holder/polaris/proc/on_hear_say(mob/living/speaker, message)
	return

// This is to make responses feel a bit more natural and not instant.
/datum/ai_holder/polaris/proc/delayed_say(var/message, var/mob/speak_to)
	spawn(rand(1 SECOND, 2 SECONDS))
		if(!src || !holder || !can_act())  // We might've died/got deleted/etc in the meantime.
			return

		if(speak_to)
			holder.face_atom(speak_to)
		holder.ai_polaris_say(message)
