/datum/gbp_catalog
	/// items
	var/list/items = list()

/datum/gbp_catalog_item
	var/name = "???"
	var/category = "Unsorted"
	/// cost per item; this is cost per unit for stacks.
	var/cost = 10
	var/path = /obj/item/reagent_containers/food/snacks/pie
	var/stack = FALSE

/datum/gbp_catalog_item/New()
	stack = ispath(path, /obj/item/stack)

/datum/gbp_catalog_item/proc/instantiate(atom/where, amount)
	

#warn impl all
