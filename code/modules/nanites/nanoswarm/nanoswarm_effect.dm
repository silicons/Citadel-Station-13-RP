//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

/datum/nanoswarm_effect
	/// 

#warn impl

/**
 * data reducer
 *
 * * the first call to this will have 'list()' for standing
 */
/datum/nanoswarm_effect/proc/data_reducer(list/standing, next)

/**
 * reapply variables to ourselves
 */
/datum/nanoswarm_effect/proc/construct_self(list/data)

/**
 * inject flags into a chain
 */
/datum/nanoswarm_effect/proc/apply_flags(datum/nanoswarm_chain/chain, list/data)
