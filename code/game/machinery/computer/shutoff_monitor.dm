/obj/machinery/computer/shutoff_monitor
	name = "automated shutoff valve monitor"
	desc = "Console used to remotely monitor shutoff valves on the station."
	icon_keyboard = "power_key"
	icon_screen = "power_monitor"
	light_color = "#a97faa"
	circuit = /obj/item/circuitboard/shutoff_monitor
	var/datum/tgui_module/shutoff_monitor/monitor

/obj/machinery/computer/shutoff_monitor/attack_hand(var/mob/user)
	..()
	monitor = new(src)

/obj/machinery/computer/shutoff_monitor/attack_robot(var/mob/user) // Borgs and AI will want to see this too
	..()

/obj/machinery/computer/shutoff_monitor/attack_hand(var/mob/user as mob)
	..()
	monitor.ui_interact(user)

/obj/machinery/computer/shutoff_monitor/update_icon()
	..()
	if(!(stat & (NOPOWER|BROKEN)))
		add_overlay("ai-fixer-empty")
	else
		cut_overlay("ai-fixer-empty")
