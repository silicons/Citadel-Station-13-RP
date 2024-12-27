//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2023 Citadel Station developers.          *//

/datum/controller/subsystem/job

	/// cached accesses that can edit lookup by "[id]" associated to list of access ids it can edit
	var/tmp/list/cached_access_edit_lookup
	/// cached accesses that can edit
	var/tmp/list/cached_access_edit_relevant

/datum/controller/subsystem/job/proc/init_access()
	for(var/path in subtypesof(/datum/prototype/access))
		if(is_abstract(path))
			continue
		var/datum/prototype/access/A = new path
		access_datums += A
		access_path_lookup[A.type] = A
		access_id_lookup["[A.access_value]"] = A

		if(A.is_edit_relevant())
			cached_access_edit_relevant += A.access_value

/**
 * generates tgui access data usable by AccessList and anything else compliant with its interface
 *
 * todo: deprecated, we should only send relevant ones
 */
/datum/controller/subsystem/job/proc/tgui_access_data()
	var/list/data = list()
	for(var/datum/prototype/access/A as anything in RSaccess.fetch_subtypes(/datum/prototype/access))
		data[++data.len] = list(
			"value" = A.access_value,
			"name" = A.access_name,
			"category" = A.access_category,
			"region" = A.access_region,
			"type" = A.access_domain,
		)
	return data

/**
 * Return list of access ids a given access can edit
 *
 * This list is *not* mutable! Do not edit it!
 */
/datum/controller/subsystem/job/proc/editable_access_ids_by_id(id)
	if((. = cached_access_edit_lookup["[id]"]))
		return
	var/datum/prototype/access/A = access_lookup(id)
	if(!A)
		cached_access_edit_lookup["[id]"] = list()
		return
	. = list()
	// special
	for(var/datum/prototype/access/other as anything in A.access_edit_list)
		. |= isnum(other)? other : initial(other.access_value)
	// categories
	for(var/cat in A.access_edit_category)
		. |= access_ids_of_category(cat)
	// types / regions
	. |= (access_ids_of_type(A.access_edit_type) & access_ids_of_region(A.access_edit_region))
	cached_access_edit_lookup["[id]"] = .
