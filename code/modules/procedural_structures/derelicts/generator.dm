/**
 * puzzle-piece like generation system
 */
/obj/procedural_structure/derelict

	/// total allowed cost
	var/target_cost = 200
	/// total allowed piees
	var/max_pieces = 50
	/// allowed fragment types for center
	var/derelict_center = DERELICT_FRAGMENT_ANY

	var/list/datum/derelict_fragment/fragments
	var/list/datum/derelict_expansion/sealed
	var/list/datum/derelict_expansion/closed
	var/list/datum/derelict_expansion/open
	var/list/datum/derelict_expansion/expanded

#warn impl all

/obj/procedural_structure/derelict/generate(turf/starting)
	// reset lists
	fragments = list()
	sealed = list()
	closed = list()
	open = list()
	expanded = list()

	// gather variables
	var/cost_remaining = target_cost
	var/pieces_remaining = max_pieces

	// gather templates
	var/list/datum/map_template/derelict_piece/pieces
	#warn impl
	#warn preload all sizes

	// pick some template for center, and see if it fits when centered
	var/datum/map_template/derelict_piece/starting_piece
	var/list/shuffled_pieces = shuffle(pieces)
	var/list/shuffled_dirs = shuffle(GLOB.cardinal)
	// define this outside so we can access
	var/dir
	var/ll_x
	var/ll_y
	var/ll_z
	for(var/datum/map_template/derelict_piece/piece as anything in pieces)
		ll_x = starting.x - piece.width >> 1
		ll_y = starting.y - piece.height >> 1
		ll_z = starting.z
		for(dir in shuffled_dirs)
			if(piece.physically_fits(dir, ll_x, ll_y, ll_z))
				starting_piece = piece
				break
		if(!isnull(starting_piece))
			break
	if(isnull(starting_piece))
		CRASH("failed to place starting piece")

	// make starting fragment
	cost_remaining -= starting_piece.cost
	pieces_remaining--
	var/datum/derelict_fragment/starting_fragment = new
	starting_fragment.template = starting_piece
	starting_fragment.x = ll_x
	starting_fragment.y = ll_y
	starting_fragment.z = ll_z
	starting_fragment.orientation = dir
	starting_fragment.priority = template.has_priority
	fragments += starting_fragment
	// add edges
	for(var/datum/derelict_connection/connection as anything in template.connections)
		open += connection.create_expansion(ll_x, ll_y, ll_z)

	// much like astar, we go through open nodes and process, one by one.
	for(var/datum/derelict_expansion/expansion as anything in open)
		#warn impl
	#warn impl rest

/obj/procedural_structure/derelict/load()
	for(var/datum/derelict_fragment/frag as anything in fragments)
		frag.realize()


/datum/derelict_fragment
	/// direct ref to template
	var/datum/map_template/derelict_piece/template
	/// lower left x
	var/x
	/// lower left y
	var/y
	/// lower left z
	var/z
	/// orientation - natural dir is SOUTH
	var/orientation
	/// priority? if one but not two are marked high priority, it'll take precedence and trample the other within its overlap.
	///           otherwise, it's random.
	var/priority

/datum/derelict_fragment/proc/realize()
	#warn instantiate

/datum/derelict_expansion
	/// x
	var/x
	/// y
	var/y
	/// z
	var/z
	/// size
	var/size
	/// size bias?
	var/size_bias
	/// outgoing dir
	var/dir
	/// what is this considered
	var/derelict_fragment
	/// what does this want
	var/derelict_connect
