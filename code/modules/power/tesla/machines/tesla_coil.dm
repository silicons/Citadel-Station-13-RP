/obj/machinery/power/tesla_coil
	name = "tesla coil"
	desc = "An industrial-scale tesla coil. Can partially absorb energy bolts, providing power to a connected network. Overflow power is automatically sent back out to prevent damage."
	desc = "For the union!"
	#warn mov sprites
	icon = 'icons/obj/tesla_engine/tesla_coil.dmi'
	icon_state = "coil0"
	anchored = FALSE
	density = TRUE
	circuit = /obj/item/circuitboard/tesla_coil

	/// stored power, in kj
	var/stored_energy = 0

	/// % of bolt max power we will always be able to store.
	var/bolt_store_factor = 0.2
	/// kj we will be able to store, no matter what
	var/bolt_store_minimum = 1000
	/// % of power being stored we lose
	var/bolt_store_loss = 0.05

	/// passive capacitance in kj; we don't emit until we're over this, and will
	/// actually pull power to refill this
	var/passive_capacitance = 0
	/// power loss per tick of stored power as ratio
	var/passive_capacitance_loss = 0.01
	/// passive capacitance limit
	var/passive_capacitance_max = 2000
	/// passive capacitance refill ratio as factor of missing
	var/passive_capacitance_pull_ratio = 0.15


	#warn deal with these
	var/datum/wires/tesla_coil/wires = null

/obj/machinery/power/tesla_coil/Initialize(mapload)
	. = ..()
	wires = new(src)

/obj/machinery/power/tesla_coil/Destroy()
	QDEL_NULL(wires)
	return ..()

/obj/machinery/power/tesla_coil/RefreshParts()
	var/power_multiplier = 0
	zap_cooldown = 100
	for(var/obj/item/stock_parts/capacitor/C in component_parts)
		power_multiplier += C.rating
		zap_cooldown -= (C.rating * 20)
	input_power_multiplier = power_multiplier

/obj/machinery/power/tesla_coil/update_icon()
	if(panel_open)
		icon_state = "coil_open[anchored]"
	else
		icon_state = "coil[anchored]"

/obj/machinery/power/tesla_coil/attackby(obj/item/W, mob/user)
	src.add_fingerprint(user)

	//if(default_deconstruction_screwdriver(user, "coil_open[anchored]", "coil[anchored]", W))
	if(default_deconstruction_screwdriver(user, W))
		return
	if(default_part_replacement(user, W))
		return
	if(default_unfasten_wrench(user, W))
		return
	if(default_deconstruction_crowbar(user, W))
		return
	if(is_wire_tool(W))
		return wires.Interact(user)
	return ..()

/obj/machinery/power/tesla_coil/attack_hand(mob/user, datum/event_args/actor/clickchain/e_args)
	if(user.a_intent == INTENT_GRAB && user_buckle_mob(user.pulling, user))
		return
	..()

/obj/machinery/power/tesla_coil/tesla_act_new(datum/event_args/tesla_zap/zap_struct)
	#warn impl

	// if(anchored && !panel_open)
	// 	being_shocked = TRUE
	// 	//don't lose arc power when it's not connected to anything
	// 	//please place tesla coils all around the station to maximize effectiveness
	// 	var/power_produced = powernet ? power / power_loss : power
	// 	add_avail(power_produced * input_power_multiplier * 0.001)
	// 	flick("coilhit", src)
	// 	playsound(src.loc, 'sound/effects/lightningshock.ogg', 100, 1, extrarange = 5)
	// 	tesla_zap(src, 5, power_produced)
	// 	//addtimer(CALLBACK(src, PROC_REF(reset_shocked)), 10)
	// 	spawn(10) reset_shocked()
	// else
	// 	..()

/obj/machinery/power/tesla_coil/proc/zap()
	if((last_zap + zap_cooldown) > world.time || !powernet)
		return FALSE
	last_zap = world.time
	var/coeff = (20 - ((input_power_multiplier - 1) * 3))
	coeff = max(coeff, 10)
	// upconvert from KW to W
	var/power = (powernet.avail / 2) * 1000
	// downconvert from KW to W
	draw_power(power * 0.001)
	playsound(src.loc, 'sound/effects/lightningshock.ogg', 100, 1, extrarange = 5)
	tesla_zap(src, 10, power/(coeff/2))

/obj/machinery/power/tesla_coil/secured
	anchored = TRUE
