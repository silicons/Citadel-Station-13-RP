//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

/**
 * A datanet.
 *
 * * Packets / sockets route through these.
 * * These cannot be terminal's for packet / sockets, other than for broadcast packets.
 * * These may rewrite packets that route through it, including to itself.
 *
 * ## Routing - Network Level
 * * Datanets have a number of bits dedicated to their internal ID
 * * Their internal ID is represented as a string for quick lookup
 * * A packet is given a network sequence to route with
 *
 * ## Routing - Overview
 * * Datanet connections have an unique ID, round-persistent.
 * * Datanets have an unique ID, round-persistent.
 *
 * ## Routing - Addressing
 *
 * Packets have the following information to determine where they're going;
 * This is stored both in source as well as destination for a given packet.
 *
 * * Connection ID: directly addressed when network is reached
 * * Network ID: player-friendly network ID. Vestigal for routing, but used for logging & presentation
 * * Route Domain: routing domain, e.g. 'go to overmaps entity', 'go to nanotrasen command', etc
 * * Route Specifier: specific thing in the domain, like a given overmap entity
 * * Route Path: volatile network path in the route specifier
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

/datum/datanet/proc/handle_inbound_socket(datum/datanet_frame/socket/socket)

#warn impl
