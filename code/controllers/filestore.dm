//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

/datum/controller/filestore
	/// expected type of datafile
	var/expected_type

	/// cached files by hash
	var/list/file_cache_by_hash = list()
	/// cached files by id
	var/list/file_cache_by_id = list()

	/// active storage driver
	var/datum/filestore_storage_driver/storage_driver

/**
 * @return ref to now-cached file
 */
/datum/controller/filestore/proc/store(datum/datafile/file)

/**
 * Entirely deletes a file. This is not reversible.
 * * Admin-proccall guarded.
 * * The file ref is dropped from caches in the process.
 *   This includes 'file_cache_by_id' of every id the file had that
 *   it was fetched with.
 */
/datum/controller/filestore/proc/delete(datum/datafile/file)
	if(IsAdminAdvancedProcCall())
		return FALSE
	#warn impl

/datum/controller/filestore/proc/fetch_by_hash(hash) as /datum/datafile

/datum/controller/filestore/proc/fetch_by_identifier(id) as /datum/datafile

/**
 * * CRASH()es out if the ID already exists and 'allow_replace' isn't set.
 * * Duplicating IDs is allowed, even if undesirable.
 * @return ref to now-cached file
 */
/datum/controller/filestore/proc/link_id(datum/datafile/file, id, allow_replace)

/**
 * Unlinks an ID from the hash.
 * * The file is not actually deleted, even if all IDs are lost.
 */
/datum/controller/filestore/proc/unlink_id(datum/datafile/file, id)

/**
 * Get URL of hash or ID.
 */
/datum/controller/filestore/proc/get_url(id)
	return get_url_of_id(id) || get_url_of_hash(hash)

/**
 * Get URL of an ID
 */
/datum/controller/filestore/proc/get_url_of_id(id)

/**
 * Get URL of a hash
 */
/datum/controller/filestore/proc/get_url_of_hash(hash)


#warn impl
