/mob/living/carbon/human/proc/resp_biomorph(mob/living/carbon/human/target in view(1))
	set name = "Respiratory Biomorph"
	set desc = "Changes the gases we need to breathe."
	set category = "Chimera"

	var/list/gas_choices = list(
		"oxygen" = /datum/gas/oxygen,
		"phoron" = /datum/gas/phoron,
		"nitrogen" = /datum/gas/nitrogen,
		"carbon dioxide" = /datum/gas/carbon_dioxide
	)
	var/choice
	if(target && target != src)
		choice= input(src, "How should we modify their respiration?") as null|anything in gas_choices
	if(target == src)
		choice = input(src, "How should we adapt our respiration?") as null|anything in gas_choices
	if(!choice || !target)
		return
	if(target.isSynthetic())
		to_chat(src,"<span class = 'Notice'>We cannot change a being of metal!</span>")
		return
	var/resp_biomorph = gas_choices[choice]
	if(target == src)
		to_chat(src,"<span class = 'Notice'>We begin modifying our internal structure.</span>")
	else
		target.visible_message("<span class = 'danger'>[src] begins to burrow their digits into [target], slithering down their throat!</span>", "<span class = 'warning'>You feel an extremely uncomfortable slithering sensation going through your throat and into your chest...</span>")
	if(do_after(src,15 SECONDS))
		switch(resp_biomorph)
			if(/datum/gas/oxygen)
				target.species.breath_type = /datum/gas/oxygen
				target.species.poison_type = /datum/gas/phoron
				target.species.exhale_type = /datum/gas/carbon_dioxide
			if(/datum/gas/phoron)
				target.species.breath_type = /datum/gas/phoron
				target.species.poison_type = null
				target.species.exhale_type = /datum/gas/nitrogen
			if(/datum/gas/nitrogen)
				target.species.breath_type = /datum/gas/nitrogen
				target.species.poison_type = null
			if(/datum/gas/carbon_dioxide)
				target.species.breath_type = /datum/gas/carbon_dioxide
				target.species.exhale_type = /datum/gas/oxygen
		if(target == src)
			to_chat("<span class = 'Notice'>It is done.</span>")
		else
			if(prob(10))
				var/datum/disease2/disease/virus2 = new /datum/disease2/disease
				virus2.makerandom()
				infect_virus2(target, virus2)
				log_and_message_admins("Infected [target] with a virus. (Xenochimera)", src)
		target.visible_message("<span class = 'danger'>[src] pulls the tendrils out!</span>", "<span class = 'warning'>The sensation fades. You feel made anew.</span>")


