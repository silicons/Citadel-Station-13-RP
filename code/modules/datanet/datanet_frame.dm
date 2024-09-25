//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

/**
 * Something that can be routed through the datanet system.
 */
/datum/datanet_frame
	//* Routing *//

	/// origin device id
	var/src_device_id
	/// origin network id, if any
	var/src_network_id
	/// origin network path, if any
	var/src_network_path
	/// origin route domain
	var/src_route_domain
	/// origin route specifier
	var/src_route_specifier

	/// destination device id, if any
	///
	/// * is a broadcast packet if null
	var/dst_device_id
	/// destination network id, if any
	var/dst_network_id
	/// destination network path, if any
	var/dst_network_path
	/// destination route domain
	var/dst_route_domain
	/// destination route specifier
	var/dst_route_specifier

	/// destination network, if any
	///
	/// * this is a 24-bit bitfield
	var/dst_network_path

	#warn redo
	/// special routing specifier
	var/route_specifier = DATANET_ROUTE_SPECIFIER_DEFAULT

	//* Security *//

	/// encryption key
	///
	/// * encryption is simulated with key matching; if you have a given key, you can read the data.
	/// * null if unencrypted
	var/encryption_key


#warn impl
