/**
 * Standard atmospherics machinery.
 *
 * * Forms networks with other atmospherics machinery.
 * * A 'node' is defined as an adjacent atmospherics machinery connected to this.
 * * On a given type and all its subtypes, will obey a certain schema for 'indexing' of nodes.
 * * Indexing must obviously be deterministic.
 * * Indexing must identify an unique (layer, dir) tuple, and vice versa.
 * * Machinery can be on a number of layers.
 *   The standard pipe layer variable must be used if the machinery has layers.
 *   If a machine has more than one layer, and is not all layer, it must implement
 *   this behavior itself.
 * * Standard hinting and handling is provided for single-layer and all-layer machines.
 *   If a machine is more than one, but not all layers, across all its layers on all directions,
 *   it must implement this itself.
 * * By convention, single-layer-only machinery are on layer 3. This is not always the case,
 *   the implementor has the right to change this.
 * * By convention, all-layer machinery get set to layer 3. This however should not be relied on.
 */
/obj/machinery/atmospherics
	anchored = TRUE
	idle_power_usage = 0
	active_power_usage = 0
	power_channel = ENVIRON
	plane = TURF_PLANE
	layer = EXPOSED_PIPE_LAYER
	obj_flags = OBJ_ON_BLUEPRINTS | OBJ_MELEE_TARGETABLE
	// why block contents? so you ventcrawling little fucks don't pull a 2020 Citadel Main.
	rad_flags = RAD_BLOCK_CONTENTS | RAD_NO_CONTAMINATE
	atom_colouration_system = FALSE
	climb_allowed = FALSE
	depth_projected = FALSE
	hides_underfloor = OBJ_UNDERFLOOR_UNLESS_PLACED_ONTOP
	hides_underfloor_defaulting = FALSE

	//* Intrinsics *//
	/// The flags of the machine (pipe / component / other)
	///
	/// * This never changes at runtime.
	/// * This is used for non-proc-based behavior switching.
	var/pipe_static_flags = PIPE_STATIC_FLAG_DEFAULT_LAYER_ONLY
	/// The runtime flags for this machine (pipe / component / other)
	var/pipe_flags = PIPE_FLAG_REBUILD_QUEUED

	//* Directions *//

	//* Layer *//
	///What layer the pipe is in (from 1 to 5, default 3)
	var/piping_layer = PIPING_LAYER_DEFAULT

	//* Underfloor *//
	/// automatically update_underlays() during update_underfloor
	var/hides_underfloor_underlays = FALSE

	///The color of the pipe
	var/pipe_color
	///"-supply" or "-scrubbers"
	var/icon_connect_type = ""
	///The type path of the pipe item when this is deconstructed.
	var/construction_type = null
	///icon_state as a pipe item
	var/pipe_state
	///Bitflag of the initialized directions (NORTH | SOUTH | EAST | WEST)
	var/initialize_directions = 0

	var/global/datum/pipe_icon_manager/icon_manager

	var/last_flow_rate_legacy = 0
	var/last_power_draw_legacy = 0

/obj/machinery/atmospherics/Initialize(mapload, newdir)
	. = ..()
	if(!icon_manager)
		icon_manager = new()
	if(!isnull(newdir))
		setDir(newdir)
	if(!pipe_color)
		pipe_color = color
	color = null

	if(!pipe_color_check(pipe_color))
		pipe_color = null
	init_dir()

// This is used to set up what directions pipes will connect to.  Should be called inside New() and whenever a dir changes.
/obj/machinery/atmospherics/proc/init_dir()
	return

// Get ALL initialize_directions - Some types (HE pipes etc) combine two vars together for this.
/obj/machinery/atmospherics/proc/get_init_dirs()
	return initialize_directions

// Get the direction each node is facing to connect.
// It now returns as a list so it can be fetched nicely, each entry corresponds to node of same number.
/obj/machinery/atmospherics/proc/get_node_connect_dirs()
	return

