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
	/// last wall detonation
	var/last_wall_detonation = 0

#warn impl all

/obj/vehicle/ridden/forklift/drive_after(mob/driver, dir, delay)
	. = ..()
	for(var/mob/living/victim in loc)
		if(IS_PRONE(victim))
			visible_message(SPAN_DANGER("[src] runs over [victim]!"))
			victim.take_overall_damage(roadkill_damage_downed)
			investigate_log("Ran over prone [victim] with driver [driver]", INVESTIGATE_VEHICLES)

/obj/vehicle/ridden/forklift/Bump(atom/obstacle)
	. = ..()
	// todo: only trigger if we're actually driving under our own power
	crashed_into_something(obstacle, TRUE)

/obj/vehicle/ridden/forklift/proc/drive_override(mob/driver, dir, base_delay)
	if(dir != src.dir)
		if(dir == turn(src.dir, 180))
			step(src, dir)
			return base_delay * 2
		else
			setDir(dir)
			return base_delay
	return ..()

/obj/vehicle/ridden/forklift/proc/try_pick_up(atom/movable/victim, mob/user)
	#warn investigate log


/obj/vehicle/ridden/forklift/proc/try_put_down(atom/movable/victim, mob/user)
	#warn investigate log

/obj/vehicle/ridden/forklift/proc/auto_pickup(mob/user, silent)
	var/atom/movable/target = auto_pickup_target()
	if(!isnull(target))
		if(!silent)
			user.action_feedback(SPAN_WARNING("There's nothing that can be picked up!"), src)
		return FALSE
	if(!try_pick_up(target, user))
		user.action_feedback(SPAN_WARNING("You fail to pick up [target]."), src)
		return FALSE
	user.action_feedback(SPAN_NOTICE("You pick up [target]."), src)
	return TRUE

/obj/vehicle/ridden/forklift/proc/auto_pickup_target()
	var/turf/target_turf = get_step(src, dir)
	var/obj/structure/closet/crate/crate = locate() in target_turf
	if(!isnull(crate))
		return crate
	var/obj/structure/closet/closet = locate() in target_turf
	if(!isnull(closet))
		return closet
	for(var/obj/O in target_turf)
		if(!O.anchored)
			return O
	for(var/mob/M in target_turf)
		if(!M.anchored && isliving(M))
			return M

/obj/vehicle/ridden/forklift/proc/auto_place(mob/user, silent)

/obj/vehicle/ridden/forklift/proc/crashed_into_something(atom/what, allow_carry_through)
	if(isturf(what))
		if(!destructive || !very_destructive)
			visible_message(SPAN_DANGER("[src] slams into [what]!"))
			playsound(src, "punch", 75, 1)
		#warn impl


#warn impl all

/obj/vehicle/ridden/forklift/ui_action_click(datum/action/action, mob/user)
	switch(action.type)
		if(/datum/action/vehicle/ridden/forklift/lift)
			auto_pickup(user)
		if(/datum/action/vehicle/ridden/forklift/place)
			auto_place(user)

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
