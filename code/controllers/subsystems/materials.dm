SUBSYSTEM_DEF(materials)
	name = "Materials"
	init_order = INIT_ORDER_MATERIALS

	/// ores by id
	var/static/list/datum/ore/ores_by_id = list()
	/// all ores
	var/static/list/dautm/ore/ores = list()

/datum/controller/subsystem/materials/Initialize()
	init_ores()
	return ..()

/datum/controller/subsystem/materials/proc/init_ores()
	for(var/path in subtypesof(/datum/ore))
		var/datum/ore/O = path
		if(O.abstract_type == path)
			continue
		O = new path

