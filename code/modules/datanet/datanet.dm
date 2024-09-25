//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

/**
 * A datanet.
 *
 * * Packets / sockets route through these.
 * * These cannot be terminal's for packet / sockets, other than for broadcast packets.
 * * These may rewrite packets that route through it, including to itself.
 */
/datum/datanet
	/// our unique ID
	///
	/// * round-persistent
	/// * player-friendly
	var/id
	#warn assign ID

	//* Connections *//

	/// Associative list of connection UID = connection
	var/list/datum/datanet_device/connections

	//* Routing - Connection *//

	/// A reference to any downstream datanets
	var/list/datum/datanet/routing_downstreams
	/// A reference to our upstream network, if any
	var/datum/datanet/routing_upstream
	/// Our upstream network ID, if any
	var/routing_upstream_id

	//* Routing - Static *//

	/// our routing domain
	///
	/// * always inherits upstream's, if one exists
	/// * set to a domain if no upstream by whatever is managing us
	var/routing_domain
	/// our routing domain specifier
	///
	/// * always inherits upstream's, if one exists
	/// * set to a specifier if no upstream by whatever is managing us
	var/routing_specifier
	#warn setters

	//* Routing - Volatile *//

	/// our routing path
	///
	/// * this is the actual path used to route to this network
	/// * this is a 24-bit bitfield
	/// * this is extremely volatile and can change at any time
	/// * this is based off of the upstream's path and a specifier they assign us!
	var/routing_path
	/// our fragment of the routing path
	var/routing_path_fragment
	/// our routing path's length in bits
	var/routing_path_bit_length

/datum/datanet/proc/handle_inbound_packet(datum/datanet_frame/packet/packet)

	var/datum/datanet/next_network = route_frame(packet)
	if(next_network == src)
		// intended for us

		return

/datum/datanet/proc/handle_inbound_socket(datum/datanet_frame/socket/socket)

	var/datum/datanet/next_network = route_frame(socket)
	if(next_network == src)
		// intended for us

		return

/**
 * @return next /datum/datanet to send to, or null if none found
 */
/datum/datanet/proc/route_frame(datum/datanet_frame/frame)
	// check if we're the target network
	var/we_are_terminal = packet.dst_network_path == routing_path \
		&& packet.dst_route_domain == route_domain \
		&& packet.dst_route_specifier == route_specifier

	if(we_are_terminal)
		return src




#warn impl
