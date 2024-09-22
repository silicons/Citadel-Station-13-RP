//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

/datum/datanet_packet
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
	/// * Because data flow is unidirectional, and routing is deterministic, editing this *is* allowed.
	var/packet_type = DATANET_PACKET_TYPE_UNKNOWN
	/// arbitrary data flowing through the packet
	///
	/// * Because data flow is unidirectional, and routing is deterministic, editing this *is* allowed.
	var/list/packet_data = list()


#warn impl
