/obj/machinery/power/grounding_rod
	name = "grounding rod"
	desc = "An industrial-scale grounding pylon. Attracts lightning and sinks it into whatever it is anchored to."
	#warn mov sprites
	icon = 'icons/obj/tesla_engine/tesla_coil.dmi'
	icon_state = "grounding_rod0"
	anchored = FALSE
	density = TRUE
	circuit = /obj/item/circuitboard/grounding_rod

	/// stored energy in kj
	var/stored_energy = 0
	/// max stored energy in kj
	var/stored_energy_capacity = 10000

	/// how much energy we can get rid of per second in kj
	var/energy_dispersal_rate = 1000

/obj/machinery/power/grounding_rod/update_icon()
	if(panel_open)
		icon_state = "grounding_rod_open[anchored]"
	else
		icon_state = "grounding_rod[anchored]"

/obj/machinery/power/grounding_rod/attackby(obj/item/W, mob/user)
	//if(default_deconstruction_screwdriver(user, "grounding_rod_open[anchored]", "grounding_rod[anchored]", W))
	if(default_deconstruction_screwdriver(user, W))
		return
	if(default_part_replacement(user, W))
		return
	if(default_unfasten_wrench(user, W))
		return
	if(default_deconstruction_crowbar(user, W))
		return
	return ..()


/obj/machinery/power/grounding_rod/tesla_act(var/power)
	if(anchored && !panel_open)
		flick("grounding_rodhit", src)
	else
		..()

/obj/machinery/power/grounding_rod/secured
	anchored = TRUE
