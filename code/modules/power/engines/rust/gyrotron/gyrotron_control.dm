// todo: gyrotrons shouldn't be part of the rust module
/obj/machinery/computer/gyrotron_control
	name = "gyrotron control console"
	icon = 'icons/obj/machines/power/fusion.dmi'
	icon_state = "engine"
	light_color = COLOR_BLUE
	circuit = /obj/item/circuitboard/gyrotron_control

	var/id_tag
	var/scan_range = 25

/obj/machinery/computer/gyrotron_control/attack_ai(var/mob/user)
	attack_hand(user)

/obj/machinery/computer/gyrotron_control/attack_hand(mob/user, datum/event_args/actor/clickchain/e_args)
	add_fingerprint(user)
	interact(user)

/obj/machinery/computer/gyrotron_control/interact(var/mob/user)

	if(machine_stat & (BROKEN|NOPOWER))
		user.unset_machine()
		user << browse(null, "window=gyrotron_controller_[id_tag]")
		return

	if(!id_tag)
		to_chat(user, "<span class='warning'>This console has not been assigned an ident tag. Please contact your system administrator or conduct a manual update with a standard multitool.</span>")
		return

	var/dat = "<td><b>Gyrotron controller #[id_tag]</b>"

	dat = "<table><tr>"
	dat += "<td><b>Mode</b></td>"
	dat += "<td><b>Fire Delay</b></td>"
	dat += "<td><b>Power</b></td>"
	dat += "</tr>"

	for(var/obj/machinery/power/emitter/gyrotron/G in gyrotrons)
		if(!G || G.id_tag != id_tag || get_dist(src, G) > scan_range)
			continue

		dat += "<tr>"
		if(G.state != 2 || (G.machine_stat & (NOPOWER | BROKEN))) //Error data not found.
			dat += "<td><span style='color: red'>ERROR</span></td>"
			dat += "<td><span style='color: red'>ERROR</span></td>"
			dat += "<td><span style='color: red'>ERROR</span></td>"
		else
			dat += "<td><a href='?src=\ref[src];machine=\ref[G];toggle=1'>[G.active  ? "Emitting" : "Standing By"]</a></td>"
			dat += "<td><a href='?src=\ref[src];machine=\ref[G];modifyrate=1'>[G.rate]</a></td>"
			dat += "<td><a href='?src=\ref[src];machine=\ref[G];modifypower=1'>[G.mega_energy]</a></td>"

	dat += "</tr></table>"

	var/datum/browser/popup = new(user, "gyrotron_controller_[id_tag]", "Gyrotron Remote Control Console", 500, 400, src)
	popup.set_content(dat)
	popup.open()
	add_fingerprint(user)
	user.set_machine(src)

/obj/machinery/computer/gyrotron_control/Topic(href, list/href_list)
	. = ..()
	if(.)
		return

	if(machine_stat & (NOPOWER | BROKEN))
		return

	var/obj/machinery/power/emitter/gyrotron/G = locate(href_list["machine"])
	if(!G || G.id_tag != id_tag || get_dist(src, G) > scan_range)
		return

	if(href_list["modifypower"])
		var/new_val = input("Enter new emission power level (1 - 50)", "Modifying power level", G.mega_energy) as num
		if(!new_val)
			to_chat(usr, "<span class='warning'>That's not a valid number.</span>")
			return 1
		G.mega_energy = clamp(new_val, 1, 50)
		G.active_power_usage = G.mega_energy * 1500
		updateUsrDialog()
		return 1

	if(href_list["modifyrate"])
		var/new_val = input("Enter new emission delay between 1 and 10 seconds.", "Modifying emission rate", G.rate) as num
		if(!new_val)
			to_chat(usr, "<span class='warning'>That's not a valid number.</span>")
			return 1
		G.rate = clamp(new_val, 1, 10)
		updateUsrDialog()
		return 1

	if(href_list["toggle"])
		G.activate(usr)
		updateUsrDialog()
		return 1

	return 0

/obj/machinery/computer/gyrotron_control/attackby(var/obj/item/W, var/mob/user)
	..()
	if(istype(W, /obj/item/multitool))
		var/new_ident = input("Enter a new ident tag.", "Gyrotron Control", id_tag) as null|text
		if(new_ident && user.Adjacent(src))
			id_tag = new_ident
		return

/obj/machinery/computer/gyrotron_control/update_icon()
	if(machine_stat & (BROKEN))
		icon = 'icons/obj/computer.dmi'
		icon_state = "broken"
		set_light(0)

	if(machine_stat & (NOPOWER))
		icon = 'icons/obj/computer.dmi'
		icon_state = "computer"
		set_light(0)

	if(!(machine_stat & (BROKEN|NOPOWER)))
		icon = initial(icon)
		icon_state = initial(icon_state)
		set_light(light_range_on, light_power_on)
