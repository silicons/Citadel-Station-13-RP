/**
 * data packets
 * useful for discrete unit and stateless transmissions like with pda/radio messages
 */
/datum/data_packet
	/// source network id
	var/src_network
	/// dest network id
	var/dest_network
	/// source node id
	var/src_node
	/// dest node id
	var/dest_node

/datum/data_packet/serialize()
	. = ..()
	.["src_network"] = src_network
	.["dest_network"] = dest_network
	.["src_node"] = src_node
	.["dest_node"] = dest_node

/datum/data_packet/deserialize(list/data)
	. = ..()
	src_network = data["src_network"]
	dest_network = data["dest_network"]
	src_node = data["src_node"]
	dest_node = data["dest_node"]

/datum/data_packet/proc/stringify()
	return "[src_network]:[src_node] -> [dest_network]:[dest_node]"

/datum/data_packet/generic
	/// data list - should be json compatible!
	var/list/data

/datum/data_packet/generic/stringify()
	return "[src_network]:[src_node] -> [dest_network]:[dest_node] data: [json_encode(data)]"
