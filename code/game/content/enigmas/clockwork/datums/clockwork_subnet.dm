//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 silicons                             *//

/**
 * tracks a specific segment of the hierophant network
 * this is generally shared across the same planet/overmap entity/etc
 * it's possible for the whole of the game world to be only one
 *
 * this is so power systems can simulate subdivision / distance losses
 * it's assumed resouces like power are quantum-entangled on the same subnet
 *
 * across subnets, resolve procs are used to establish linkages
 */
/datum/clockwork_subnet
	/// stored power in kilojoules
	/// because we're not animals here and don't measure storage in watts you heathens
	///
	/// * you might run into precision issues if doing stuff with fractionals. try to have machines emitting multiples of 0.5 kj.
	var/stored_power


