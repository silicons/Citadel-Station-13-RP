/obj/item/integrated_circuit/time
	name = "time circuit"
	desc = "Now you can build your own clock!"
	complexity = 1
	inputs = list()
	outputs = list()
	category_text = "Time"

/obj/item/integrated_circuit/time/delay
	name = "two-sec delay circuit"
	desc = "This sends a pulse signal out after a delay, critical for ensuring proper control flow in a complex machine.  \
	This circuit is set to send a pulse after a delay of two seconds."
	icon_state = "delay-20"
	var/delay = 20
	activators = list("incoming"= IC_PINTYPE_PULSE_IN,"outgoing" = IC_PINTYPE_PULSE_OUT)
	spawn_flags = IC_SPAWN_DEFAULT|IC_SPAWN_RESEARCH
	power_draw_per_use = 2

/obj/item/integrated_circuit/time/delay/do_work()
	addtimer(CALLBACK(src, PROC_REF(activate_pin), 2), delay)

/obj/item/integrated_circuit/time/delay/five_sec
	name = "five-sec delay circuit"
	desc = "This sends a pulse signal out after a delay, critical for ensuring proper control flow in a complex machine.  \
	This circuit is set to send a pulse after a delay of five seconds."
	icon_state = "delay-50"
	delay = 50
	spawn_flags = IC_SPAWN_DEFAULT|IC_SPAWN_RESEARCH

/obj/item/integrated_circuit/time/delay/one_sec
	name = "one-sec delay circuit"
	desc = "This sends a pulse signal out after a delay, critical for ensuring proper control flow in a complex machine.  \
	This circuit is set to send a pulse after a delay of one second."
	icon_state = "delay-10"
	delay = 10
	spawn_flags = IC_SPAWN_DEFAULT|IC_SPAWN_RESEARCH

/obj/item/integrated_circuit/time/delay/half_sec
	name = "half-sec delay circuit"
	desc = "This sends a pulse signal out after a delay, critical for ensuring proper control flow in a complex machine.  \
	This circuit is set to send a pulse after a delay of half a second."
	icon_state = "delay-5"
	delay = 5
	spawn_flags = IC_SPAWN_DEFAULT|IC_SPAWN_RESEARCH

/obj/item/integrated_circuit/time/delay/tenth_sec
	name = "tenth-sec delay circuit"
	desc = "This sends a pulse signal out after a delay, critical for ensuring proper control flow in a complex machine.  \
	This circuit is set to send a pulse after a delay of 1/10th of a second."
	icon_state = "delay-1"
	delay = 1
	spawn_flags = IC_SPAWN_DEFAULT|IC_SPAWN_RESEARCH

/obj/item/integrated_circuit/time/delay/custom
	name = "custom delay circuit"
	desc = "This sends a pulse signal out after a delay defined in tenths of a second, critical for ensuring proper control \
	flow in a complex machine. This circuit's delay can be customized, between 1/10th of a second to one hour.  \
	The delay is updated upon receiving a pulse."
	extended_desc = "The delay is defined in tenths of a second. For instance, 4 will be a delay of 0.4 seconds, or 15 for 1.5 seconds."
	icon_state = "delay"
	inputs = list("delay time" = IC_PINTYPE_NUMBER)
	spawn_flags = IC_SPAWN_RESEARCH

/obj/item/integrated_circuit/time/delay/custom/do_work()
	var/delay_input = get_pin_data(IC_INPUT, 1)
	if(delay_input && isnum(delay_input) )
		var/new_delay = clamp(delay_input, 1, 1 HOUR)
		delay = new_delay

	..()


/obj/item/integrated_circuit/time/ticker
	name = "ticker circuit"
	desc = "This circuit sends an automatic pulse every four seconds."
	icon_state = "tick-m"
	complexity = 4
	var/delay = 4 SECONDS
	var/next_fire = 0
	var/is_running = FALSE
	inputs = list("enable ticking" = IC_PINTYPE_BOOLEAN)
	activators = list("outgoing pulse" = IC_PINTYPE_PULSE_OUT)
	spawn_flags = IC_SPAWN_RESEARCH
	power_draw_per_use = 4

/obj/item/integrated_circuit/time/ticker/Destroy()
	if(is_running)
		STOP_PROCESSING(SSprocess_5fps, src)
	return ..()

