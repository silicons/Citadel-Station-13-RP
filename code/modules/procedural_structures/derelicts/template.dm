/**
 * derilect pieces
 * can be rotated
 */
/datum/map_template/derelict_piece
	/// cost
	var/cost = 5
	/// theme - bitfield
	var/derilect_theme = DERELICT_THEME_GENERAL
	/// room type / connect type - bitfield
	var/derilect_fragment = DERELICT_FRAGMENT_MISC
	/// list of connections
	var/datum/derelict_connection/connections
	/// do we want to overwrite others at overlapping edges?
	var/has_priority = FALSE

#warn impl

/datum/map_template/derelict_piece/proc/parse_connections()

/**
 * fits at a designated x/y/z of lower left coords
 */
/datum/map_template/derelict_piece/proc/physically_fits(dir, x, y, z)
	#warn impl

/datum/derelict_connection
	/// relative x value on map template
	var/x
	/// relative y value on map template
	var/y
	/// outgoing dir
	var/dir
	/// what we are considered
	var/derelict_fragment
	/// what we want
	var/derelict_connect
	/// prob of being sealed
	var/probability_sealed
	/// prob of being closed
	var/probability_closed
	/// size according to alignment rules - we can connect bigger, but never smaller
	var/size
	/// prefer matching size
	var/size_bias

/datum/derelict_connection/proc/create_expansion(ll_x, ll_y, ll_z)
	var/datum/derelict_expansion/expansion = new
	expansion.dir = dir
	expansion.derelict_fragment = derelict_fragment
	expansion.derelict_connect = derelict_connect
	expansion.size = size
	expansion.size_bias = size_bias
	expansion.x = x + ll_x - 1
	expansion.y = y + ll_y - 1
	expansion.z = ll_z
