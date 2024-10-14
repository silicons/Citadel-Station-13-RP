/**
 * 2-way pipes that join layers separately.
 *
 * * Does not support bends right now.
 * * Indices are 1 to 5 for layers 1 to 5 on forward side, 6 to 10 for layers 1 to 5 on backwards side.
 */
/obj/machinery/atmospherics/mains_pipe/simple
	#warn impl

	var/obj/machinery/atmospherics/node_f1
	var/obj/machinery/atmospherics/node_f2
	var/obj/machinery/atmospherics/node_f3
	var/obj/machinery/atmospherics/node_f4
	var/obj/machinery/atmospherics/node_f5
	
	var/obj/machinery/atmospherics/node_b1
	var/obj/machinery/atmospherics/node_b2
	var/obj/machinery/atmospherics/node_b3
	var/obj/machinery/atmospherics/node_b4
	var/obj/machinery/atmospherics/node_b5
