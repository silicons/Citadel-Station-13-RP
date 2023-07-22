//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2023 Citadel Station developers.          *//

/obj/vehicle/ridden/forklift
	name = "forklift"
	desc = "A forklift. Are you certified?"

	#warn impl all

	movedelay = 2

	/// held movables.
	var/list/atom/movable/held
	/// maximum crates
	var/held_max_crates = 5
	/// can run people over
	var/roadkill_mode = FALSE
	/// run-over damage for standing
	var/roadkill_damage_knockdown = 15
	/// run-over damage for laying down
	var/roadkill_damage_downed = 5
	/// run-over stun
	var/roadkill_knockdown = 1 SECONDS
	/// uh oh
	var/destructive = FALSE
	/// UH OH
	var/very_destructive = FALSE

#warn impl all

/obj/vehicle/ridden/forklift/drive_after(mob/driver, dir, success)
	#warn impl

/obj/vehicle/ridden/forklift/Bump(atom/obstacle)
	. = ..()


/obj/vehicle/ridden/forklift/proc/drive_override(mob/driver, dir)

/obj/vehicle/ridden/forklift/proc/try_pick_up(atom/movable/victim)

/obj/vehicle/ridden/forklift/proc/try_put_down(atom/movable/victim)

/obj/vehicle/ridden/forklift/proc/auto_pickup()

/obj/vehicle/ridden/forklift/proc/auto_place()

/obj/vehicle/ridden/forklift/proc/crashed_into_something(atom/what)

/obj/vehicle/ridden/forklift/ui_action_click(datum/action/action, mob/user)
	switch(action.type)
		if(/datum/action/vehicle/ridden/forklift/lift)
		if(/datum/action/vehicle/ridden/forklift/place)
		#warn impl all

/obj/vehicle/ridden/forklift/unsafe
	name = "jury rigged forklift"
	desc = "A forklift. This one seems to be modified. That can't be a good idea."
	roadkill_mode = TRUE
	movedelay = 1.5

/obj/vehicle/ridden/forklift/unsafe/oh_shit
	name = "combat forklift"
	desc = "SUCK MY COCK, OSHA!!!"
	roadkill_damage_downed = 20
	roadkill_damage_knockdown = 50
	movedelay = 1.25
	destructive = TRUE
	very_destructive = TRUE

/datum/action/vehicle/ridden/forklift
	abstract_type = /datum/action/vehicle/ridden/forklift

/datum/action/vehicle/ridden/forklift/lift
	#warn impl

/datum/action/vehicle/ridden/forklift/place
	#warn impl
