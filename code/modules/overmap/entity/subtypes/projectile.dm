//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

/obj/overmap/entity/projectile
	/// lifetime in overmap distance
	#warn impl
	var/max_range = OVERMAP_PIXEL_TO_DIST(WORLD_ICON_SIZE * 15)
	/// weakrefs of impacted entities
	/// * yes, weakref; we might potentially go on for a looong time.
	var/list/datum/weakref/impacted_refs
	/// original target
	/// * this can resolve to null!
	var/datum/weakref/target_ref
	/// original firer
	/// * this can resolve to null!
	var/datum/weakref/firer_ref
	/// firing actor
	/// * this is always an owned reference.
	var/datum/event_args/actor/firer_actor

/obj/overmap/entity/projectile/CrossedWith(obj/overmap/entity/other)
	return

/obj/overmap/entity/projectile/UncrossedWith(obj/overmap/entity/other)
	return

/obj/overmap/entity/projectile/proc/set_target(obj/overmap/entity/target)
	target_ref = WEAKREF(target)

/**
 * @params
 * * source - where to fire from
 * * angle - angle to fire in
 * * actor - (optional) actor data (will be cloned)
 * * spine_x - offset x from source center when facing forwards
 * * spine_y - offset y from source center when facing forwards
 */
/obj/overmap/entity/projectile/proc/fire_from_entity(obj/overmap/entity/source, angle, datum/event_args/actor/actor, spine_x, spine_y)
	var/pos_x = source.pos_x
	var/pos_y = source.pos_y

	// shift with respect to entity rotation
	if(spine_x || spine_y)
		#warn math

	firer_ref = WEAKREF(source)
	firer_actor = actor?.clone()

	LAZYADD(impacted_refs, WEAKREF(source))

	fire(pos_x, pos_y, angle, actor)

/**
 * @params
 * * pos_x
 * * pos_y
 * * angle - angle to fire in
 * * actor - (optional) actor data (will be cloned)
 */
/obj/overmap/entity/projectile/proc/fire(pos_x, pos_y, angle, datum/event_args/actor/actor)


#warn impl


/obj/overmap/entity/projectile/proc/

/obj/overmap/entity/projectile/proc/

/obj/overmap/entity/projectile/proc/
