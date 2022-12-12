/**
 * represents constant connections
 * this way we don't have to keep-alive by continuing to send data packets,
 * and can instead represent connectivity and simulate "streams" of data like
 * camera networks with minimum recalculations
 */
/datum/data_socket
	/// state
	var/state = SOCKET_STATE_INITIALIZING
	/// datatype
	var/datatype = SOCKET_DATATYPE_NONE

/datum/data_socket/proc/

/datum/data_socket/proc/nodes()
	return list()

/**
 * returns NOT_IMPLEMENTED if not implemented
 */
/datum/data_socket/proc/peek_data()
	switch(datatype)
		if(SOCKET_DATATYPE_NONE)
			return null
		else
			return NOT_IMPLEMENTED

/datum/data_socket/direct
	/// first node
	var/datum/data_node/A
	/// second onde
	var/datum/data_node/B

/datum/data_socket/direct/nodes()
	return list(A, B)
