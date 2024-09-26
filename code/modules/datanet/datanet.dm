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
	var/list/datum/datanet_connection/connections

	//* Iptables *//

	/// Active iptables instance
	///
	/// * if non-null, this will be used to filter inbound packets.
	var/datum/datachain/iptables/iptables

	//* Routing - Connection *//

	/// A reference to any downstream datanets
	///
	/// * this is a sorted list, sorted by their part of their routing path!
	var/list/datum/datanet/routing_downstreams
	/// A reference to our upstream network, if any
	var/datum/datanet/routing_upstream
	#warn setters

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
	/// * this is a list
	/// * this is extremely volatile and can change at any time
	/// * this is based off of the upstream's path and a specifier they assign us!
	var/list/routing_path
	/// our depth in the routing tree
	var/routing_depth
	#warn setters

	//* Sockets *//

	/// the list of sockets currently routed through us
	///
	/// * these are informed to reconsider their path when we gain/lose connection and/or
	///   change state.
	/// * todo: fast way to break a socket if we know that they're no longer valid
	/// * this includes sockets targeting devices in us
	/// * this includes sockets terminating *at* us (broadcast)
	var/list/datum/datanet_frame/socket/maintaining_sockets
	/// the list of sockets currently terminating at us
	///
	/// * these are basically broadcast sockets
	var/list/datum/datanet_frame/socket/terminating_sockets

/**
 * Handles an inbound packet.
 *
 * @return DATANET_STATUS_*
 */
/datum/datanet/proc/handle_inbound_packet(datum/datanet_frame/packet/packet)
	// iptables activation
	var/iptables_result = iptables?.filter_packet(packet)
	if(iptables_result)
		return iptables_result
	// route
	var/datum/datanet/next_network = route_frame(packet)
	// intended for us?
	if(next_network == src)

		return
	// not intended for us?
	else
		return

/**
 * Handles an inbound packet.
 *
 * @return DATANET_STATUS_*
 */
/datum/datanet/proc/handle_inbound_socket(datum/datanet_frame/socket/socket)
	// route
	var/datum/datanet/next_network = route_frame(socket)
	// intended for us?
	if(next_network == src)

		return

/**
 * @return next /datum/datanet to send to, or null if none found
 */
/datum/datanet/proc/route_frame(datum/datanet_frame/frame)
	// check if we're the target network
	// list check is == because routing paths are unique network references, actually
	var/we_are_terminal = packet.dst_network_path == routing_path

	if(we_are_terminal)
		return src




#warn impl
