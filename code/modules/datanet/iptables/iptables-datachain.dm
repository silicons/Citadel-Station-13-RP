//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

/**
 * iptables gaming
 */
/datum/datachain/iptables

#warn impl

/**
 * handles a packet.
 *
 * * return a value to immediately terminate packet at this network and give
 *   the given value to sender as acknowledgement.
 *
 * @return DATANET_RESULT_*, or null if unaffected
 */
/datum/datachain/iptables/proc/filter_packet(datum/datanet_frame/packet/packet)
	return null