// Initializes nodes by looking at neighboring atmospherics machinery to connect to.
// When we're being constructed at runtime, atmos_init() is called by the construction code.
// When dynamically loading a map atmos_init is called by the maploader (initTemplateBounds proc)
// But during initial world creation its called by the master_controller.
// TODO - Consolidate these different ways of being called once SSatoms is created.
/obj/machinery/atmospherics/proc/atmos_init()
	return

/** Check if target is an acceptable target to connect as a node from this machine. */
/obj/machinery/atmospherics/proc/can_be_node(obj/machinery/atmospherics/target, node_num)
	return (target.initialize_directions & get_dir(target,src)) && check_connectable(target) && target.check_connectable(src)

/** Check if this machine is willing to connect with the target machine. */
/obj/machinery/atmospherics/proc/check_connectable(obj/machinery/atmospherics/target)
	return (src.connect_types & target.connect_types)

/obj/machinery/atmospherics/attackby(obj/item/I, mob/living/user, list/params, clickchain_flags, damage_multiplier)
	if(istype(I, /obj/item/pipe_painter))
		return
	..()

/obj/machinery/atmospherics/proc/add_underlay(var/turf/T, var/obj/machinery/atmospherics/node, var/direction, var/icon_connect_type)
	if(node)
		if(istype(node, /obj/machinery/atmospherics/pipe) && (node.hides_underfloor == OBJ_UNDERFLOOR_ALWAYS) && T.hides_underfloor_objects())
			//underlays += icon_manager.get_atmos_icon("underlay_down", direction, color_cache_name(node))
			underlays += icon_manager.get_atmos_icon("underlay", direction, color_cache_name(node), "down" + icon_connect_type)
		else
			//underlays += icon_manager.get_atmos_icon("underlay_intact", direction, color_cache_name(node))
			underlays += icon_manager.get_atmos_icon("underlay", direction, color_cache_name(node), "intact" + icon_connect_type)
	else
		//underlays += icon_manager.get_atmos_icon("underlay_exposed", direction, pipe_color)
		underlays += icon_manager.get_atmos_icon("underlay", direction, color_cache_name(node), "exposed" + icon_connect_type)

/obj/machinery/atmospherics/proc/update_underlays()
	if(check_icon_cache())
		return 1
	else
		return 0

/obj/machinery/atmospherics/proc/check_icon_cache(var/safety = 0)
	if(!istype(icon_manager))
		if(!safety) //to prevent infinite loops
			icon_manager = new()
			check_icon_cache(1)
		return 0

	return 1

/obj/machinery/atmospherics/proc/color_cache_name(var/obj/machinery/atmospherics/node)
	//Don't use this for standard pipes
	if(!istype(node))
		return null

	return node.pipe_color

/obj/machinery/atmospherics/process(delta_time)
	last_flow_rate_legacy = 0
	last_power_draw_legacy = 0

	build_network()

/obj/machinery/atmospherics/proc/network_expand(datum/pipe_network/new_network, obj/machinery/atmospherics/pipe/reference)
	// Check to see if should be added to network. Add self if so and adjust variables appropriately.
	// Note don't forget to have neighbors look as well!

	return null

/obj/machinery/atmospherics/proc/build_network()
	// Called to build a network from this node

	return null

/obj/machinery/atmospherics/proc/return_network(obj/machinery/atmospherics/reference)
	// Returns pipe_network associated with connection to reference
	// Notes: should create network if necessary
	// Should never return null

	return null

/obj/machinery/atmospherics/proc/reassign_network(datum/pipe_network/old_network, datum/pipe_network/new_network)
	// Used when two pipe_networks are combining

/obj/machinery/atmospherics/proc/return_network_air(datum/pipe_network/reference)
	// Return a list of gas_mixture(s) in the object
	//		associated with reference pipe_network for use in rebuilding the networks gases list
	// Is permitted to return null

/obj/machinery/atmospherics/proc/disconnect(obj/machinery/atmospherics/reference)

/obj/machinery/atmospherics/proc/unsafe_pressure()
	var/datum/gas_mixture/int_air = return_air()
	var/datum/gas_mixture/env_air = loc.return_air()
	if((int_air.return_pressure()-env_air.return_pressure()) > 2*ONE_ATMOSPHERE)
		return TRUE
	return FALSE

