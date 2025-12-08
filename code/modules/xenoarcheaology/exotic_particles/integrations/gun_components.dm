//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

/obj/item/gun_component/exotic_particle_injector
	#warn sprites for subtypes?

	var/enabled

/obj/item/gun_component/exotic_particle_injector/acceleration_coil
	name = /obj/item/gun_component/acceleration_coil::name + " (exotic particle injector)"
	desc = {"
		A magnetic acceleration coil that can infuse outgoing shots with exotic particles from an inserted battery.
	"}
	component_slot = GUN_COMPONENT_ACCELERATION_COIL

/obj/item/gun_component/exotic_particle_injector/focusing_lens
	name = /obj/item/gun_component/focusing_lens::name + " (exotic particle injector)"
	desc = {"
		A special focusing lens that can inject exotic particles inline with a weapon's discharge beam.
	"}
	component_slot = GUN_COMPONENT_FOCUSING_LENS

#warn impl
