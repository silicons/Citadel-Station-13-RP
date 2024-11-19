//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

/**
 * Holds a VR space.
 */
/datum/virtual_reality
	/// active residents
	///
	/// * lazy list
	var/list/datum/virtual_reality_resident/residents

#warn requires saycode rewrite for saycode handling

