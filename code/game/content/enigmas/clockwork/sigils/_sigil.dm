//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 silicons                             *//

/**
 * sigils: something carved onto another object, turf, or person
 */
// todo: /obj/structure..? maybe?
/obj/effect/clockwork_sigil
	/// entity we are inscribed on
	/// * listener hooks will be injected for deletion
	var/atom/movable/parent
	/// are we registered in the spatial lookup systme?
	var/registered