/obj/item/integrated_circuit/time/ticker/on_data_written()
	var/do_tick = get_pin_data(IC_INPUT, 1)
	if(do_tick && !is_running)
		is_running = TRUE
		tick()
	else if(!do_tick && is_running)
		is_running = FALSE


/obj/item/integrated_circuit/time/ticker/proc/tick()
	if(is_running)
		addtimer(CALLBACK(src, PROC_REF(tick)), delay)
		if(world.time > next_fire)
			next_fire = world.time + delay
			activate_pin(1)


/obj/item/integrated_circuit/time/ticker/custom
	name = "custom ticker"
	desc = "This advanced circuit sends an automatic pulse every given interval, defined in tenths of a second."
	extended_desc ="This advanced circuit sends an automatic pulse every given interval, defined in tenths of a second. \
	For example, setting the time pin to 4 will send a pulse every 0.4 seconds, or 15 for every 1.5 seconds."
	icon_state = "tick-f"
	complexity = 8
	delay = 2 SECONDS
	inputs = list("enable ticking" = IC_PINTYPE_BOOLEAN,"delay time" = IC_PINTYPE_NUMBER)
	spawn_flags = IC_SPAWN_RESEARCH
	power_draw_per_use = 8

/obj/item/integrated_circuit/time/ticker/custom/on_data_written()
	var/delay_input = get_pin_data(IC_INPUT, 2)
	if(delay_input && isnum(delay_input) )
		var/new_delay = clamp(delay_input ,1 ,1 HOURS)
		delay = new_delay
	..()

/obj/item/integrated_circuit/time/ticker/fast
	name = "fast ticker"
	desc = "This advanced circuit sends an automatic pulse every two seconds."
	icon_state = "tick-f"
	complexity = 6
	delay = 2 SECONDS
	spawn_flags = IC_SPAWN_RESEARCH
	power_draw_per_use = 8

/obj/item/integrated_circuit/time/ticker/slow
	name = "slow ticker"
	desc = "This simple circuit sends an automatic pulse every six seconds."
	icon_state = "tick-s"
	complexity = 2
	delay = 6 SECONDS
	spawn_flags = IC_SPAWN_DEFAULT|IC_SPAWN_RESEARCH
	power_draw_per_use = 2

/obj/item/integrated_circuit/time/clock
	name = "integrated clock"
	desc = "Tells you what the time is, in Nanotrasen Common Time.  It has a toggle \
	for calculating time relative to the start of your shift"
	icon_state = "clock"
	inputs = list("shift toggle" = IC_PINTYPE_BOOLEAN)
	outputs = list(
		"time" = IC_PINTYPE_STRING,
		"hours" = IC_PINTYPE_NUMBER,
		"minutes" = IC_PINTYPE_NUMBER,
		"seconds" = IC_PINTYPE_NUMBER,
		"date" = IC_PINTYPE_NUMBER
		)
	activators = list("get time" = IC_PINTYPE_PULSE_IN, "on time got" = IC_PINTYPE_PULSE_OUT)
	spawn_flags = IC_SPAWN_DEFAULT|IC_SPAWN_RESEARCH
	power_draw_per_use = 2

/obj/item/integrated_circuit/time/clock/do_work()
	if(get_pin_data(IC_INPUT, 1 == 0))
		set_pin_data(IC_OUTPUT, 1, time2text(station_time_in_ds, "hh:mm:ss") )
		set_pin_data(IC_OUTPUT, 2, text2num(time2text(station_time_in_ds, "hh") ) )
		set_pin_data(IC_OUTPUT, 3, text2num(time2text(station_time_in_ds, "mm") ) )
		set_pin_data(IC_OUTPUT, 4, text2num(time2text(station_time_in_ds, "ss") ) )
		set_pin_data(IC_OUTPUT, 5, stationdate2text())
	else
		set_pin_data(IC_OUTPUT, 1, time2text(round_duration_in_ds, "hh:mm:ss") )
		set_pin_data(IC_OUTPUT, 2, text2num(time2text(round_duration_in_ds, "hh") ) )
		set_pin_data(IC_OUTPUT, 3, text2num(time2text(round_duration_in_ds, "mm") ) )
		set_pin_data(IC_OUTPUT, 4, text2num(time2text(round_duration_in_ds, "ss") ) )
		set_pin_data(IC_OUTPUT, 5, stationdate2text())

	push_data()
	activate_pin(2)
