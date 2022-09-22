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


