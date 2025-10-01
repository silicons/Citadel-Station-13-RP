//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

/**
 * kinetic impact round
 * * also useful for missiles
 * * not allowed to be used outside of events, add this to a map and i will know.
 */
/obj/structure/disperser_shell/kinetic
	name = /obj/structure/disperser_shell::name + " (kinetic)"

	var/onmap_projectile_type = /obj/projectile/overmap_kinetic_shell

#warn impl
