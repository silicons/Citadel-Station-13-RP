//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

/**
 * base type of overmap-binding machinery
 */
/obj/machinery/overmap
	/// reference to currently owning entity
	var/obj/overmap/entity/host_entity

/obj/machinery/overmap/Moved(atom/old_loc, direction, forced)
	. = ..()

/obj/machinery/overmap/proc/set_host_entity(obj/overmap/entity/entity)
	SHOULD_NOT_SLEEP(TRUE)
	SHOULD_NOT_OVERRIDE(TRUE)
	var/obj/overmap/entity/old_entity = src.host_entity
	src.host_entity = entity
	on_host_entity_changed(old_entity, entity)

/obj/machinery/overmap/proc/on_host_entity_changed(obj/overmap/entity/old_entity, obj/overmap/entity/new_entity)


#warn impl all