// Deconstruct into a pipe item.
/obj/machinery/atmospherics/drop_products(method, atom/where)
	if(construction_type && !circuit)
		var/obj/item/pipe/I = new construction_type(loc, null, null, src)
		I.setPipingLayer(piping_layer)
		transfer_fingerprints_to(I)
		return
	return ..()

// Return a list of nodes which we should call atmos_init() and build_network() during on_construction()
/obj/machinery/atmospherics/proc/get_neighbor_nodes_for_init()
	return null

// Called on construction (i.e from pipe item) but not on initialization
/obj/machinery/atmospherics/proc/on_construction(obj_color, set_layer)
	pipe_color = obj_color
	setPipingLayer(set_layer)
	// TODO - M.connect_types = src.connect_types - Or otherwise copy from item? Or figure it out from piping layer?
	atmos_init()
	if(QDELETED(src))
		return // TODO - Eventually should get rid of the need for this.
	build_network()
	var/list/nodes = get_neighbor_nodes_for_init()
	for(var/obj/machinery/atmospherics/A in nodes)
		A.atmos_init()
		A.build_network()
	// TODO - Should we do src.build_network() before or after the nodes?
	// We've historically done before, but /tg does after. TODO research if there is a difference.

// This sets our piping layer.  Hopefully its cool.
/obj/machinery/atmospherics/proc/setPipingLayer(new_layer)
	if(pipe_flags & (PIPE_STATIC_FLAG_DEFAULT_LAYER_ONLY|PIPE_STATIC_FLAG_ALL_LAYER))
		new_layer = PIPING_LAYER_DEFAULT
	piping_layer = new_layer
	switch(piping_layer)
		if(PIPING_LAYER_SCRUBBER)
			icon_state = "[icon_state]-scrubbers"
			connect_types = CONNECT_TYPE_SCRUBBER
			layer = PIPES_SCRUBBER_LAYER
			icon_connect_type = "-scrubbers"
		if(PIPING_LAYER_SUPPLY)
			icon_state = "[icon_state]-supply"
			connect_types = CONNECT_TYPE_SUPPLY
			layer = PIPES_SUPPLY_LAYER
			icon_connect_type = "-supply"
		if(PIPING_LAYER_FUEL)
			icon_state = "[icon_state]-fuel"
			connect_types = CONNECT_TYPE_FUEL
			layer = PIPES_FUEL_LAYER
			icon_connect_type = "-fuel"
		if(PIPING_LAYER_AUX)
			icon_state = "[icon_state]-aux"
			connect_types = CONNECT_TYPE_AUX
			layer = PIPES_AUX_LAYER
			icon_connect_type = "-aux"
	if(pipe_flags & PIPE_STATIC_FLAG_ALL_LAYER)
		connect_types = CONNECT_TYPE_REGULAR|CONNECT_TYPE_SUPPLY|CONNECT_TYPE_SCRUBBER|CONNECT_TYPE_FUEL|CONNECT_TYPE_AUX
	// Or if we were to do it the TG way...
	// pixel_x = PIPE_PIXEL_OFFSET_X(piping_layer)
	// pixel_y = PIPE_PIXEL_OFFSET_Y(piping_layer)
	// layer = initial(layer) + PIPE_LAYER_OFFSET(piping_layer)

/obj/machinery/atmospherics/proc/get_standard_layer(underfloor)
	if(underfloor)
		switch(piping_layer)
			if(PIPING_LAYER_SCRUBBER)
				return PIPES_SCRUBBER_LAYER
			if(PIPING_LAYER_SUPPLY)
				return PIPES_SUPPLY_LAYER
			if(PIPING_LAYER_FUEL)
				return PIPES_FUEL_LAYER
			if(PIPING_LAYER_AUX)
				return PIPES_AUX_LAYER
			else
				return PIPE_LAYER
	else
		return EXPOSED_PIPE_LAYER

/obj/machinery/atmospherics/reset_plane_and_layer()
	set_plane(TURF_PLANE)
	set_base_layer(get_standard_layer())

