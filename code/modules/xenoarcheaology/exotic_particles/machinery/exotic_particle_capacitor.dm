//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

/obj/machinery/exotic_particle_capacitor
	name = "particle capacitor"
	desc = "A special capacitor capable of holding certain kinds of exotic particles."
	#warn sprite

	/// nullable
	var/datum/prototype/exotic_particle/contained_particle
	var/contained = 0
	var/contained_max = 0

#warn impl
