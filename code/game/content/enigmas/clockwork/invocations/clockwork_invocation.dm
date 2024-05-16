//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 silicons                             *//

/datum/clockwork_invocation
	/// the real name of the invocation
	var/name

	/// short description
	var/desc
	/// long explanation
	/// every string of the list will be rendered on a separate line
	var/list/explanation

	/// invocation chant repetition
	var/list/chant_repetition
	/// invocation chant finish
	var/list/chant_finish

	/// targeting hint bitfield
	/// this is binding / has function, unlike [effect_hint_flags]
	var/target_validity_flags = NONE
	/// effect hint bitfield
	var/effect_hint_flags = NONE
