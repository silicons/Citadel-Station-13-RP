/**
 * The core of say-code, including:
 *
 * saycode itself
 * Hear(), part of saycode
 * visible messages and deriviatives
 * audible messages and deriviatives
 *
 * combined, these handle the core of in game communications.
 */


/// Show a message to all mobs and objects in sight of this atom
/// Use for objects performing visible actions
/// message is output to anyone who can see, e.g. "The [src] does something!"
/// blind_message (optional) is what blind people will hear e.g. "You hear something!"
/atom/proc/visible_message(message, self_message, blind_message, range = world.view)

	var/list/see
	if(isbelly(loc))
		var/obj/belly/B = loc
		see = B.get_mobs_and_objs_in_belly()
	else
		see = get_mobs_and_objs_in_view_fast(get_turf(src),range,remote_ghosts = FALSE)

	var/list/seeing_mobs = see["mobs"]
	var/list/seeing_objs = see["objs"]

	for(var/obj in seeing_objs)
		var/obj/O = obj
		O.show_message(message, 1, blind_message, 2)
	for(var/mob in seeing_mobs)
		var/mob/M = mob
		if(self_message && (M == src))
			M.show_message(self_message, 1, blind_message, 2)
		else if((M.see_invisible >= invisibility) && MOB_CAN_SEE_PLANE(M, plane))
			M.show_message(message, 1, blind_message, 2)
		else if(blind_message)
			M.show_message(blind_message, 2)

/// Show a message to all mobs and objects in earshot of this atom
/// Use for objects performing audible actions
/// message is the message output to anyone who can hear.
/// deaf_message (optional) is what deaf people will see.
/// hearing_distance (optional) is the range, how many tiles away the message can be heard.
/atom/proc/audible_message(var/message, var/deaf_message, var/hearing_distance)

	var/range = hearing_distance || world.view
	var/list/hear = get_mobs_and_objs_in_view_fast(get_turf(src),range,remote_ghosts = FALSE)

	var/list/hearing_mobs = hear["mobs"]
	var/list/hearing_objs = hear["objs"]
	var/list/heard_to_floating_message
	for(var/obj in hearing_objs)
		var/obj/O = obj
		O.show_message(message, 2, deaf_message, 1)

	for(var/mob in hearing_mobs)
		var/mob/M = mob
		var/msg = message
		M.show_message(msg, 2, deaf_message, 1)
		M += heard_to_floating_message
	INVOKE_ASYNC(src, /atom/movable/proc/animate_chat, (message ? message : deaf_message), null, FALSE, heard_to_floating_message, 30)
