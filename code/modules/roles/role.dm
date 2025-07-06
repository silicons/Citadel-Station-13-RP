/**
 * WIP
 * TODO: unified role system
 */
/datum/role
	abstract_type = /datum/role

	/// unique id
	var/id

	//* Characters *//

	/// Require faction tags
	/// TODO: impl
	var/list/require_faction_tags
	/// Disallow faction tags
	/// TODO: impl
	var/list/forbid_faction_tags

	/// Require background tags
	/// TODO: impl
	var/list/require_background_tags
	/// Disallow background tags
	/// TODO: impl
	var/list/forbid_background_tags

	/// Require species tags
	/// TODO: impl
	var/list/require_species_tags
	/// Disallow species tags
	/// TODO: impl
	var/list/forbid_species_tags
