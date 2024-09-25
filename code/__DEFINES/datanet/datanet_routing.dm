//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

/**
 * Common things for datanet system route resolution
 */

//* route_domain's *//

/// target is in world plane, somewhere
///
/// * route_specifier is the map struct / overmap entity ID
#define DATANET_ROUTE_SPECIFIER_WORLD "world"
/// a generic 'handle this manually please' specifier
///
/// * use this for lazy connections that use datanet API but do their own handling
/// * route_specifier is whatever you want!
#define DATANET_ROUTE_SPECIFIER_SPECIAL "special"

//*        datanet_result's       *//
//* these must be a truthy value! *//

/// datanet connection couldn't handle the packet / socket's requested route
#define DATANET_RESULT_UNSUPPORTED_ROUTE 1
/// datanet connection could route the packet / socket's requested route, but the destination could not be resolved
///
/// * routers cannot interfere with routing graphs; a firewall / blacklist / masquarade situation will always result in an ACKNOWLEDGED or FIREWALLEd return instead
#define DATANET_RESULT_NO_ROUTE 2
/// target (or someone pretending to be target) received it
///
/// * for broadcast packets, this means the broadcast was acknowledged; the actual broadcast does not necessarily have to occur
#define DATANET_RESULT_ACKNOWLEDGED 3
/// blocked by mid-way router
///
/// * routers can also choose to null-sink it and pretend to acknowledge.
#define DATANET_RESULT_FIREWALLED 4
/// receiver doesn't know what to do with this
///
/// * generally never sent for broadcasted
#define DATANET_RESULT_UNHANDLED 5

//* datanet routing path things *//

/// maximum datanet depth of non-abstracted networks
///
/// * abstract network depths can be anywhere from 0 to negative numbers
/// * example: 'overmaps / world plane' supernetwork is depth 0
#define DATANET_ROUTING_MAXIMUM_DEPTH 4
/**
 * bit length allowed for a given network depth
 *
 * * 24 bit total (I hate this engine, when do I get real bitfields??)
 * * 10 bits - Overmap Entity: 1024 possible addressable overmap entities / map_struct's.
 *   Non-overmaps maps are by-struct.
 * * 4 bits - Overmap Connection / Station Network: 16 possible 'long range transreceivers'
 *   per overmap entity / struct reserved for station networks
 * * 6 bits - Division: 64 possible networks per long range connection.
 * * 3 bits - Subnet: 8 possible networks per department network
 */
GLOBAL_REAL_LIST(datanet_routing_addressing_widths) = list(
	2 ** 10,
	2 ** 4,
	2 ** 6,
	2 ** 3,
)
