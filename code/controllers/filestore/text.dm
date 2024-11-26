//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

/datum/controller/filestore/text
	abstract_type = /datum/controller/filestore/text
	stored_type = /datum/stored_file/text

/**
 * @return hash or null
 */
/datum/controller/filestore/text/proc/store_text(string)

/**
 * @return /icon or null
 */
/datum/controller/filestore/text/proc/fetch_text(hash)

#warn this

/datum/stored_file/text
