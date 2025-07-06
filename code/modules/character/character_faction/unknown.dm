//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

/**
 * A special unset faction when we can't resolve a faction.
 * * People in this can join any role, which fixes their
 *   faction to something in that role permanently. Or something
 *   like that, I guess.
 */
/datum/prototype/character_faction/unknown
	id = "unknown"
	name = "Unknown"
	blurb = "Your faction isn't set as you're a grandfathered-in character. \
	Either that, or for whatever reason the game couldn't find what faction \
	you are. You can join any role by binding the character to that role; \
	once you do so, however, the character is affixed to said role."
