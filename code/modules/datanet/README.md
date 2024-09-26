# Datanet System

An experimental and efficient packet/socket simulation plane for the game.

## Concepts

- Packets - simulated data packets with arbitrary K-V fields.
- Sockets - simulated data sockets with arbitrary K-V fields.
- Packets & Sockets are both 'datanet routables', with one distinct source and one-or-many distinct destinations.

## Axioms

- Routing *should* be deterministic.
  - This means that routing must never, ever backtrack.
  - This means that people don't need to debug intermittent errors; it either works or it doesn't.
- Processing should be bounded time.
  - Avoid NTSL-like handling.

## This readme is bad.

Yeah, this readme is bad.

Uh.

Read the code comments honestly.
It's better documented than telecomms, but also a good bit more complicated.

## Packets

Packets are sent unidirectionally. On receive (or fail), a status value is returned.

- The returned enum is 'seen' by sender instantly and cannot be intercepted or prevented in any way.
- Packets can be filtered, mutated, and changed by networks and routing on its way; the returned enum is the only non-interferable field.
- Broadcast packets target a specific network and every device listening to its domain is instructed to process it if they have a registered listener.

## Sockets

Sockets indicate a point-to-point connection.

- Data is modifiable by source and target. Nothing in the way between should ever modify it.
- Flags are modifiable by anything touching the socket.
- Broadcast sockets target a specific network. Devices that wish to interact with them are able to register listeners, or poll for them.

## Warning

The networks system does not enforce "only one valid path per route" anymore.

This makes it a lot easier to break deterministic routing. If you're adding a new system,
make sure your system won't allow packets to be routed in more than one way in a given set of conditions.

- The networks system still has deterministic routing enforced, even with multiple valid paths.
- The biggest example is that overmaps transreceivers can be on a top-level network or a subnetwork of that, and while this creates two valid paths, packets & sockets will always use the semantically shortest route in number of hops, resulting in determinism.

## Encryption / Security

Datanet frame datums all have an encryption field used for simulation, but encryption is only to be simulated with networks as terminals, not devices.

- While the system fully supports simulation of end-to-end encryption, for balancing purposes, we do not allow this.
- Networks may have 'monitor keys' set to allow them to inspect packets / sockets that are otherwise encrypted with a key that is contained by its monitor keys.

## Routing

### Domains & Specifiers

Packets and networks all have routing domains & specifiers.

- If a packet's destination is the same domain and specifier as a network, it must never be required for the packet to be specially handled; all routing at that point should be within the datanet routing framework between networks on the same domain and specifier.
- If a packet's domain or specifier is not the same as the network, the packet will be handled by continually sending it **upstream** until a network **handles** the domain-specifier mismatch.
  - This usually involves either rejecting it, or sending it to another domain's networks on its way.
- Connections may specially handle a domain / specifier in its own frame-routing handler if it needs to.
  - This is useful for items that directly transmit to overmaps.

What this means:

- Overmaps transmissions are a domain / specifier tuple to a given entity.
- Inter-ship transmissions can use an overmaps transmitter on or upstream of a device's network.

### Networks & IDs

Packets / sockets **do not** actually need to always originate from a network, or have a destination in a network, or even both.

- Packets / sockets without a source network must be handled there and then by the connection.
  - The connection is responsible for checking if the packet / socket can be established in this case, as well as responding to issues and breaking the socket as needed if it's a socket.
- Packets without a destination network will be continually passed up the chain.
  - Networks on the way can decide what to do with it; this usually is done to allow a top-level network an attempt at routing it via a handler (e.g. long range communications array routing `DATANET_ROUTING_DOMAIN_WORLD_FACTION` + `"nanotrasen"` domain-specifier tuple for an emergency shuttle call)
  - If it reaches the top and isn't handled there, it's dropped.

### Routing Paths

Routing paths must be deterministic.

- Same domain-specifier: Packets are routed up to the smallest common bit-prefix, then routed down as needed.
- Different domain-specifier: Check above.

Routing paths are a list of strings.

Networks have their routing downstreams in a sorted list for quick access without string operations (binary search and bitmask check). 

### Packet Flow

A packet flowing through a network can be modified by the network.

- Packets originating from the network flow through it as the device emits it.
- Packets ending at a network flow through it right before reception by the device.

## Implications

### Wireless Devices Across Zlevels

Radios currently can connect to a parent ship if it's hovering in orbit / close enough.

On networks, there's only two ways for this to happen.

- The radio attempts to connect to the ship's network and can reach maintain a connection.
- The radio connects to another network, attempting to route to the ship's network (the one with the voice server it's trying to talk to) through this network.

Radios now would have a set of voice networks for its channels, and are joined to a network of choice to actually route to its voice networks.

## Radio Signalling

Broadcast packets / sockets are a TBD thing. We don't want to blast broadcast packets across recursively connected networks.

While memory-inefficient, the best way for radios to work with servers is for radios to **socket** every server they're connected to.

Servers then send packets to every radio socketed to it upon receiving a voice packet from a radio.

This has a cost, worst case, of around 0.5-1KB per active radio (56 bytes per assoc lookup across a worst-case 6 networks, the socket datum itself, 2 16 byte flat entries on the terminal nodes of the radio and the radio server, potentially 2 callbacks taking another 100-200 bytes).

This is only slightly worse than old comms.

- Similar things would happen for PDA signalling, modular computers, etc.
- This can all be alleviated by having devices smartly drop their sockets if they're not being worn.
- This can all be alleviated by making sockets cheaper.

## Cross-Level Radio Support

Relays wouldn't be a thing anymore.

Instead, ships have overmaps / long-range transreceivers.

Transreceivers can connect to all overmaps entities within range, as well as connect to buoy networks which artificially bridge overmap entities.

Radios on an exoplanet wouldn't use relays, they'd try to connect to a shuttle's network that's routing to the station via buoy.

## Downsides of domain-specifier routing for overmaps

- We can't have devices directly 'join' to the overmaps network without messing around with special domains/specifiers. It's not amazing overall.
- Domain-specifier tuple handling must be carefully ensured to be bidirectional.
