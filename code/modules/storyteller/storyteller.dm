//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

/**
 * Storyteller instance itself.
 * * Technically you can have multiple active. Given BYOND is single threaded,
 *   you probably shouldn't, though. Surely you don't have use for more than
 *   one?
 */
/datum/storyteller
	/// current persistent state
	var/datum/storyteller_narrative/narrative
	/// current round-local state
	var/datum/storyteller_state/state
	/// current active entities
	var/list/datum/storyteller_entity/entities
	/// current personality
	var/datum/storyteller_personality/personality


#warn impl
