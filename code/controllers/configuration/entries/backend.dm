/datum/config_entry/string/backend
	abstract_type = /datum/config_entry/string/backend

/**
 * Enable high-performance filestore with persistent storage.
 *
 * * If disabled, filestores will store everything in memory.
 * * It is highly recommended to keep this on for a production deployment.
 *
 * todo: postload check for root/webroot.
 */
/datum/config_entry/flag/backend/filestore_active
	name = "backend.filestore.active"
	protection = CONFIG_ENTRY_LOCKED

/**
 * [value]/pic.png is where we store filestore'd assets.
 */
/datum/config_entry/string/backend/filestore_root
	name = "backend.filestore.root"
	protection = CONFIG_ENTRY_LOCKED

#warn trim trailing / automatically

/**
 * [value]/pic.png is where we serve filestore'd assets.
 */
/datum/config_entry/string/backend/filestore_webroot
	name = "backend.filestore.webroot"
	protection = CONFIG_ENTRY_LOCKED

#warn trim trailing / automatically

#warn ugh
