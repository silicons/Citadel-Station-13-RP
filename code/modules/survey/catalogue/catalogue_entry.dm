/**
 * an individual catalog datapoint
 */
/datum/prototype/struct/catalogue_entry
	abstract_type = /datum/prototype/struct/catalogue_entry
	anonymous_namespace = "CatalogEntry"
	anonymous = TRUE

	/// our name
	var/name = "Unknown Entry"
	/// paragraph/whatever of what it is
	var/desc = "What is this?"

/datum/prototype/struct/catalogue_entry/serialize()
	. = ..()
	.["name"] = name
	.["desc"] = desc

/datum/prototype/struct/catalogue_entry/deserialize(list/data)
	. = ..()
	name = data["name"]
	desc = data["desc"]
