//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

/**
 * Common things for datanet system route resolution
 */

//* route_specifier's *//

/// default specifier
///
/// * datanet connection should attempt to route based on its connected networks
#define DATANET_ROUTE_SPECIFIER_DEFAULT "default"
/// a generic 'handle this manually please' specifier
///
/// * use this for lazy connections that use datanet API but do their own handling
#define DATANET_ROUTE_SPECIFIER_SPECIAL "special"

//* datanet_result's *//

/// datanet connection couldn't handle the packet / socket's requested route
#define DATANET_RESULT_UNSUPPORTED_ROUTE 0
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
