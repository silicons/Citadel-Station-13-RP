//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 silicons                             *//

/**
 * denotes somewhere to place starting gear, barotrauma style
 *
 * this is not a landmark because gear is spawned during map initialization, not during atom/Initialize().
 *
 * this system is not suitable for main maps / high precision placement, it's for offmaps and templates and generally
 * places where it's assumed everyone can access / shares gear with everyone else, and default gear spread is only a suggestion.
 *
 * * All gear markers that use tags share tags with other gear markers. This means that 'structured' can overflow to 'distributed'
 *   if they share the same tag; this is intended.
 */
/obj/map_helper/gear_marker
	icon = 'icons/mapping/helpers/gear_marker.dmi'
	early = TRUE
	/// if ignited, we put the results here
	/// this way it can be accessed later
	var/atom/injection_target

/obj/map_helper/gear_marker/proc/ensure_ready()
	if(!isnull(injection_target))
		return
	injection_target = ignite()

/**
 * called when we're about to perform injection
 * note: this is **not** a pure, idempotent function!
 *
 * @return injection loc
 */
/obj/map_helper/gear_marker/proc/ignite()
	PROTECTED_PROC(TRUE) // don't call this manually, call ensure_ready()
	CRASH("abstract proc called") // implement on subtypes yourself

/**
 * make sure to ensure_ready() first
 *
 * @params
 * * typepaths - list of (path = amount).
 */
/obj/map_helper/gear_marker/proc/inject(list/typepaths)
	ASSERT(!isnull(injection_target))

	inject_to_loc(injection_target, typepaths)
	return TRUE

/**
 * find an available spot in loc
 */
/obj/map_helper/gear_marker/proc/find_available_spot_in_loc()
	// closet
	var/obj/structure/closet/found = locate() in loc
	if(found)
		return found

	// on tile
	return loc

/obj/map_helper/gear_marker/proc/find_put_inside_closet_loc()
	var/obj/structure/closet/found = locate() in loc
	return found

/obj/map_helper/gear_marker/proc/find_put_on_top_of_table_loc()
	var/obj/structure/table/table = locate() in loc
	if(istype(table, /obj/structure/table/bench))
		return null
	return table.loc

/obj/map_helper/gear_marker/proc/find_put_on_floor_loc()
	return loc

/obj/map_helper/gear_marker/proc/inject_to_loc(atom/where, list/typepaths)
	var/safety = 50 // i don't konw why you'd need to spawn more than 50 items in a single spot
	for(var/path in typepaths)
		var/amount = typepaths[path]
		for(var/i in 1 to amount)
			if(safety <= 0)
				CRASH("ran out of safety")
			if(ispath(path, /obj/item/stack))
				safety -= max(spawn_stacks_at(where, path, amount), 1)
			else if(ispath(path, /datum/prototype/material))
				safety -= max(spawn_stacks_at(where, path, amount), 1)
			else
				safety -= 1
				new path(where)

GLOBAL_REAL_LIST(distributed_gear_marker_gear_weights) = list(
	//* STANDARD TAGS *//
	"dense" = 2, // do not stack dense shit where it shouldn't be
	"item" = 2, // ditto
	"stack" = 2, // ditto
	"mech" = 3, // mechs stay in the mech bay
	"crate" = 3, // crates stay in the crate racks
)

GLOBAL_REAL_LIST(distributed_gear_marker_usage_weights) = list(
	//* STANDARD TAGS *//
	"anomaly" = 5, // do not put anomalies in the main cargo hold
	"volatile" = 5, // do not put explosives in the main cargo hold
	"dangerous" = 3, // do not put dangerous shit where it doesn't belong
	"equipment" = 2, // separate concerns
	"storage" = 2, // separate concerns
	"cargo" = 2, // separate concerns
	"product" = 2, // separate concerns
)

/**
 * denotes a spot where gear can be spread to
 * * Uses 'kind' and 'place' tags.
 * * Structured spawns falls back to distributed markers if there's no structured
 *   markers left.
 */
/obj/map_helper/gear_marker/distributed
	abstract_type = /obj/map_helper/gear_marker/distributed
	/// list of tags, most to least specific
	/// specifies the type of object
	///
	/// examples:
	/// list("mecha", "dense")
	/// list("crate", "dense")
	/// list("crate", "dense")
	var/list/kind_tags = list()
	/// allow other gear types to overflow in
	var/kind_allow_inbound_overflow = TRUE
	/// list of tags, most to least specific
	/// specifies what the object is for
	///
	/// examples:
	/// list("equipment", "storage")
	/// list("storage")
	/// list("cargo")
	/// list("product")
	#warn this used to be use_tags so switch place to kind and use to place
	var/list/place_tags = list()
	/// allow other uses to overflow in
	var/place_allow_inbound_overflow = FALSE

	/// allow fulltile / dense at all?
	var/allow_dense = TRUE

	//* stateful *//

	/// were we already used to spawn a dense object?
	/// if so, we probably shouldn't spawn another
	var/has_spawned_dense = FALSE

/obj/map_helper/gear_marker/distributed/preloading_instance(datum/dmm_context/context)
	context.distributed_gear_markers += src
	// make everything assoc
	make_associative_inplace(gear_tags)
	make_associative_inplace(usage_tags)
	return ..()

/obj/map_helper/gear_marker/distributed/drop_on_floor
	icon_state = "spot"

/obj/map_helper/gear_marker/distributed/drop_on_floor/ignite()
	return find_put_on_floor_loc()

/**
 * denotes a spot where identical sets of gear should be injected at each for a given role or use case
 *
 * standard tags:
 *
 * we go off of barotrauma; offmaps generally won't have more than these 4 roles, if they do, they should be
 * doing something special anyways
 *
 * * security - used for the combat role
 * * medical - used for the healing role
 * * engineer - used for the construction role
 * * captain - used for the command role
 */
/obj/map_helper/gear_marker/role
	abstract_type = /obj/map_helper/gear_marker/role
	/// our role tag
	/// if null, allow any
	var/role_tag
	/// allow overflow
	var/role_allow_overflow = TRUE

/obj/map_helper/gear_marker/role/preloading_instance(datum/dmm_context/context)
	LAZYINITLIST(context.stamped_gear_markers_by_role[role_tag])
	context.stamped_gear_markers_by_role[role_tag] += src
	return ..()

/**
 * generates a locker (crate or closet) of a certain type
 */
/obj/map_helper/gear_marker/role/make_locker
	icon_state = "locker"

	/// locker type
	var/locker_type = /obj/structure/closet
	/// locker appearance datum to set, if any
	var/locker_appearance

/obj/map_helper/gear_marker/role/make_locker/ignite()
	return new locker_type(loc, locker_appearance)

/**
 * Standard armory-like helper.
 *
 * This is different from the rest of our gear markers in that it uses a different
 * process to populate everything.
 *
 * * allows setting tags and tag priorities; as an example, we want
 *   energy guns to spawn together but we will allow overflow if there's no more room.
 * * uses 'place' and 'kind' tags
 * * structured spawns can overflow to distributed but not the other way around
 */
/obj/map_helper/gear_marker/structured
	/// required place tag
	/// * we will not allow spawning stuff that doesn't belong here in here
	var/require_place_tag
	/// preferred kind tag
	/// * we will prefer spawning a given kind tag, but allow overflows
	var/prefer_kind_tag

	/// how many packs have we spawned? used for spreading/balancing
	var/has_spawned_pack_count = 0
	/// how many entities have we spawned? used for spreading/balancing
	var/has_spawned_entity_count = 0

#warn impl
