//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

#warn update all these for ammo vector

/**
 * peek top ammo casing
 */
/obj/item/ammo_magazine/proc/peek()
	RETURN_TYPE(/obj/item/ammo_casing)
	if(!length(ammo_internal))
		// list empty, see if we have one to inject
		if(!ammo_current || !ammo_preload)
			// we're empty
			return
		var/obj/item/ammo_casing/created = instantiate_casing()
		if(isnull(ammo_internal))
			ammo_internal = list(created)
		else
			ammo_internal += created
		--ammo_current
		return created
	return ammo_internal[length(ammo_internal)]

/**
 * get and eject top casing
 */
/obj/item/ammo_magazine/proc/pop(atom/newloc, no_update)
	RETURN_TYPE(/obj/item/ammo_casing)
	if(length(ammo_internal))
		// list filled
		. = ammo_internal[length(ammo_internal)]
		--ammo_internal.len
		update_icon()
		return
	// list empty
	if(!ammo_current || !ammo_preload)
		return
	. = instantiate_casing(newloc)
	--ammo_current
	if(!no_update)
		update_icon()

/**
 * put a casing into top
 *
 * @return TRUE/FALSE on success/failure
 */
/obj/item/ammo_magazine/proc/push(obj/item/ammo_casing/casing, no_update, force)
	if(get_amount_remaining() >= ammo_max && !force)
		return FALSE
	LAZYADD(ammo_internal, casing)
	if(casing.loc != src)
		casing.forceMove(src)
	if(!no_update)
		update_icon()
	return TRUE

/**
 * replace the first spent casing from the top or insert top depending on if there's room
 *
 * @return TRUE/FALSE on success/failure
 */
/obj/item/ammo_magazine/proc/push_resupply(obj/item/ammo_casing/casing, no_update, atom/transfer_old_to)
	// try to resupply
	for(var/i in length(ammo_internal) to 1 step -1)
		var/obj/item/ammo_casing/loaded = ammo_internal[i]
		if(loaded.is_loaded())
			continue
		loaded.forceMove(transfer_old_to || drop_location())
		ammo_internal[i] = casing
		if(casing.loc != src)
			casing.forceMove(src)
		return TRUE
	if(!no_update)
		update_icon()
	// try to insert
	return push(casing, no_update)
