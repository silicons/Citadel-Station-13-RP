//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

/**
 * Gets the predicted typepath of a casing a given index from the top, where 1 is the top.
 *
 * * Real casings are read.
 * * Fake casings are predicted from the type that would have been lazy-generated.
 * * Null if something isn't there / left
 */
/obj/item/ammo_magazine/proc/unsafe_peek_path_of_position(index)
	if(index > length(ammo_internal))
		return (index - length(ammo_internal)) >= ammo_current ? ammo_preload : null
	return ammo_internal[length(ammo_internal) - index]?.type

/**
 * Returns a direct reference to our loaded list.
 * * You shouldn't be using this, more or less.
 */
/obj/item/ammo_magazine/proc/unsafe_get_ammo_internal_ref()
	return ammo_internal
