//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

/**
 * ## Exotic Particles
 *
 * These embody a particular particle field that can be used to, well.
 * Do things.
 *
 * Description WIP.
 */
/datum/prototype/exotic_particle
	/// real name; players shouldn't see this
	var/name = "exotic particle"
	/// common name; if set, everyone knows it by this name
	/// * if unset, everyone gets to play discovery!
	/// * the use for this is that if it's super out-there we can set it but usually this is unset.
	/// * this is not used as any kind of primary key so collisions result in Immense trolling of the playerbase.alist
	/// * basically, **don't cause collisions.**
	var/common_name

	/// traits; set to list of paths / anonymous types to init.
	/// * key is registered_type, value is the actual trait
	/// * values will always be the type of their registered type key.
	var/list/traits

	/// our THEME...
	var/datum/prototype/exotic_particle_theme/theme



#warn impl
