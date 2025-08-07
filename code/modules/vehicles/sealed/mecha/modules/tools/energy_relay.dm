/obj/item/vehicle_module/tesla_energy_relay
	name = "energy relay"
	desc = "Wirelessly drains energy from any available power channel in area. The performance index is quite low."
	icon_state = "tesla"
	origin_tech = list(TECH_MAGNET = 4, TECH_ILLEGAL = 2)
	equip_cooldown = 10
	energy_drain = 0
	range = 0
	var/coeff = 100
	var/list/use_channels = list(EQUIP,ENVIRON,LIGHT)

	equip_type = EQUIP_UTILITY

/obj/item/vehicle_module/tesla_energy_relay/Initialize(mapload)
	if(chassis)
		START_PROCESSING(SSobj, src)
	. = ..()

/obj/item/vehicle_module/tesla_energy_relay/Destroy()
	STOP_PROCESSING(SSobj, src)
	return ..()

/obj/item/vehicle_module/tesla_energy_relay/detach()
	STOP_PROCESSING(SSobj, src)
//	chassis.proc_res["dynusepower"] = null
	chassis.proc_res["dyngetcharge"] = null
	..()
	return

/obj/item/vehicle_module/tesla_energy_relay/attach(obj/vehicle/sealed/mecha/M)
	..()
	START_PROCESSING(SSobj, src)
	chassis.proc_res["dyngetcharge"] = src
//	chassis.proc_res["dynusepower"] = src
	return

/obj/item/vehicle_module/tesla_energy_relay/can_attach(obj/vehicle/sealed/mecha/M)
	if(..())
		if(!M.proc_res["dyngetcharge"])// && !M.proc_res["dynusepower"])
			return 1
	return 0

/obj/item/vehicle_module/tesla_energy_relay/proc/dyngetcharge()
	if(equip_ready) //disabled
		return chassis.dyngetcharge()
	var/area/A = get_area(chassis)
	var/pow_chan = get_power_channel(A)
	var/charge = 0
	if(pow_chan)
		charge = 1000 //making magic
	else
		return chassis.dyngetcharge()
	return charge

/obj/item/vehicle_module/tesla_energy_relay/proc/get_power_channel(var/area/A)
	var/pow_chan
	if(A)
		for(var/c in use_channels)
			if(A.powered(c))
				pow_chan = c
				break
	return pow_chan

/obj/item/vehicle_module/tesla_energy_relay/Topic(href, href_list)
	..()
	if(href_list["toggle_relay"])
		if(pr_energy_relay.toggle())
			set_ready_state(0)
			log_message("Activated.")
		else
			set_ready_state(1)
			log_message("Deactivated.")
	return

/obj/item/vehicle_module/tesla_energy_relay/get_equip_info()
	if(!chassis) return
	return "<span style=\"color:[equip_ready?"#0f0":"#f00"];\">*</span>&nbsp;[src.name] - <a href='?src=\ref[src];toggle_relay=1'>[pr_energy_relay.active()?"Dea":"A"]ctivate</a>"

/obj/item/vehicle_module/tesla_energy_relay/process(delta_time)
	var/obj/item/vehicle_module/tesla_energy_relay/ER = src
	if(!ER.chassis || ER.chassis.hasInternalDamage(MECHA_INT_SHORT_CIRCUIT))
		ER.set_ready_state(1)
		return PROCESS_KILL
	var/cur_charge = ER.chassis.get_charge()
	if(isnull(cur_charge) || !ER.chassis.cell)
		ER.set_ready_state(1)
		ER.occupant_message("No powercell detected.")
		return PROCESS_KILL
	if(cur_charge<ER.chassis.cell.maxcharge)
		var/area/A = get_area(ER.chassis)
		if(A)
			var/pow_chan
			for(var/c in list(EQUIP,ENVIRON,LIGHT))
				if(A.powered(c))
					pow_chan = c
					break
			if(pow_chan)
				var/delta = min(12 * delta_time, ER.chassis.cell.maxcharge - cur_charge)
				ER.chassis.give_power(delta)
				A.use_power_oneoff(delta * ER.coeff, pow_chan)
