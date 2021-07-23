// Crucial dynamic world metadata are stored in real globals to make access faster.
// Yes, this was profiled. Globalvar lookup has no cost for accessing the datum itself.
// Subsystem contains vv_get_var and vv_edit_var helpers to access these.
/datum/controller/subsystem/worldmap
	/// VIRTUAL VARIABLE
	var/virtual_zlevels
	/// VIRTUAL VARIABLE
	var/boundary_lookups

#warn vv procs

/datum/controller/subsystem/worldmap/proc/RegenerateVirtualZList()

/datum/controller/subsystem/worldmap/proc/RegenerateBoundaryLookups()

/// An assoclist of z = TRUE (see: typecache style) for checking if a zlevel is virtual. If it is, it's used exclusively for chunkloading
GLOBAL_REAL(virtual_zlevels, /list)
/// An assoclist of "[x-y]" = TRUE (see: typecache style) for looking up chunk transitions. x-y isn't the actual x-y of the bordering tile, use helpers.dm to access this, some math is involved.
GLOBAL_REAL(boundary_lookups, /list)
