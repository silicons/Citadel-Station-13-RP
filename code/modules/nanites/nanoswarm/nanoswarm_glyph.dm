//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

// todo: /datum/prototype/nanoswarm_glyph
/datum/nanoswarm_gylph
	/// id - must be unique in and across rounds
	var/id
	/// icon id in tgfont
	///
	/// * for UI/UX reasons, this is enforced unique despite not needing it
	var/sprite

	//* chain behavior *//

	/// only one in a chain allowed
	var/chain_unique = FALSE

	//* glyph intrinsics *//

	/// this is a hardcoded glyph. it should not be used in randomization.
	var/hardcoded = FALSE

	//* glyph - hardcoded *//

	/// list of effect typepaths
	var/list/hardcoded_effects

	//* glyph - generated *//

#warn impl
