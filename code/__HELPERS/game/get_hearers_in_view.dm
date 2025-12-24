
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
		if(A.atom_flags & ATOM_HEAR)
			. += A
		processing += A.contents

#warn impl
