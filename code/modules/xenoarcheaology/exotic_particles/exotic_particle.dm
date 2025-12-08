//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

/datum/prototype/exotic_particle
	/// real name; players shouldn't see this
	var/name = "exotic particle"

	/// traits; set to list of paths / anonymous types to init.
	/// * key is registered_type, value is the actual trait
	/// * values will always be the type of their registered type key.
	var/list/traits

#warn impl
