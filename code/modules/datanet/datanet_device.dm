//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

/**
 * Terminal points for packets / sockets.
 *
 * * These do not handle routing. `/datum/datanet` handles that.
 * * These may not forward packets / sockets further through the main routing processing system; doing so would violate routing determinism.
 * * You may send packets back on receive, and craft new packets. Be careful to not start an infinite loop.
 * * This is basically the abstraction of a network card.
 */
/datum/datanet_device
	//* Binding *//

	/// bound /datum, if any
	var/datum/bound

	//* Identity *//

	/// device ID
	var/device_id
	/// device ID is important and should be registered to global list for lookups
	var/device_important = FALSE

	//* Network *//

	/// our datanet network
	var/datum/datanet/network

	//* Sockets *//

	/// active sockets with us as the source
	var/list/datum/datanet_frame/socket/active_outbound_sockets
	/// active sockets with us as the destination
	var/list/datum/datanet_frame/socket/active_inbound_sockets

/datum/datanet_device/New(datum/bind_to, use_id, important)
	if(!isnull(bind_to))
		src.bound = bind_to
	if(!isnull(use_id))
		src.device_id = use_id
	else
		src.device_id = SSdatanets.assign_next_device_id()
	if(!isnull(important))
		src.device_important = important

/datum/datanet_device/Destroy()
	bound = null
	#warn terminate sockets
	return ..()

//* Lazy API *//

/**
 * Sends a packet out. Does not block.
 */
/datum/datanet_device/proc/lazy_send_packet_async(
	target_connection_id,
	datum/callback/on_finish,
)

/**
 * Sends a packet out. Blocks.
 */
/datum/datanet_device/proc/lazy_send_packet_sync(
	target_connection_id,
)

/**
 * Connects a socket. Does not block.
 */
/datum/datanet_device/proc/lazy_connect_socket_async(
	datum/callback/on_finish,
)

/**
 * Connects a socket. Blocks.
 */
/datum/datanet_device/proc/lazy_connect_socket_sync(

)

/**
 * Disconnects a socket. Does not block.
 */
/datum/datanet_device/proc/lazy_disconnect_socket(

)

#warn impl

//* Packet API *//

/**
 * Sends a packet out. Does not block.
 *
 * todo: timeout
 *
 * @params
 * * packet - outgoing packet
 * * on_finish - (optional) callback called with args (packet: /datum/datanet_frame/packet, result: DATANET_RESULT_* enum) appended on finish.
 */
/datum/datanet_device/proc/send_packet_async(datum/datanet_frame/packet/packet, datum/callback/on_finish)
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
/datum/datanet_device/proc/send_packet_sync(datum/datanet_frame/packet/packet)
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
 * * on_finish - (optional) callback called with args (packet: /datum/datanet_frame/packet, result: DATANET_RESULT_* enum) appended on finish.
 *
 * @return DATANET_RESULT_* from receiver / first point of route failure
 */
/datum/datanet_device/proc/send_packet(datum/datanet_frame/packet/packet, datum/callback/on_finish)
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
/datum/datanet_device/proc/route_packet(datum/datanet_frame/packet/packet)
	return DATANET_RESULT_UNSUPPORTED_ROUTE

/**
 * Called when we receive a packet.
 *
 * By default, will call datum-level hooks and use their return value if we don't have one.
 *
 * @return DATANET_RESULT_*
 */
/datum/datanet_device/proc/handle_packet(datum/datanet_frame/packet/packet)
	return bound?.datanet_on_packet_receive(src, packet) || DATANET_RESULT_UNHANDLED

//* Socket API *//

/**
 * Attempts to connect a socket.
 *
 * @return DATANET_RESULT_*
 */
/datum/datanet_device/proc/connect_socket_async(datum/datanet_frame/socket/socket, datum/callback/on_finish)
	SHOULD_NOT_OVERRIDE(TRUE)
	SHOULD_NOT_SLEEP(TRUE)

	ASYNC
		connect_socket(socket, on_finish)

/**
 * Attempts to connect a socket.
 *
 * @return DATANET_RESULT_*
 */
/datum/datanet_device/proc/connect_socket_sync(datum/datanet_frame/socket/socket)
	SHOULD_NOT_OVERRIDE(TRUE)
	return connect_socket(socket)

/**
 * ATtempts to connect a socket.
 *
 * @params
 * * packet - outgoing packet
 * * on_finish - (optional) callback called with args (packet: /datum/datanet_frame/packet, result: DATANET_RESULT_* enum) appended on finish.
 *
 * @return DATANET_RESULT_* from receiver / first point of route failure
 */
/datum/datanet_device/proc/connect_socket(datum/datanet_frame/packet/packet, datum/callback/on_finish)
	PROTECTED_PROC(TRUE)

	var/result = route_socket(packet)
	on_finish?.Invoke(packet, result)
	return result

/**
 * Kicks off the routing handling for a socket, and does the actual connection.
 *
 * * This may block.
 *
 * @return DATANET_RESULT_*
 */
/datum/datanet_device/proc/route_socket(datum/datanet_frame/packet/packet)
	return DATANET_RESULT_UNSUPPORTED_ROUTE

/**
 * Attempts to disconnect a connected socket.
 *
 * @return DATANET_RESULT_*
 */
/datum/datanet_device/proc/disconnect_socket(datum/datanet_frame/socket/socket)

/datum/datanet_device/proc/handle_socket(datum/datanet_frame/socket/socket)
	#warn impl


#warn impl




//* /datum level hooks *//

#warn hook below

/**
 * Called from a /datum/datanet_device owned by us
 *
 * @return DATANET_RESULT_*; datanet_device gets final say.
 */
/datum/proc/datanet_on_packet_receive(datum/datanet_device/connection, datum/datanet_frame/packet/packet)
	return

/**
 * Called from a /datum/datanet_device owned by us
 */
/datum/proc/datanet_on_socket_connect(datum/datanet_device/connection, datum/datanet_frame/socket/socket)
	return

/**
 * Called from a /datum/datanet_device owned by us
 */
/datum/proc/datanet_on_socket_disconnect(datum/datanet_device/connection, datum/datanet_frame/socket/socket)
	return
