/**
 * Has procs relating to
 *
 * view()
 * range()
 *
 * These are mostly spatial/view scanners for various purposes.
 */

/**
 * the core proc of the game
 *
 * gets a lighting-agnostic list of people who can view source from a distance of R
 * things must have HEAR for this to iterate into them.
 *
 * only objs and mobs are considered, for speed.
 *
 * @params
 * R - the distance
 * source - the source
 */
/proc/get_hearers_in_view(R, atom/source)
	var/turf/T = get_turf(source)
	. = list()
	if(!T)
		return
	var/list/processing = list()
	if(R == 0)
		processing += T.contents
	else
		var/lum = T.luminosity
		T.luminosity = 6
		var/list/cached_view = view(R, T)
		for(var/mob/M in cached_view)
			processing += M
		for(var/obj/O in cached_view)
			processing += O
		T.luminosity = lum
	var/i = 0
	while(i < length(processing))
		var/atom/A = processing[++i]
		if(A.flags & HEAR)
			. += A
			SEND_SIGNAL(A, COMSIG_ATOM_HEARER_IN_VIEW, processing, .)
		processing += A.contents
