//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

/datum/controller/filestore/png
	abstract_type = /datum/controller/filestore/png
	stored_type = /datum/stored_file/png

/**
 * @return hash or null
 */
/datum/controller/filestore/png/proc/store_icon(icon/I)

/**
 * @return /icon or null
 */
/datum/controller/filestore/png/proc/fetch_icon(hash)

#warn this

/datum/stored_file/png
