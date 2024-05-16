//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 silicons                             *//

/**
 * holder datum for clockwork attunement data
 *
 * var descriptions are written semi-ic to set the theme / intent
 * things are very carefully worded.
 *
 * entity = clockwork technology of some kind
 * actor = someone using or directing it
 * intended = **what the user wants to do**, not necessarily what it is supposed to do
 * non-negative = "it shot my friends but not me because it's non-negative towards me :D"
 */
/datum/clockwork_attunement
	/// natural attunement / how well the actor can mesh with entities
	/// * how unlikely it is that the actor will receive negative effects from an entity
	/// * how well the actor can naturally interface with entities (psionic connections, etc)
	///
	/// value is -INFINTIY to INFINITY
	/// values below / above -100 and 100 should not create additional effects / be cutoffs
	/// negative values are for when someone is violently opposed to clockwork entities (and vice versa)
	var/attunement = 0
	/// someone's knowledge of how to get entities to act the way they intend.
	/// * how likely it is that the actor will be able to coerce an entity into acting a certain way
	/// * how likely it is that the actor will understand what an entity is doing / telling them
	///
	/// value is -INFINITY to INFINITY
	/// values below / above -100 and 100 should not create additional effects / be cutoffs
	/// negative values are for when someone is even more belligerently unintelligible to clockwork entities (and vice versa)
	var/knowledge = 0
