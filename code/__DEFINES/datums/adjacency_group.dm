//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

/**
 * only works for /atom/movable
 *
 * * You don't have to use this. If your atom is performance-critical (being created/destroyed/moved
 *   more than a few times a minute), do not use this. Use your own code.
 * * If you need multiple adjacency groups, especially if your atom moves or gets created or destroyed
 *   a lot, consider using your own bindings. This has overhead.
 */
#define MOVABLE_WITH_ADJACENCY_GROUP(TYPEPATH, VARNAME, GROUPKEY) \
##TYPEPATH { \
	var/datum/adjacency_group_holder/##VARNAME; \
} \
##TYPEPATH/Initialize(mapload, ...) { \
	##VARNAME = new /datum/adjacency_group_holder(src, GROUPKEY); \
} \
##TYPEPATH/Destroy() { \
	QDEL_NULL(##VARNAME); \
	return ..(); \
 \}
##TYPEPATH/Moved(atom/old_loc, ...) { \
	##VARNAME?.on_parent_move(old_loc); \
} \
##TYPEPATH

