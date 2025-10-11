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
	/// last energy dispersal time
	var/energy_dispersal_last = 0

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

/obj/machinery/power/grounding_rod/tesla_act_new(datum/event_args/tesla_zap/zap_struct)
	if(!zap_struct.energy)
		return null
	return zap_struct
	#warn impl and if panel open and if person got caught in it
	// 	flick("grounding_rodhit", src)

/obj/machinery/power/grounding_rod/proc/update_stored_energy()
	var/elapsed = max(0, world.time - energy_dispersal_last) * 0.1
	energy_dispersal_last = world.time
	stored_energy = max(0, stored_energy - elapsed * energy_dispersal_rate)

/obj/machinery/power/grounding_rod/secured
	anchored = TRUE
