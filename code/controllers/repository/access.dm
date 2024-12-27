//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

REPOSITORY_DEF(access)
	name = "Repository - Access"
	expected_type = /datum/prototype/access

/datum/controller/repository/access/load(datum/prototype/access/instance)
	. = ..()
	if(!.)
		return
	// todo: caching

/datum/controller/repository/access/unload(datum/prototype/access/instance)
	. = ..()
	// todo: caching

// todo: caching

/datum/controller/repository/access/proc/fetch_by_access_domain_mutable(domain) as /list
	. = list()
	for(var/datum/prototype/access/access as anything in fetch_subtypes(/datum/prototype/access))
		if(access.access_domain & domain)
			. += access

/datum/controller/repository/access/proc/fetch_by_access_region_mutable(region) as /list
	. = list()
	for(var/datum/prototype/access/access as anything in fetch_subtypes(/datum/prototype/access))
		if(access.access_region & region)
			. += access

/datum/controller/repository/access/proc/fetch_by_access_category_mutable(category) as /list
	. = list()
	for(var/datum/prototype/access/access as anything in fetch_subtypes(/datum/prototype/access))
		if(access.access_category == category)
			. += access

/datum/controller/repository/access/proc/fetch_ids_by_access_domain_mutable(domain) as /list
	. = list()
	for(var/datum/prototype/access/access as anything in fetch_by_access_domain_immutable(domain))
		. += access.id

/datum/controller/repository/access/proc/fetch_ids_by_access_region_mutable(region) as /list
	. = list()
	for(var/datum/prototype/access/access as anything in fetch_ids_by_access_region_mutable(region))
		. += access.id

/datum/controller/repository/access/proc/fetch_ids_by_access_category_mutable(category) as /list
	. = list()
	for(var/datum/prototype/access/access as anything in fetch_ids_by_access_category_mutable(category))
		. += access.id