/mob/living/carbon/human/proc/biothermic_adapt(mob/living/carbon/human/target in view(1))
	set name = "Biothermic Adaptation"
	set desc = "Changes our core body temperature."
	set category = "Chimera"

	var/list/temperature_options = list(
	"warm-blooded",
	"cold-blooded",
	"hot-blooded"
	)

	var/biothermic_adapt
	if(target && target != src)
		biothermic_adapt = input(src, "How should we modify their core temperature?") as null|anything in temperature_options
	if(target == src)
		biothermic_adapt = input(src, "How should we modify our core temperature?") as null|anything in temperature_options

	if(!biothermic_adapt || !target)
		return
	if(target.isSynthetic())
		to_chat(src,"<span class = 'Notice'>We cannot change a being of metal!</span>")
		return
	if(target == src)
		to_chat(src, "<span class = 'Notice'>We begin modifying our internal biothermic structure.</span>")
	else
		target.visible_message("<span class = 'danger'>[src] has fleshy tendrils emerge and begin slither inside the veins of [target]!</span>", "<span class = 'warning'>You feel an extremely uncomfortable slithering sensation going through your skin, your veins suddenly feeling as if they have bugs crawling inside...</span>")
	if(do_after(src,15 SECONDS))
		switch(biothermic_adapt)
			if("warm-blooded")	//reverts to default
				target.species.cold_discomfort_level = 285
				target.species.cold_level_1 = 260
				target.species.cold_level_2 = 180
				target.species.cold_level_3 = 100

				target.species.breath_cold_level_1 = 240
				target.species.breath_cold_level_2 = 160
				target.species.breath_cold_level_3 = 80

				target.species.heat_level_1 = 360
				target.species.heat_level_2 = 400
				target.species.heat_level_3 = 1000

				target.species.breath_heat_level_1 = 380
				target.species.breath_heat_level_2 = 450
				target.species.breath_heat_level_3 = 1250

				target.species.heat_discomfort_level = 315
			if("cold-blooded")
				target.species.cold_discomfort_level = T0C+21

				target.species.cold_level_1 = T0C+19
				target.species.cold_level_2 = T0C
				target.species.cold_level_3 = T0C - 15

				target.species.breath_cold_level_1 = T0C + 5
				target.species.breath_cold_level_2 = T0C - 10
				target.species.breath_cold_level_3 = T0C - 25

				target.species.heat_level_1 = 1000
				target.species.heat_level_2 = 1200
				target.species.heat_level_3 = 1400

				target.species.breath_heat_level_1 = 800
				target.species.breath_heat_level_2 = 1000
				target.species.breath_heat_level_3 = 1200

			if("hot-blooded")
				target.species.cold_level_1 = T0C - 75
				target.species.cold_level_2 = T0C - 100
				target.species.cold_level_3 = T0C - 125

				target.species.breath_cold_level_1 = T0C - 75
				target.species.breath_cold_level_2 = T0C - 100
				target.species.breath_cold_level_3 = T0C - 125

				target.species.heat_level_1 = T0C + 25
				target.species.heat_level_2 = T0C + 50
				target.species.heat_level_3 = T0C + 100

				target.species.breath_heat_level_1 = T0C + 50
				target.species.breath_heat_level_2 = T0C + 75
				target.species.breath_heat_level_3 = T0C + 100

				target.species.heat_discomfort_level = T0C+19
		if(target == src)
			to_chat(src, "<span class = 'Notice'>It is done.</span>")
		else
			if(prob(10))
				var/datum/disease2/disease/virus2 = new /datum/disease2/disease
				virus2.makerandom()
				infect_virus2(target, virus2)
				log_and_message_admins("Infected [target] with a virus. (Xenochimera)", src)
		target.visible_message("<span class = 'danger'>[src] pulls the tendrils out!</span>", "<span class = 'warning'>The sensation fades. You feel made anew.</span>")

/mob/living/carbon/human/proc/atmos_biomorph(mob/living/carbon/human/target in view(1))
	set name = "Atmospheric Biomorph"
	set desc = "Changes our sensitivity to atmospheric pressure."
	set category = "Chimera"


	var/list/pressure_options = list(
	"flexible",
	"compact",
	"elastic"
	)
	var/atmos_biomorph
	if(target && target != src)
		atmos_biomorph = input(src, "How should we modify their atmospheric sensitivity?") as null|anything in pressure_options
	if(target == src)
		atmos_biomorph = input(src, "How should we modify our atmospheric sensitivity?") as null|anything in pressure_options
	if(!atmos_biomorph || !target)
		return
	if(target.isSynthetic())
		to_chat(src,"<span class = 'Notice'>We cannot change a being of metal!</span>")
		return
	if(target == src)
		to_chat("<span class = 'Notice'>We begin modifying our skin...</span>")
	else
		target.visible_message("<span class = 'danger'>[src] has fleshy tendrils emerge and begin to merge and mold with [target]!</span>", "<span class = 'warning'>You feel an extremely uncomfortable slithering sensation going through your skin, it begins to feel foreign and dead, emanating from them...</span>")
	if(do_after(src,15 SECONDS))
		switch(atmos_biomorph)
			if("flexible")
				target.species.warning_low_pressure = WARNING_LOW_PRESSURE
				target.species.hazard_low_pressure = -1
				target.species.warning_high_pressure = WARNING_HIGH_PRESSURE
				target.species.hazard_high_pressure = HAZARD_HIGH_PRESSURE
			if("compact")
				target.species.warning_low_pressure = 50
				target.species.hazard_low_pressure = -1
			if("elastic")
				target.species.warning_high_pressure = WARNING_HIGH_PRESSURE + 200
				target.species.hazard_high_pressure = HAZARD_HIGH_PRESSURE + 400

		if(target == src)
			to_chat(src, "<span class = 'notice'>It is done.</span>")
		else
			if(prob(10))
				var/datum/disease2/disease/virus2 = new /datum/disease2/disease
				virus2.makerandom()
				infect_virus2(target, virus2)
				log_and_message_admins("Infected [target] with a virus. (Xenochimera)", src)
		target.visible_message("<span class = 'danger'>[src] pulls the tendrils out!</span>", "<span class = 'warning'>The sensation fades. You feel made anew.</span>")
