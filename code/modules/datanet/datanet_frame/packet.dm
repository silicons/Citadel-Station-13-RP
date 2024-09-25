//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

/datum/datanet_frame/packet
	//* Data *//

	/// arbitrary enum for what data is flowing
	///
	/// * Because data flow is unidirectional, and routing is deterministic, editing this *is* allowed.
	var/packet_type = DATANET_PACKET_TYPE_UNKNOWN
	/// arbitrary data flowing through the packet
	///
	/// * Because data flow is unidirectional, and routing is deterministic, editing this *is* allowed.
	var/list/packet_data = list()
	/// domain; used for broadcast filtering
	var/packet_domain = DATANET_PACKET_DOMAIN_DEFAULT

#warn impl
