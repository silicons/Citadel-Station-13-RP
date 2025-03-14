//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

/**
 * * [ammo_vector] is required for this to work. If it's off, undefined behavior results.
 */
/obj/item/ammo_magazine/proc/vector_get_pos(index) as /obj/item/ammo_casing
	RETURN_TYPE(/obj/item/ammo_casing)
	if(index < 1 || index > length(ammo_internal))
		return
	return ammo_internal[index]

/**
 * * [ammo_vector] is required for this to work. If it's off, undefined behavior results.
 *
 * @return old casing
 */
/obj/item/ammo_magazine/proc/vector_set_pos(index, obj/item/ammo_casing/casing) as /obj/item/ammo_casing
	RETURN_TYPE(/obj/item/ammo_casing)
	if(index < 1 || index > length(ammo_internal))
		return
	. = ammo_internal[index]
	ammo_internal[index] = casing

/**
 * * [ammo_vector] is required for this to work. If it's off, undefined behavior results.
 */
/obj/item/ammo_magazine/proc/vector_circular_get() as /obj/item/ammo_casing
	RETURN_TYPE(/obj/item/ammo_casing)
	return vector_get_pos(ammo_vector_circular_index)

/**
 * * [ammo_vector] is required for this to work. If it's off, undefined behavior results.
 *
 * @return old casing
 */
/obj/item/ammo_magazine/proc/vector_circular_set(obj/item/ammo_casing/casing) as /obj/item/ammo_casing
	RETURN_TYPE(/obj/item/ammo_casing)
	return vector_set_pos(ammo_vector_circular_index, casing)

/**
 * * [ammo_vector] is required for this to work. If it's off, undefined behavior results.
 *
 * @return resulting index
 */
/obj/item/ammo_magazine/proc/vector_circular_spin_to(index)
	#warn impl
