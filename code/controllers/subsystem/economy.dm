//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2023 Citadel Station developers.          *//

/**
 * Doesn't do anything, just used for proc namespacing right now.
 *
 * Might hold economy accounts in the future if we get around to refactoring that
 * and decide it's the right move to do it via subsystem instead of something special
 * like game_faction / economy_faction's.
 */
SUBSYSTEM_DEF(economy)
	name = "Economy"
	subsystem_flags = SS_NO_INIT | SS_NO_FIRE
