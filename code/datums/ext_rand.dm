//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

/**
 * A wrapper around an external random number generator.
 *
 * * This is meant for seedable and deterministic uses of random number generation.
 * * This is currently a stubbed datum. This was made for procedural generation, but we're
 *   not currently equipped to be writing rust-based random generation. Yet.
 */
/datum/ext_rand

/**
 * creates a random number generator with a given seed
 *
 * * seed should be a string
 * * generally, the longer and more chaotic the seed, the better,
 *   but for the purposes of procedural generation we'll often just skip that.
 */
/datum/ext_rand/New(seed)
	ASSERT(istext(seed))

/**
 * Returns a random floating point value between 0 and 1.
 */
/datum/ext_rand/proc/next_float()
	// this is already above float precision
	return rand(0, 10 ** 8) * (10 ** 8)