/obj/machinery/atmospherics/update_hiding_underfloor(new_value)
	. = ..()
	if(!.)
		return
	reset_plane_and_layer()
	if(hides_underfloor_underlays)
		update_underlays()

/**
 * currently unimplemented
 * call when our internal settings change to push changes to relevant uis.
 */
/obj/machinery/atmospherics/proc/ui_settings_updated()
	// todo: implement

//*                          Init / Build                         *//

/**
 * Queues a rebuild.
 */
/obj/machinery/atmospherics/proc/queue_rebuild()
	if(pipe_flags & PIPE_FLAG_REBUILD_QUEUED)
		return
	if(QDESTROYING(src))
		return
	pipe_flags |= PIPE_FLAG_REBUILD_QUEUED
	#warn impl

/**
 * Performs a rebuild
 */
/obj/machinery/atmospherics/proc/trigger_rebuild()
	pipe_flags &= ~PIPE_FLAG_REBUILD_QUEUED
	// no longer necessary
	if(pipe_flags & PIPE_FLAG_NETWORK_JOINED)
		return
	build_network(TRUE)

//*                  Init / Build - Abstraction                   *//

/**
 * Abstraction proc.
 *
 * Preconditions:
 * * We are in a valid position.
 *
 * Here's what you **must** implement;
 *
 * * Detect and connect nodes, bidirectionally.
 * * create any pipelines; they'll automatically queue a pipenet build.
 *
 * Notes:
 * * 'destroying' is provided but it's almost never even remotely necessary to use it.
 *   Special behavior should not be in here; this proc is only for pipenet operations.
 *
 * @params
 * * rebuild - this is a queued rebuild
 */
/obj/machinery/atmospherics/proc/build_network(rebuild)
	SHOULD_CALL_PARENT(TRUE)
	pipe_flags |= PIPE_FLAG_NETWORK_JOINED


/**
 * Abstraction proc.
 *
 * Preconditions:
 * * We are still in a valid position.
 *
 * Here's what you **must** implement;
 *
 * * qdel() any pipelines.
 * * null out references to existing nodes, bidirectionally.
 *
 * Notes:
 * * 'destroying' is provided but it's almost never even remotely necessary to use it.
 *   Special behavior should not be in here; this proc is only for pipenet operations.
 * * Do not under any circumstances queue a rebuild here. This is not this proc's job.
 *
 * @params
 * * destroying - we're being deleted
 */
/obj/machinery/atmospherics/proc/dispose_network(destroying)
	SHOULD_CALL_PARENT(TRUE)
	pipe_flags &= ~PIPE_FLAG_NETWORK_JOINED

//*                  Connections - Abstraction                    *//
//* These must be overridden for new types with unique behaviors. *//

// dir+layer from index / node is not supported right now due to the lack of need.

/**
 * Can a specific machinery be our node?
 *
 * * This is position-sensitive; both machines must be in where they should be!
 * * This must be bidirectionally true. Do cheaper checks first so we bail quickly.
 */
/obj/machinery/atmospherics/proc/can_be_node(obj/machinery/atmospherics/target)
	#warn impl

#warn below

/**
 * Get node at index
 */
/obj/machinery/atmospherics/proc/get_node(index)
	CRASH("unimplemented proc")

/**
 * Set node at index
 *
 * * Should only set variable reference, don't do anything else.
 */
/obj/machinery/atmospherics/proc/set_node(obj/machinery/atmospherics/node, index)
	CRASH("unimplemented proc")

/**
 * Clear node references
 */

/**
 * Get index of a specific node.
 *
 * * Generally slow, avoid outside of necessity.
 */
/obj/machinery/atmospherics/proc/get_index_of_node(obj/machinery/atmospherics/node)
	CRASH("unimplemented proc")

/**
 * Get index of a specific direction and layer.
 */
/obj/machinery/atmospherics/proc/get_index(dir, layer)
	CRASH("unimplemented proc")

/**
 * Get an attached node on a specific index.
 */
