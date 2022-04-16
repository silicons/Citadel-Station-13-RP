/**
 * cell component for holding power cells
 *
 * can attach to any atom
 */
/datum/component/power_cell
	/// current cell
	var/obj/item/cell/cell
	/// start with cell
	var/initial_cell
	/// remove flags
	var/remove_flags = NONE


