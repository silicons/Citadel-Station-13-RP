//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

/**
 * Represents an active data-stream between a source and a destination.
 *
 * * Handling for these should generally be more using 'magic lookups' rather than the actual data.
 * * The whole point for these to exist is to make things like video streams, which obviously can't be sent as simulated packets efficiently.
 */
/datum/datanet_frame/socket
	//* Data *//

	/// arbitrary enum for what data is flowing
	///
	/// * rewrites are not supported; only sender should modify this
	var/socket_type = DATANET_SOCKET_TYPE_UNKNOWN
	/// arbitrary data flowing through the socket
	///
	/// * rewrites are not supported; only sender & receiver should modify this
	var/list/socket_data = list()
	/// arbitrary flags imposed by networks or other things the socket is routing through
	///
	/// * k-v list
	/// * modifications must inherently track source and be removable without a full recalculation
	var/list/socket_flags = list()
	/// domain; used for broadcast filtering
	var/socket_domain = DATANET_SOCKET_DOMAIN_DEFAULT

#warn impl
