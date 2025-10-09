//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

/**
 * Storyteller instance itself.
 * * Technically multiple storytellers are supported but not used; there's no need as a single
 *   storyteller can operate across multiple overmaps.
 * * Storytellers can be controlled via admin panel, but should not be turned off. They are considered
 *   a core game component, as they orchestrate both offmap/planetary injections, as well as
 *   random events.
 * * Storyteller tracks active entities. The storyteller will always ignore admin-spawned offmap roles
 *   and events fired with the debug panel of the event controller.
 * * Likewise, developers should not override the storyteller's pipeline when spawning roles or firing events
 *   if at all possible. The Storyteller API allows forcing both of them; doing so allows the system
 *   to track danger levels properly.
 *
 * TODO: a way to move events/entities from one storyteller to another; we will likely not need this, though.
 */
/datum/storyteller
	/// current persistent state
	var/datum/storyteller_narrative/narrative
	/// current round-local state
	var/datum/storyteller_state/state
	/// current personality
	var/datum/storyteller_personality/personality

	/// current active entities
	/// * lazy list
	var/list/datum/storyteller_entity/entities
	/// current active events that are ongoing and belong to us
	/// * lazy list
	var/list/datum/event_new/active_events

	/// broadphase: overmaps left to iterate
	var/list/datum/overmap/bp_overmaps
	/// broadphase: overmap entities left to iterate
	var/list/obj/overmap/entity/bp_overmap_entities


/**
 * Executes an entity's instantiator and loads it into the game.
 * * You must drop all existing references to the entity once this is called. If you need a reference, get the return value.
 * * The entity will be tracked until destruction.
 * * The entity may not belong to another storyteller.
 * * The entity should not have already been instantiated.
 * @return /datum/storyteller_entity | null
 */
/datum/storyteller/proc/exec_entity(datum/storyteller_entity/entity)
	#warn call entity spawner

/**
 * Executes an event under the storyteller's control.
 * * You must drop all existing references to the event once this is called. If you need a reference, get the return value.
 * * The event MAY be tracked until destruction.
 * * The event may not already be started.
 * * The event may not belong to another storyteller.
 * @return /datum/event_new | null
 */
/datum/storyteller/proc/exec_event(datum/event_new/event)
	#warn is this a good idea? input event_meta maybe?

/**
 * @params
 * * dt - seconds between fires, nominal
 * * use_tick_limit - pause at this ticklimit
 * @return TRUE if finished, FALSE if pausing
 */
/datum/storyteller/proc/tick(dt, use_tick_limit)

#warn impl