/obj/machinery/atmospherics/proc/get_node_of_index(index)
	CRASH("unimplemented proc")

/**
 * Get an attached node of a specific direction and layer.
 */
/obj/machinery/atmospherics/proc/get_node(dir, layer)
	CRASH("unimplemented proc")

/**
 * Get connections from surroundings.
 *
 * * For speed, directly sets variables.
 */
/obj/machinery/atmospherics/proc/

/**
 * Gets indexed list of nodes.
 *
 * * Generally for debugging only. This is relatively inefficient and slow.
 */
/obj/machinery/atmospherics/proc/get_indexed_nodes()
	CRASH("unimplemented proc")

#warn above

/**
 * Checks if we're on a pipeline.
 *
 * * This is an extremely often called proc. Make it fast.
 * * This is a core abstraction proc. Make it as safe as possible.
 * * When in doubt, make it safer than it is fast.
 */
/obj/machinery/atmospherics/proc/is_in_pipeline(datum/pipeline/pipeline)
	CRASH("unimplemented proc")

/**
 * Destroy pipe networks. Unlike dispose_network(), this leaves pipelines alone.
 *
 * * Use this to queue network rebuilds when closing valves.
 * * While this works when opening valves, you want expand_pipe_networks() for that.
 */
/obj/machinery/atmospherics/proc/destroy_pipe_networks()
	CRASH("unimplemented proc")

/**
 * Cause pipe networks to try to expand. Unlike dispose_network(), this leaves pipelines alone.
 *
 * * Use this to queue network rebuilds when opening valves.
 * * Do not use this when closing valves. You want destroy_pipe_networks() for that.
 */
/obj/machinery/atmospherics/proc/expand_pipe_networks()
	CRASH("unimplemented proc")

/**
 * get list of things to expand a pipeline to
 *
 * * these are direct, superconducting joints. gas flows across to these instantly.
 * * pipelines form across to these from this machine.
 *
 * What you should do in this;
 *
 * * inject your edge air for that pipeline into edge_airs if you have one
 * * null out your air_temporary if you're a pipe / similar after you return it.
 * * blindly inject all connected nodes into 'next'. the pipeline side will check it already.
 *
 * As an example, you should be doing this.
 *
 * ```
 * . = air_temporary
 * air_temporary = null
 * ```
 *
 * Do not qdel() the air temporary / returned value. You should have only had one reference to it
 * anyways; the pipeline takes over processing from there.
 *
 * What you should not do in this;
 *
 * * manually check if you're already in the pipeline. you did override is_in_pipeline(), right?
 *   the pipeline will call that on this machine to check for you.
 * * touch border_members on the pipeline
 * * touch any *_members on the pipeline.
 * * touch literally any variable on the pipeline manually
 *
 * @params
 * * source - the machine the expansion is coming from.
 * * pipeline - the pipeline being propagated
 * * airs - the edge airs list on the pipeline. you can inject into this if you have an edge air for it.
 * * next - the list to inject our nodes into.
 *
 * @return a /datum/gas_mixture to be assimilated into the pipeline.
 */
/obj/machinery/atmospherics/proc/pipeline_expansion(obj/machinery/atmospherics/source, datum/pipeline/pipeline, list/datum/gas_mixture/airs, list/obj/machinery/atmospherics/next)
	return

/**
 * Pipenet expansion; only called on border members.
 *
 * @params
 * * pipeline - the source pipeline that is expanding
 * * next - the list to inject pipelines into
 */
/obj/machinery/atmospherics/proc/pipenet_expansion(datum/pipeline/pipeline)
	return

//*                            Hooks                          *//

/obj/machinery/atmospherics/doMove(atom/dest)
	// we don't care about result, a failed move is still a sign to rebuild.
	dispose_network()
	. = ..()
	if(isturf(loc))
		queue_rebuild()

/obj/machinery/atmospherics/grid_move(grid_flags, turf/new_turf)
	dispose_network()
	..()

/obj/machinery/atmospherics/grid_after(grid_flags, rotation_angle, list/late_call_hooks)
	..()
	queue_rebuild()
