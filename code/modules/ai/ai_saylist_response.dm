//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

/**
 * Response packets from saylists.
 * * These are implementation-defined for what is actually used.
 *   AI holders can pull one and only use one part or completely
 *   mis-interpret it. Do not rely on this for enforcing AI behaviors.
 */
/datum/ai_saylist_response
	/// sent directly to saycode parser
	var/emit_say
	/// sent directly to playsound
	var/emit_sfx
	var/emit_sfx_volume = 75
	var/emit_sfx_vary = TRUE
	/// sent directly to saycode parser
	/// * implementation-defined for if this is sent before/after say,
	///   and what delay it has before/after say.
	var/emit_emote
	/// *sigh*
	var/emit_emote_audible = FALSE
	/// should face target when emitting
	/// * value is in deciseconds to hold
	var/should_face_target = 0

/datum/ai_saylist_response/proc/lazy_emit(atom/movable/agent)
	// TODO: non-mobs...
	if(!ismob(agent))
		return FALSE
	var/mob/emitting = agent

	if(emit_sfx)
		// TODO: other sound params?
		playsound(agent, emit_sfx, emit_sfx_volume, emit_sfx_vary)
	if(emit_emote)
		emitting.emote(emit_emote, emit_emote_audible ? 2 : 1)
		sleep(rand(5, 15))
	emitting.say(emit_say)
	return TRUE
