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

/datum/datanet/proc/handle_inbound_packet(datum/datanet_packet/packet)

/datum/datanet/proc/handle_inbound_socket(datum/datanet_socket/socket)

#warn impl
