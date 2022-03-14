/**
 * embodies a single object embdded in a turf.
 */
/datum/xenoarch_find

/**
 * spawns the object in question somewhere
 *
 * @params
 * - location - where to spawn the item
 * - dug_by - who ultimately dug us up
 * - tool - what ultimately dug us up
 */
/datum/xenoarch_find/proc/Spawn(atom/location, mob/dug_by, obj/item/tool)
