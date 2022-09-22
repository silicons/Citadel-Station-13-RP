GLOBAL_LIST_EMPTY(emotes)
GLOBAL_LIST_EMPTY(emote_lookup)

/proc/_initialize_emotes()
	GLOB.emotes = _all_emotes
	_rebuild_emote_lookup()

/proc/_all_emotes()
	for(var/path in subtypesof(/datum/emote))

/proc/_rebuild_emote_lookup()

/**
 * get the first emote datum that can be ran by a mob
 */
/proc/emote_lookup_simple(mob/M, key)

/**
 * get all the emotes of a key
 */
/proc/emote_lookup_full(key)
	return emotes[key]

/datum/emote
	//! intrinsics
	/// abstract type
	var/abstract_type = /datum/emote
	/// key - this is what goes after the *
	var/key
	/// name - user friendly name
	var/name = "unknown emote"

	//! standard handling
	/// skip standard handling entirely?
	var/no_standard_handling = FALSE
	/// a sound, list of sounds, or a soundbyte datum path (or a list of those).
	var/sound
	/// a message, or a list of messages to display; %THEY% replaces to p_they(), %THEIR% replaces to p_their(), %THEM% replaces to p_them().
	var/message
	/// message type
	var/message_type = NONE
	/// message class
	var/message_class = MESSAGE_CLASS_EMOTE
	/// do we do the %THING% replacements? if not, set this to FALSE so we don't waste CPU trying!
	var/message_preprocess = FALSE

//! The Two Most Important Heuristics
/**
 * checks to see if an emote is applicable for us;
 * this isn't to say "you can't do this because you aren't a synth"
 * this is to say "you can't do this because too bad", aka "that verb doesn't exist or isn't accessible" style.
 *
 * **do not try to check clients, emote lists are built automagically, and there won't be clients.**
 */
/datum/emote/proc/is_valid(mob/M)

/**
 * checks to see if we can potentially collide with another
 */
/datum/emote/proc/collides_with(datum/emote/other)
	return other.key == key

//! Emote Execution
/**
 * runs emote. can block caller.
 *
 * @params
 * - M - the mob invoking
 * - C - the client invoking, if any
 * - extra - the stuff after the "*emote Stuff" <-- Stuff, not including the " ".
 */
/datum/emote/proc/Invoke(mob/M, client/C, extra)
	return Run(M, C, extra)

/**
 * runs emote. cannot block caller.
 */
/datum/emote/proc/InvokeAsync(mob/M, client/C, extra)
	set waitfor = FALSE
	. = Invoke(arglist(args))

/**
 * What happens when the emote runs
 */
/datum/emote/proc/Run(mob/M, client/C, extra)
	if(!no_standard_handling)
		if(sound)
			Sound(M, extra = extra)
		if(message)
			Message(M, extra = extra)

/**
 * plays sound
 */
/datum/emote/proc/Sound(atom/source, sound)

/**
 * displays message
 */
/datum/emote/proc/Message(atom/source, message, type = message_type, class = message_class)

#warn okay given we have to sometimes switch message type + messgae based on user stuff, this ain't working

/**
 * preprocess message
 *
 * called regardless of if standard preprocessing is enabled, so feel free to do your own thing!
 */
/datum/emote/proc/ProcessMessage(mob/user, message, extra)
	if(!message_preprocess)
		return message
	if(!user)
		message = replacetext_char(message, "%THEM%", "them")
		message = replacetext_char(message, "%THEY%", "they")
		message = replacetext_char(message, "%THEIR%", "their")
	else
		message = replacetext_char(message, "%THEM%", user.p_them())
		message = replacetext_char(message, "%THEY%", user.p_they())
		message = replacetext_char(message, "%THEIR%", user.p_their())
