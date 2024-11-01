//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

/datum/mapgen_descriptor/structure
    /// lower left x
    var/ll_x
    /// lower left y
    var/ll_y

#warn maybe redo all this to make more sense?

/datum/mapgen_descriptor/structure/New(ll_x, ll_y)
    src.ll_x = ll_x
    src.ll_y = ll_y

/**
 * Preconditions:
 *
 * * It's been verified the result location of base + offset will be a valid place to spawn the
 *   lower left corner.
 *
 * @params
 * * base_x - base x; this is the x - 1 of the lower left corner, e.g. 0, 0 + offset 1 = 1, 1
 * * base_y - base y; this is the y - 1 of the lower left corner, e.g. 0, 0 + offset 1 = 1, 1.
 * * base_z - base z;
 */
/datum/mapgen_descriptor/structure/proc/apply(base_x, base_y, base_z)
	CRASH("unimplemented proc called")

/datum/mapgen_descriptor/structure/template
    /// direct reference to map template
    var/datum/map_template/template
    /// template orientation; defaults to SOUTH
    var/orientation

/datum/mapgen_descriptor/structure/template/New(ll_x, ll_y, template, orientation = SOUTH)
    src.template = template
    src.orientation = orientation
    ..(ll_x, ll_y)
