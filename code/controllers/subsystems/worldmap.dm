/**
 * Worldmap subsystem
 * Serves as the dynamic world's global datum - while the system can potentially serve multiple maps, there's no point to this as it would add overhead when we only need one.
 * Handles things for the dyanmic world single-plane virtualmap system
 * See code/modules/dynamic_world
 */
SUBSYSTEM_DEF(worldmap)
	name = "Dynamic World"
	flags = SS_NO_FIRE

// Most procs will be defined in code/modules/dynamic_world
