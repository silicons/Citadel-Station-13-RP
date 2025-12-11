//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

/**
 * If a find needs to be active before being unearthed
 * (e.g. active xenoarch artifacts),
 * this stores them so they're not technically just out on the turf.
 */
/atom/movable/archeology_embedded_container
	name = "archeology embedded container"
	desc = "You really shouldn't see this."
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	atom_flags = ATOM_NONWORLD
	invisibility = INVISIBILITY_MAXIMUM

/atom/movable/archeology_embedded_container/doMove(atom/dest)
	if(!QDESTROYING(src) && dest == null)
		return FALSE
	return ..()

/atom/movable/archeology_embedded_container/Exited(atom/movable/AM, atom/newLoc)
	. = ..()
	#warn automatically obliterate self if nothing is left
