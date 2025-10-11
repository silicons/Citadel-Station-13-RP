


#warn deal with this
/obj/proc/tesla_act(var/power)
	SHOULD_NOT_OVERRIDE(TRUE)
	being_shocked = TRUE
	var/power_bounced = power / 2
	tesla_zap(src, 3, power_bounced)
	//addtimer(CALLBACK(src, PROC_REF(reset_shocked)), 10)
	//schedule_task_with_source_in(10, src, PROC_REF(reset_shocked))
	spawn(10) reset_shocked()

/obj/machinery/tesla_act(power, explosive = FALSE)
	..()
	if(prob(85) && explosive)
		explosion(loc, 0, 2, 4, /*flame_range = 2,*/ adminlog = FALSE/*, smoke = FALSE*/) // No devastation range
	else if(prob(50))
		emp_act(2)
	else
		legacy_ex_act(2)

/obj/machinery/light/tesla_act(power, explosive = FALSE)
	if(explosive)
		explosion(loc, 0, 0, 0/*, flame_range = 5*/, adminlog = FALSE)
		qdel(src)
		return
	on = TRUE
	broken()

/obj/vehicle/sealed/mecha/tesla_act(power)
	..()
	take_damage_legacy(power / 200, "energy") // A surface lightning strike will do 100 damage.
