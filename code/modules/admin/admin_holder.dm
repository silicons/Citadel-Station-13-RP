//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

GLOBAL_LIST_EMPTY(admin__holders)

/proc/admin__reload_holders()
	load_admins()

/**
 * Registers a holder.
 * * Drop all references to the holder once this is done; it belongs
 *   in the global list.
 * * This will replace an existing holder and qdel the new one if one
 *   already exists.
 */
/proc/admin__register_holder(datum/admins/holder)
	#warn impl

/**
 * Unregisters a holder.
 * * You may keep a reference to the holder once this is done.
 */
/proc/admin__unregister_holder(datum/admins/holder)
	#warn impl

/**
 * Only replacements are allowed.
 *
 * This is because there's generally no case where
 * admin holders should be wiped first, as replacing
 * will avoid obliterating state.
 *
 * * Drop all references to the holders in the list once this is done; it belongs
 *   in the global list.
 */
/proc/admin__replace_holders(list/datum/admins/holders)
	// Clear profiling access, it'll be granted again after.
	// Technically this should be a reboot hook but replace_holders() is called
	// so often that it might as well be here.
	for(var/A in world.GetConfig("admin"))
		world.SetConfig("APP/admin", A, null)
	#warn impl

/datum/admins
	/// our admin rank. we should always have one.
	var/datum/admin_rank/admin_rank
	/// our rights. this is inherited from rank, but can be edited separately.
	var/admin_rights
	/// lazy list of active admin modals
	///
	/// todo: re-open these on reconnect.
	var/list/datum/admin_modal/admin_modals

	/// our active client, if any
	var/client/active
	/// our ckey
	var/ckey

/datum/admins/New(datum/admin_rank/rank, ckey)
	ASSERT(rank)
	ASSERT(ckey)
	src.ckey = ckey
	src.rank = rank
	#warn impl

/datum/admins/Destroy()
	QDEL_LIST(admin_modals)
	return ..()

/**
 * When replacing, the inbound holder instead overwrites us
 * if we already exist.
 */
/datum/admins/proc/overwrite_with_holder(datum/admins/inbound_holder)
	#warn impl

/datum/admins/proc/add_admin_verbs()
	if(!owner)
		return
	var/list/verbs_to_add = list()
	for(var/datum/admin_verb_descriptor/descriptor in global.admin_verb_descriptors)
		if((rights & descriptor.required_rights) != descriptor.required_rights)
			continue
		verbs_to_add += descriptor.verb_path
	add_verb(
		owner,
		verbs_to_add,
	)

/datum/admins/proc/remove_admin_verbs()
	var/list/verbs_to_remove = list()
	for(var/datum/admin_verb_descriptor/descriptor in global.admin_verb_descriptors)
		verbs_to_remove += descriptor.verb_path
	remove_verb(
		owner,
		verbs_to_remove,
	)

//* Admin Modals *//

/datum/admins/proc/open_admin_modal(path, ...)
	ASSERT(ispath(path, /datum/admin_modal))
	var/datum/admin_modal/modal = new path(src)
	if(!modal.Initialize(arglist(args.Copy(2))))
		qdel(modal)
		message_admins("Failed to initialize an admin modal. Check runtimes for more details.")
		stack_trace("failed to initialize an admin modal; this means someone passed in bad args.")
		return null
	modal.open()
	return modal

/datum/admins/vv_edit_var(var_name, var_value)
#ifdef TESTING
	return ..()
#else
	if(var_name == NAMEOF(src, rank) || var_name == NAMEOF(src, rights))
		return FALSE
	return ..()
#endif

/datum/admins/CanProcCall(procname)
	switch(procname)
		if(NAMEOF_PROC(src, open_admin_modal))
			return FALSE
	if(findtext(procname, "verb__") == 1)
		return FALSE
	return ..()
