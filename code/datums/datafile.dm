//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

/**
 * * Immutable when stored. Make a new one. Replacing IDs is valid, however.
 * * Avoid hard-referencing, unlike with prototypes. The subsystem reserves the right to unload datafile datums.
 * * All datafiles **MUST** implement clone() manually. The system does not accept outside references into cache;
 *   stored files will be stored, then de-serialized again.
 */
/datum/datafile
	/// Unique ID, if any
	/// * System var; only filestore controllers should edit this.
	var/s_identifier
	/// Only set when saved.
	/// * System var; only filestore controllers should edit this.
	var/s_hash
	/// Set if we are deleted.
	var/s_invalid = FALSE

/datum/datafile/proc/is_saved()
	return s_hash ? TRUE : FALSE

/datum/datafile/proc/is_valid()
	return !s_invalid

#warn impl

/datum/datafile/clone()
	// Subsystem handles setting `s_identifier` and `s_hash`
	CRASH("datafile does not implement clone")
