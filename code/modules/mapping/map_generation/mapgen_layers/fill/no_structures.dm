//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

/**
 * Seal a block from structures.
 *
 * * Must be applied before structures to work.
 */
/datum/mapgen_layer/fill/no_structures
	name = "Block: No Structures"

/datum/mapgen_layer/fill/no_structures/draw(datum/mapgen_buffer/buffer)
	#warn impl

/**
 * Seal a block from structures, and obliterate any structures overlapping it.
 */
/datum/mapgen_layer/fill/no_structures/retroactive

/datum/mapgen_layer/fill/no_structures/retroactive/draw(datum/mapgen_buffer/buffer)
	..()
	#warn impl
