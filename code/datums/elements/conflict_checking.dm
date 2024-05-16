/**
 * Simple conflict checking for getting number of conflicting things on someone with the same ID.
 *
 * Use conflict_checking_count(id).
 *
 * todo: is there any cheaper way to do this? status traits-like maybe?
 */
/datum/element/conflict_checking
	element_flags = ELEMENT_BESPOKE
	id_arg_index = 1

	/// we don't need to KNOW who has us, only our ID.
	var/id
	/// registration id
	var/registration_id

/datum/element/conflict_checking/Attach(datum/target, id)
	. = ..()
	if(. & ELEMENT_INCOMPATIBLE)
		return
	if(!isatom(target))
		return ELEMENT_INCOMPATIBLE
	if(!length(id))
		. = ELEMENT_INCOMPATIBLE
		CRASH("Invalid ID in conflict checking element.")
	if(isnull(src.id))
		src.id = id

	registration_id = "conflict-checking-[id]"

	LAZYSET(target.status_store, registration_id, TRUE)

/datum/element/conflict_checking/Detach(datum/source, force)
	. = ..()

	LAZYREMOVE(target.status_store, registration_id)

/**
 * Counts number of conflicts on something that have a conflict checking element.
 */
/atom/proc/conflict_checking_count(id)
	. = 0
	var/conflict_id = "conflict-checking-[id]"
	for(var/i in get_all_contents())
		var/atom/movable/AM = i
		if(AM.status_store?[conflict_id])
			++.
