//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 silicons                             *//

/**
 * holder datum for clockwork data on /mind and others
 *
 * represents a mind's attunation to clockwork systems
 */
/datum/clockwork_memory
	/// our attunement data
	var/datum/clockwork_attunement/attunement = new
	/// our knowledge data
	var/datum/clockwork_knowledge/knowledge = new

/datum/clockwork_memory/serialize()
	. = ..()
	.["attunement"] = attunement.serialize()
	.["knowledge"] = knowledge.serialize()

/datum/clockwork_memory/deserialize(list/data)
	..()
	if(islist(data["attunement"]))
		attunement.deserialize(data["attunement"])
	if(islist(data["knowledge"]))
		attunement.deserialize(data["knowledge"])
