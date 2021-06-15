SUBSYSTEM_DEF(lore)
	name = "Lore"
	flags = SS_NO_FIRE

/datum/controller/subsystem/lore/Initialize()
	instantiate_lore_entries()
	return ..()

