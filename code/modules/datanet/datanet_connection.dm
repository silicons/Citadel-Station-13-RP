//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

/**
 * Terminal points for packets / sockets.
 *
 * * These do not handle routing. `/datum/datanet` handles that.
 * * These may not forward packets / sockets further through the main routing processing system; doing so would violate routing determinism.
 * * You may send packets back on receive, and craft new packets. Be careful to not start an infinite loop.
 */
/datum/datanet_connection
	/// bound /datum, if any
	var/datum/bound

	/// active sockets with us as the source
	var/list/datum/datanet_socket/active_outbound_sockets
	/// active sockets with us as the destination
	var/list/datum/datanet_socket/active_inbound_sockets

/datum/datanet_connection/New(datum/bind_to)
	src.bound = bind_to

/datum/datanet_connection/Destroy()
	bound = null
	#warn terminate sockets
	return ..()

/**
 * Sends a packet out. Does not block.
 *
 * todo: timeout
 *
 * @params
 * * packet - outgoing packet
 * * on_finish - (optional) callback called with args (packet: /datum/datanet_packet, result: DATANET_RESULT_* enum) appended on finish.
 */
/datum/datanet_connection/proc/send_packet_async(datum/datanet_packet/packet, datum/callback/on_finish)
	SHOULD_NOT_OVERRIDE(TRUE)
	SHOULD_NOT_SLEEP(TRUE)

	ASYNC
		send_packet(packet, on_finish)

/**
 * Sends a packet out. Blocks until finish.
 *
 * * Datanat routing is not currently allowed to block, at all. The receiving side must return a DATANET_RESULT_* immediately.
 * * However, to support potential future behaviors, this must be assumed to be blocking. Use send_packet_async() if you need non-blocking behavior.
 *
 * @return DATANET_RESULT_* from receiver / first point of route failure
 */
/datum/datanet_connection/proc/send_packet_sync(datum/datanet_packet/packet)
	SHOULD_NOT_OVERRIDE(TRUE)
	return send_packet(packet)

/**
 * Sends a packet out.
 *
 * * Packet rewrites here are discouraged but allowed.
 * * This is a blocking proc, and what both public send_packet() wrappers go to.
 *
 * @params
 * * packet - outgoing packet
 * * on_finish - (optional) callback called with args (packet: /datum/datanet_packet, result: DATANET_RESULT_* enum) appended on finish.
 *
 * @return DATANET_RESULT_* from receiver / first point of route failure
 */
/datum/datanet_connection/proc/send_packet(datum/datanet_packet/packet, datum/callback/on_finish)
	PROTECTED_PROC(TRUE)

	var/result = route_packet(packet)
	on_finish?.Invoke(packet, result)
	return result

/**
 * Kicks off the routing handling for a packet, and does the actual transmission.
 *
 * * This should ultimately result in either a failure, or a DATANET_RESULT_* enum
 * * This may block.
 *
 * @return DATANET_RESULT_*
 */
/datum/datanet_connection/proc/route_packet(datum/datanet_packet/packet)
	return DATANET_RESULT_UNSUPPORTED_ROUTE


#warn impl


//* /datum level hooks *//

#warn hook below

/**
 * Called from a /datum/datanet_connection owned by us
 */
/datum/proc/datanet_on_packet_receive(datum/datanet_connection/connection, datum/datanet_packet/packet)
	return

/**
 * Called from a /datum/datanet_connection owned by us
 */
/datum/proc/datanet_on_socket_connect(datum/datanet_connection/connection, datum/datanet_socket/socket)
	return

/**
 * Called from a /datum/datanet_connection owned by us
 */
/datum/proc/datanet_on_socket_disconnect(datum/datanet_connection/connection, datum/datanet_socket/socket)
	return
