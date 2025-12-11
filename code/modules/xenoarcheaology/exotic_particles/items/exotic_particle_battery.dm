//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

/obj/item/exotic_particle_battery
	name = "particle battery"
	desc = "A special battery capable of holding certain kinds of exotic particles."
	#warn sprite

	/// nullable
	var/datum/prototype/exotic_particle/contained_particle
	var/contained = 0
	var/contained_max = 0

#warn impl

/obj/item/exotic_particle_battery/small
	contained_max = 1000

/obj/item/exotic_particle_battery/medium
	contained_max = 5000

/obj/item/exotic_particle_battery/large
	contained_max = 25000
