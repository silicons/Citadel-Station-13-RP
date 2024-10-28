//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

/**
 * A descriptor for a single nanoswarm chain.
 */
/datum/nanoswarm_chain
	//* Instancing *//

	/// this is a global / shared copy and should never be mutated
	/// by things like user programming
	///
	/// * hard faults / corruption mechanics can still mutate it, but you
	///   absolutely need to know what you're doing!
	var/tmp/is_shared_copy = FALSE

	//* Compilation *//

	/// compiled effects
	///
	/// * should generally only be done if this is a shared copy.
	///   do not eagerly compile every edit; the system is designed
	///   to not require this.
	var/tmp/list/datum/nanoswarm_effect/compiled_effects
	/// compiled effect flags associated to data
	///
	/// * compiled effects are allowed to set these.
	/// * this is a lazy list
	var/tmp/list/compiled_flags

	//* Contents *//

	/// our orchestration pattern
	///
	/// * can be any string, as this is internally run through some dumb algorithm,
	///   but we prefer a "xxxx-xxxx" pattern
	var/orchestration_pattern
	/// list of glyphs by id
	///
	/// * this is ordered.
	var/list/glyph_ids
	/// latest glyph change was not compiled
	var/tmp/glyph_set_dirty = FALSE

#warn impl


/**
 * appends a glyph to end
 */
/datum/nanoswarm_chain/proc/append_glyph(datum/nanoswarm_gylph/glyph)

/**
 * inserts a glyph at a specific index
 *
 * @params
 * * at_index - where to insert. anything at this index will be pushed out by 1.
 */
/datum/nanoswarm_chain/proc/insert_glyph(datum/nanoswarm_gylph/glyph, at_index)

/**
 * cuts the glyph chain at a set of indices
 *
 * @params
 * * index - where to cut
 * * amount - how much to cut
 */
/datum/nanoswarm_chain/proc/cut_glyphs(index, amount)

/**
 * compile the chain
 */
/datum/nanoswarm_chain/proc/compile()
