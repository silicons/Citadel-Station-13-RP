/**
 * Pipes.
 *
 * Simple, 'vertex node' of the pipenet system.
 *
 * * Instant flow between connected pipes.
 * * Contains a little bit of buffer volume between components.
 * * Contains a single pipeline parent.
 */
/obj/machinery/atmospherics/pipe
	buckle_allowed = TRUE
	buckle_flags = BUCKLING_REQUIRES_RESTRAINTS
	buckle_lying = TRUE

	use_power = USE_POWER_OFF
	hides_underfloor_update_icon = TRUE
	hides_underfloor_defaulting = TRUE

	pipe_flags = NONE // Does not have PIPE_STATIC_FLAG_DEFAULT_LAYER_ONLY flag.

	#ifdef IN_MAP_EDITOR
	alpha = 128 // Set for the benefit of mapping.
	#endif

	/**
	 * Used when reconstructing a pipeline
	 *
	 * * For speed, this is potentially a cached mixture.
	 * * Do not under any circumstances mutate this gas mixture, only read from it.
	 */
	var/datum/gas_mixture/rebuild_air_immutable
	/**
	 * Our pipeline.
	 */
	var/datum/pipeline/pipeline
	/// Our volume, in liters.
	var/volume = ATMOS_DEFAULT_VOLUME_PIPE_PER_SIDE

/obj/machinery/atmospherics/pipe/Initialize(mapload, newdir)
	// pipes are always underfloor if inside a wall
	// we just check for loc.density 'cause speed lmao
	if(loc?.density && (hides_underfloor != OBJ_UNDERFLOOR_ALWAYS))
		hides_underfloor = OBJ_UNDERFLOOR_ALWAYS
	return ..()

/obj/machinery/atmospherics/pipe/examine(mob/user, dist)
	. = ..()
	. += SPAN_NOTICE("This one has a volume of [volume]L.")

// For pipes this is the same as pipeline_expansion()
/obj/machinery/atmospherics/pipe/get_neighbor_nodes_for_init()
	return pipeline_expansion()

/obj/machinery/atmospherics/pipe/Destroy()
	for(var/obj/machinery/meter/meter in loc)
		if(meter.target == src)
			var/obj/item/pipe_meter/PM = new /obj/item/pipe_meter(loc)
			meter.transfer_fingerprints_to(PM)
			qdel(meter)
	. = ..()

#warn vent air to turf on deconstruct, but not Destroy()

/obj/machinery/atmospherics/pipe/attackby(var/obj/item/W as obj, var/mob/user as mob)
	if (istype(src, /obj/machinery/atmospherics/pipe/tank))
		return ..()

	if(istype(W,/obj/item/pipe_painter))
		return 0

	if (!W.is_wrench())
		return ..()
	if (is_probably_hidden_underfloor())
		to_chat(user, "<span class='warning'>You must remove the plating first.</span>")
		return 1
	if(unsafe_pressure())
		to_chat(user, "<span class='warning'>You feel a gust of air blowing in your face as you try to unwrench [src]. Maybe you should reconsider..</span>")
	add_fingerprint(user)
	playsound(src, W.tool_sound, 50, 1)
	to_chat(user, "<span class='notice'>You begin to unfasten \the [src]...</span>")
	if (do_after(user, 40 * W.tool_speed))
		user.visible_message( \
			"<span class='notice'>\The [user] unfastens \the [src].</span>", \
			"<span class='notice'>You have unfastened \the [src].</span>", \
			"You hear a ratchet.")
		deconstruct()

/obj/machinery/atmospherics/pipe/proc/change_color(var/new_color)
	//only pass valid pipe colors please ~otherwise your pipe will turn invisible
	if(!pipe_color_check(new_color))
		return

	pipe_color = new_color
	update_icon()

/obj/machinery/atmospherics/pipe/color_cache_name(var/obj/machinery/atmospherics/node)
	if(istype(src, /obj/machinery/atmospherics/pipe/tank))
		return ..()

	if(istype(node, /obj/machinery/atmospherics/pipe/manifold) || istype(node, /obj/machinery/atmospherics/pipe/manifold4w))
		if(pipe_color == node.pipe_color)
			return node.pipe_color
		else
			return null
	else if(istype(node, /obj/machinery/atmospherics/pipe/simple))
		return node.pipe_color
	else
		return pipe_color

/obj/machinery/atmospherics/pipe/attack_ghost(mob/user)
	. = ..()
	if(user.client && user.client.inquisitive_ghost)
		analyze_gases_ghost(src, user)
	else
		to_chat(user, "<span class='warning'>[src] doesn't have a pipenet, which is probably a bug if this doesn't stop showing up in the next few seconds.</span>")

//*                  Init / Build - Abstraction                   *//

#warn impl

//*                  Connections - Abstraction                    *//

#warn impl
