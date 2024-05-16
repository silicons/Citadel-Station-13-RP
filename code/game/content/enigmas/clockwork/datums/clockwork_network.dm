//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 silicons                             *//

GLOBAL_DATUM_INIT(clockwork_network, /datum/clockwork_network, new)

/**
 * the Hierophant Network
 *
 * while alignments are effectively factions, the Hierophant Network
 * is global, unique, and eternal.
 *
 * subnets are created as necessary
 *
 * this also serves as our global subsystme-like, because
 * enigmas aren't important enough for subsystems of their own generally.
 *
 * not to mention, as a science-fantasy based system, clockwork cult is
 * very physically grounded, meaning there shouldn't be much 'global magical modifiers'
 * applied to the round that affects behavior.
 *
 * this means that state should be able to be rebuilt from just the entities on the game board,
 * including the players, as opposed to requiring global state.
 */
/datum/clockwork_network

/datum/clockwork_network/proc/subnet_for_level_index(z)
	RETURN_TYPE(/datum/clockwork_subnet)
	#warn impl

/**
 * call when zlevels swap around
 *
 * everything on the zlevel will slowly try to go to whatever new subnet is on it
 */
/datum/clockwork_network/proc/invalidate_subnets_for_level(z)
	#warn impl
