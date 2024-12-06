#define CELLS 8
#define CELLSIZE (32/CELLS)

// todo: rename to /obj/item/food
/obj/item/reagent_containers/food
	armor_type = /datum/armor/none
	possible_transfer_amounts = null
	volume = 50 //Sets the default container amount for all food items.
	var/filling_color = "#FFFFFF" //Used by sandwiches.
	drop_sound = 'sound/items/drop/food.ogg'
	pickup_sound = 'sound/items/pickup/food.ogg'

	var/list/center_of_mass = list() // Used for table placement

	/// inherent reagents to add when we're created from cooking
	/// this is also added if we were created from adminspawn or something
	/// this is a list of key-value's, where value is volume, and key is a typepath or id of a reagent
	/// prefer typepaths for compile-time checking.
	//  todo: write more on this / why we shouldn't this instead of food effects/etc.
	var/list/inherent_reagents
	/// reagents we kind of just start with
	/// this is used for condiment bottles, milk cartons, etc
	//  todo: why tf is a milk carton /food?
	var/list/prefill_reagents

	// todo: above is legacy

	//* Eating *//

	/// eating bite sound
	var/bite_sound = 'sound/items/eatfood.ogg'

	//* Nutrition / Reagents / Effects *//

	/// Nutrient types.
	///
	/// * These are effectively arbitrary tags. They can have behavior, be fluff, or just be inert.
	/// * This is a flat list of `NUTRIENT_*`'s, associated to a value.
	/// * This is automatically typelist/dedupe'd at runtime. This will then be **nulled out.**
	///   Use inbuilt procs to manipulate this variable.
	var/list/nutrient_types
	/// Global cache for nutrient types
	var/static/list/initial_nutrient_types = list()

/obj/item/reagent_containers/food/Initialize(mapload, cooked)
	#warn dedupe nutrient_types
	if(length(center_of_mass) && !pixel_x && !pixel_y)
		src.pixel_x = rand(-6.0, 6) //Randomizes postion
		src.pixel_y = rand(-6.0, 6)
	. = ..()
	// prefill depending on if we were cooked or an actual spawn.
	for(var/key in cooked? inherent_reagents : inherent_reagents | prefill_reagents)
		reagents.add_reagent(key, inherent_reagents[key])

#warn deal with
/obj/item/reagent_containers/food/afterattack(atom/target, mob/user, clickchain_flags, list/params)
	if(center_of_mass.len && (clickchain_flags & CLICKCHAIN_HAS_PROXIMITY) && istype(target, /obj/structure/table))
		//Places the item on a grid
		var/list/mouse_control = params2list(params)

		var/mouse_x = text2num(mouse_control["icon-x"])
		var/mouse_y = text2num(mouse_control["icon-y"])

		if(!isnum(mouse_x) || !isnum(mouse_y))
			return

		var/cell_x = max(0, min(CELLS-1, round(mouse_x/CELLSIZE)))
		var/cell_y = max(0, min(CELLS-1, round(mouse_y/CELLSIZE)))

		pixel_x = (CELLSIZE * (0.5 + cell_x)) - center_of_mass["x"]
		pixel_y = (CELLSIZE * (0.5 + cell_y)) - center_of_mass["y"]


#undef CELLS
#undef CELLSIZE

//* Nutrient Types *//

/**
 * Get overall nutrients. This can cache!
 *
 * * Gets an immutable copy. Do not modify it.
 */
/obj/item/reagent_containers/food/proc/get_nutrient_types_immutable()
	return get_self_nutrient_types_immutable()

/**
 * Invalidate nutrient types cache.
 *
 * * This doesn't regenerate it immediately, when it's regenerated is implementation defined.
 */
/obj/item/reagent_containers/food/proc/invalidate_cached_nutrient_types()
	return // no cache for now

/**
 * * Passed in list will be copied, not directly referenced.
 * * This is for ourselves, and does not include our ingredients.
 */
/obj/item/reagent_containers/food/proc/set_self_nutrient_types(list/new_nutrient_types)
	nutrient_types = new_nutrient_types.Copy()

/**
 * Gets our nutrient types.
 *
 * * Gets an immutable copy. Do not modify it.
 * * This is for ourselves, not including our ingredients.
 *
 * @return list(NUTRIENT_TYPE_* = val, ...) or null
 */
/obj/item/reagent_containers/food/proc/get_self_nutrient_types_immutable() as /list
	return initial_nutrient_types[type] || nutrient_types

/**
 * Gets our default hardcoded nutrient types.
 *
 * * Gets an immutable copy. Do not modify it.
 * * This is for ourselves, not including our ingredients.
 *
 * @return list(NUTRIENT_TYPE_* = val, ...) or null
 */
/obj/item/reagent_containers/food/proc/get_initial_self_nutrient_types_immutable() as /list
	return initial_nutrient_types[type]
