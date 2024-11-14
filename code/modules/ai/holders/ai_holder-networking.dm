//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

/datum/ai_holder
	/// the network we're in
	var/datum/ai_network/network
	/// if TRUE, we can receive things like requests for help.
	var/network_respond = FALSE
	/// if TRUE, we can send requests for help
	var/network_request = FALSE
	/// if TRUE, we will use things like networked knowledge of who's good / bad
	var/network_knowledge = TRUE
	/// if TRUE, we will fight cooperatively with the network with other holders
	/// engaging the same targets we are.
	var/network_combat = TRUE

/datum/ai_holder/proc/join_network(datum/ai_network/joining, initial_member, defer_network_updates)
	SHOULD_NOT_OVERRIDE(TRUE)
	ASSERT(joining)
	if(network)
		if(network == joining)
			return
		leave_network()
	network = joining
	network.members += src
	network.on_join(src, initial_member, defer_network_updates)
	on_network_join(network, initial_member)

/datum/ai_holder/proc/leave_network()
	SHOULD_NOT_OVERRIDE(TRUE)
	ASSERT(network)
	var/datum/ai_network/old = network
	network = null
	old.members -= src
	on_network_leave(old)
	old.on_leave(src)

/datum/ai_holder/proc/on_network_join(datum/ai_network/network, initial_member)
	return

/datum/ai_holder/proc/on_network_leave(datum/ai_network/network)
	return
