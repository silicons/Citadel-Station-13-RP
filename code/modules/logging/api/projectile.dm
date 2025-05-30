//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

/proc/log_gun_firing_cycle(obj/item/gun, datum/gun_firing_cycle/cycle)
	global.event_logger.log__gun_firing_cycle(gun, cycle)

	var/datum/event_args/actor/actor = cycle.firing_actor
	var/atom/firing_atom = cycle.firing_atom
	log_attack("gun-fire: [actor ? actor.actor_log_string() : "[firing_atom] (no actor)"] using [gun] firing at [cycle.original_target || "null"] with angle [cycle.original_angle]: [cycle.cycle_iterations_fired] fired, '[cycle.firemode]' firemode")
