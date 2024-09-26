//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

/**
 * Fast, overengineered, little-compromises swing combat system.
 *
 * ## Major Problems To Solve
 *
 * These are the general challenges with swing combat in BYOND.
 *
 * * Resolving where someone should be hitting in regards to the direction they clicked,
 *   not the direction of the clicked target from their character.
 * * Dealing with the inherent latency of mouse commands; input is not processed with a
 *   deterministic ordering between movement and mouse clicks.
 * * Still allowing specific-target swings / 'careful mode' being supported.
 * * Having reasonable tracking when someone's close-by, as swing combat targeting
 *   click direction can disrupt fast-paced melee engagements with two moving
 *   targets.
 * * Even for non-cleaving attacks, being able to resolve who to hit; the whole
 *   point of swing combat is limit pixel hunting, and that doesn't work if being one
 *   pixel off results in you hitting a tile someone can't possibly be on.
 * * In chases, movement ticks can be punishing due to tick order. We have to ensure
 *   that two targets chasing one another won't result in weird situations where
 *   one's movement / click processes in a way that lets them hit while the other doesn't.
 */
/datum/melee_swing

#warn impl

