//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

/**
 * Represents an active data-stream between a source and a destination.
 *
 * * Handling for these should generally be more using 'magic lookups' rather than the actual data.
 * * The whole point for these to exist is to make things like video streams, which obviously can't be sent as simulated packets efficiently.
 */
/datum/datanet_socket
	/// origin connection address
	var/src_addr
	/// origin network, if any
	var/src_network_id
	/// destination connection address
	var/dst_addr
	/// destination network, if any
	var/dst_network_id

	/// special routing specifier
	var/route_specifier

	/// encryption key
	///
	/// * encryption is simulated with key matching; if you have a given key, you can read the data.
	/// * null if unencrypted
	var/encryption_key

	/// arbitrary enum for what data is flowing
	///
	/// * rewrites are not supported; only sender should modify this
	var/socket_type = DATANET_SOCKET_TYPE_UNKNOWN
	/// arbitrary data flowing through the socket
	///
	/// * rewrites are not supported; only sender should modify this
	var/list/socket_data = list()

#warn impl
