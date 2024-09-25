//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

/**
 * Something that can be routed through the datanet system.
 */
/datum/datanet_frame
	//* Routing *//

	/// origin connection address
	var/src_
	/// origin network, if any
	var/src_network_id

	/// origin network path, if any
	///
	/// * this is a 24-bit bitfield
	var/src_network_path

	/// destination connection address
	var/dst_addr
	/// destination network, if any
	var/dst_network_id

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
