/**
 * control columns
 *
 * they are not /obj/machinery/ship because they don't necessarily anchor to the ship they're on
 */
/obj/machinery/ship_control
	name = "ship controller, kind of"
	desc = "What..?"
	#warn icon, state

	

/**
 * force all linked consoles to reconnect
 * useful when something major changes like disabling wireless
 */
/obj/machinery/ship_control/proc/force_reconnection()
	#warn impl

/**
 * get the ship we're controlling
 */
/obj/machinery/ship_control/proc/get_host()

/obj/machinery/ship_control/primary
	name = "control columnn"
	desc = "A massive column wired into a ship's control pathways. Consoles use this to 'wirelessly' control ship peripherals."

	/// linked overmap ship
	var/datum/ship/host

#warn impl all

/obj/machinery/ship_control


/obj/machinery/ship_control/linked
	name = "subspace column"
	desc = "A column with a direct connection to a ship's control column, allowing for access to the linked ship as long as the link remains open."

	/// master
	var/obj/machinery/ship_control/primary

/obj/machinery/ship_control/linked/
