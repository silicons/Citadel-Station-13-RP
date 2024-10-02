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
 *
 * ## Current Implementation
 *
 * * Have everything be datumized.
 * * Allow melee swings to register to movement for an amount of time, so
 *   if the user moves we continue the swing.
 * * Have standard hooks and handlers, that can be overridden or skipped.
 * * Have a standard handler for 'perform a hit'.
 */
/datum/melee_swing

/**
 * Emit audiovisual effects, including the visual effects.
 *
 * @params
 * * blackboard - blackboard data from a swing cycle
 * * attacker - the thing doing the hit; this is separate from clickchain because non-mobs can use melee swings.
 * * clickchain - (optional) the clickchain data of who's doing the hit, who's initiating the swing, and the related params.
 * * hit_atoms - everything that was hit.
 */
/datum/melee_swing/proc/perform_audiovisual(list/blackboard, atom/attacker. datum/event_args/actor/clickchain/clickchain, list/atom/hit_atoms)
	#warn default audiovisuals

/**
 * Get hit objects from a given performer, angular target, and target atom.
 *
 * * Ordering does matter. If a swing should only hit one thing, the first object returned becomes that one thing.
 *
 * @params
 * * blackboard - blackboard data from a swing cycle
 * * attacker - the thing performing the melee swing. usually, but not always, a /mob.
 * * angle - the swing angle. use the angle from performer to target if you don't have click params.
 * * target - the originally clicked / targeted atom.
 */
/datum/melee_swing/proc/perform_scan(list/blackboard, atom/attacker, angle, atom/target)
	RETURN_TYPE(/list)
	return list()

/**
 * Perform a single hit against something.
 *
 * @params
 * * blackboard - blackboard data from a swing cycle
 * * attacker - the thing doing the hit; this is separate from clickchain because non-mobs can use melee swings.
 * * clickchain - (optional) the clickchain data of who's doing the hit, who's initiating the swing, and the related params.
 * * target - the thing to hit
 */
/datum/melee_swing/proc/perform_hit(list/blackboard, atom/attacker, datum/event_args/actor/clickchain/clickchain, atom/target)
	return
