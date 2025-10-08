//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

GLOBAL_LIST_EMPTY(admin__ranks)

/proc/admin__reload_ranks()
	load_admin_ranks()

/**
 * For now, we can only replace, no add/remove with DB.
 */
/proc/admin__replace_ranks(list/datum/admin_rank/ranks)
	#warn impl

/**
 * An admin rank. A default "Unknown" rank is made for you.
 */
/datum/admin_rank
	var/name = "Error"
	var/admin_rights = NONE

/datum/admin_rank/New(name, admin_rights)
	src.admin_rights = admin_rights

/datum/admin_rank/__fallback__
	name = "Unknown"
	right_flags = NONE

#warn impl
