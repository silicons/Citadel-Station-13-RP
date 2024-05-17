//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 silicons                             *//

// todo: it should work on planets if exposed to sun.
// todo: don't let people cluster this too closely together
// todo: or better yet, penalize it with a reasonable algorithm to promote fun designs instead of forcing boring grids
// todo: instead of processing all of these, these should provide 'static' power area-machine style, and the network should tick it.
CLOCKWORK_DESCRIPTION( \
	/obj/machinery/clockwork/stargazer, \
	"stargazer", \
	"A power collector for the Hierophant Network. Needs to be close to space, or exposed to direct <b>star</b>light, to work." \
)
/obj/machinery/clockwork/stargazer
	name = "solar lantern"
	desc = "A tall device made out of brass. It emits a soft, soothing hum."
	#warn sprite + -active state

	/// active?
	var/active = FALSE

	/// time until we reconsider our LoS again
	var/reconsider_starlight_at_time

	/// glow color when on
	var/active_glow_color = "#ccaa00"
	/// glow range when on
	var/active_glow_range = 3
	/// glow power when on_standalone
	var/active_glow_power = 0.35

	/// LoS distance range
	var/collection_radius = 3

	/// base power generation in kilowatts
	var/power_generation = 5

/obj/machinery/clockwork/stargazer/Initialize(mapload)
	reconsider_starlight_at_time = world.time + rand(5 SECONDS, 15 SECONDS)
	return ..()

/obj/machinery/clockwork/stargazer/update_icon_state()
	icon_state = "[initial(icon_state)][active? "-active" : ""]"
	return ..()

/obj/machinery/clockwork/stargazer/process(delta_time)
	if(reconsider_starlight_at_time <= world.time)
		reconsider_starlight()
		reconsider_starlight_at_time = world.time + rand(30 SECONDS, 60 SECONDS)
	generate_power(delta_time)

/obj/machinery/clockwork/stargazer/proc/reconsider_starlight()
	set_active(has_starlight())

/obj/machinery/clockwork/stargazer/proc/has_starlight()
	return locate(/turf/space) in view(min(35, collection_radius), src)

/obj/machinery/clockwork/stargazer/proc/set_active(value)
	if(src.active == value)
		return
	src.active = value
	if(value)
		set_light(
			l_range = active_glow_range,
			l_power = active_glow_power,
			l_color = active_glow_color,
		)
	else
		set_light(
			l_power = 0,
		)
	update_icon()

/obj/machinery/clockwork/stargazer/proc/generate_power(seconds)
	if(!active)
		return
	connected_subnet?.provide_power(seconds * power_generation)

/obj/machinery/clockwork/stargazer/register_subnet(datum/clockwork_subnet/subnet)
	subnet.stargazer_machines += src

/obj/machinery/clockwork/stargazer/unregister_subnet(datum/clockwork_subnet/subnet)
	subnet.stargazer_machines -= src
