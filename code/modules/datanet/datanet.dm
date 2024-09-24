//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

/**
 * A datanet.
 *
 * * Packets / sockets route through these.
 * * These cannot be terminal's for packet / sockets, other than for broadcast packets.
 * * These may rewrite packets that route through it, including to itself.
 *
 * ## Routing
 * * A datanet may have one or zero upstreams.
 */
/datum/datanet
	/// our unique ID
	var/id
	#warn assign ID

	//* Routing *//

	/// Our active routing graph.
	var/datum/datanet_routing_graph/routing_graph
	/// A reference to any downstream datanets
	var/list/datum/datanet/routing_downstreams
	/// A reference to our upstream network, if any
	var/datum/datanet/routing_upstream
	/// Our upstream network ID, if any
	var/routing_upstream_id

/datum/datanet/proc/handle_inbound_packet(datum/datanet_packet/packet)

/datum/datanet/proc/handle_inbound_socket(datum/datanet_socket/socket)

#warn impl
