//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 silicons                             *//

/proc/clockwork_draw_power_from_actor(datum/event_args/actor/actor, kj)
	return clockwork_draw_power_from_user(actor.performer, kj)

/proc/clockwork_draw_power_from_user(mob/user, kj)
	#warn impl
