//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

GLOBAL_LIST_EMPTY(struct_access_holders)
GLOBAL_LIST_EMPTY(struct_access_holders_dynamic)

/proc/fetch_cached_access_holder_struct(typepath)
	#warn impl

/proc/fetch_deduped_access_holder_struct(list/req_access, list/req_one_access)
	#warn impl

/**
 * A datum holder for ACL's using standard `/datum/access`'s
 */
/datum/access_holder
	/// cached copy; we should reject all edits.
	var/tmp/is_shared_ref = FALSE
	/// hasn't initialized / processed our raw access list yet.
	var/is_not_loaded = FALSE

	/**
	 * list of access ids that are always required
	 */
	var/list/req_all_access
	/**
	 * list of access ids that require at least one of
	 */
	var/list/req_one_access

	/// namespace to prefix all accesses with on load
	var/use_namespace

/datum/access_holder/vv_edit_var(var_name, var_value, mass_edit, raw_edit)
	. = ..()
	#warn don't allow on shared ref

/datum/access_holder/proc/process_load_values()

/datum/access_holder/proc/check_allowed(list/auth_access_ids)
	if(is_not_loaded)
		process_load_values()

#warn impl
