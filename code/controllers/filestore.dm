//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

/**
 * Filestore controllers
 *
 * Storage for hashed files, as name implies.
 *
 * * There's no way to make generic implementations of this. Things like .png's (so icons),
 *   JSON's, sounds, etc, all require different handling.
 * * Instead, we have a base implementation that handles hashing and URLs,
 *   and subtypes handle the nasty work of getting stuff done for a given format.
 */
/datum/controller/filestore
	abstract_type = /datum/controller/filestore
	/// our key.
	///
	/// * do not under any circumstances change this. all data will be lost otherwise.
	var/key
	/// type of /datum/stored_file
	var/stored_type = /datum/stored_file

/**
 * @return relative path to file on disk
 */
/datum/controller/filestore/proc/path_for_hash(hash)
	#warn impl

/**
 * @return url to resolve in an <image> tag
 */
/datum/controller/filestore/proc/url_for_hash(hash)
	#warn impl

//* --------------------- Stored Files -------------------- *//

/**
 * Descriptor for a loaded file under filestore system.
 *
 * * This is not needed to access a file by web URL.
 */
/datum/stored_file

