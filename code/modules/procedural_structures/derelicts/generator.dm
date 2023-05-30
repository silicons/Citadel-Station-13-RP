/**
 * puzzle-piece like generation system
 */
/obj/procedural_structure/derelict



	var/list/datum/derelict_fragment/fragments
	var/list/datum/derelict_expansion/sealed
	var/list/datum/derelict_expansion/closed
	var/list/datum/derelict_expansion/open
	var/list/datum/derelict_expansion/expanded

#warn impl all

/obj/procedural_structure/derelict/generate(turf/starting)
	start()



/obj/procedural_structure/derelict/proc/select(datum/derelict_expansion/for_expansion, list/datum/map_template/derelict_piece/pieces)
	RETURN_TYPE(/datum/derelict_fragment)

/obj/procedural_structure/derelict/proc/stage(datum/derelict_expansion/from_expansion, datum/map_template/derelict_piece/from_template)
	RETURN_TYPE(/datum/derelict_fragment)

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
