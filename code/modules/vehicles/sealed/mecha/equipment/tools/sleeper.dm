/obj/item/mecha_parts/mecha_equipment/tool/sleeper
	name = "mounted sleeper"
	desc = "A sleeper. Mountable to an exosuit. (Can be attached to: Medical Exosuits)"
	icon = 'icons/obj/medical/cryogenic2.dmi'
	icon_state = "sleeper_0"
	origin_tech = list(TECH_DATA = 2, TECH_BIO = 3)
	energy_drain = 20
	range = MELEE
	equip_cooldown = 30
	mech_flags = EXOSUIT_MODULE_MEDICAL
	var/mob/living/carbon/human/occupant_legacy = null
	var/datum/global_iterator/pr_mech_sleeper
	var/inject_amount = 5
	required_type = list(/obj/vehicle/sealed/mecha/medical)
	salvageable = FALSE
	allow_duplicate = TRUE

/obj/item/mecha_parts/mecha_equipment/tool/sleeper/Initialize(mapload)
	. = ..()
	pr_mech_sleeper = new /datum/global_iterator/mech_sleeper(list(src),0)
	pr_mech_sleeper.set_delay(equip_cooldown)
	return

/obj/item/mecha_parts/mecha_equipment/tool/sleeper/Destroy()
	qdel(pr_mech_sleeper)
	for(var/atom/movable/AM in src)
		AM.forceMove(get_turf(src))
	return ..()

/obj/item/mecha_parts/mecha_equipment/tool/sleeper/Exit(atom/movable/O)
	return FALSE

/obj/item/mecha_parts/mecha_equipment/tool/sleeper/action(var/mob/living/carbon/human/target)
	if(!action_checks(target))
		return
	if(!istype(target))
		return
	if(target.buckled)
		occupant_message("[target] will not fit into the sleeper because they are buckled to [target.buckled].")
		return
	if(occupant_legacy)
		occupant_message("The sleeper is already occupied")
		return
	if(target.has_buckled_mobs())
		occupant_message(SPAN_WARNING("\The [target] has other entities attached to it. Remove them first."))
		return
	occupant_message("You start putting [target] into [src].")
	chassis.visible_message("[chassis] starts putting [target] into the [src].")
	var/C = chassis.loc
	var/T = target.loc
	if(do_after_cooldown(target))
		if(chassis.loc!=C || target.loc!=T)
			return
		if(occupant_legacy)
			occupant_message(SPAN_DANGER("<B>The sleeper is already occupied!</B>"))
			return
		target.forceMove(src)
		target.update_perspective()
		occupant_legacy = target
		occupant_legacy.Stasis(3)
		/*
		if(target.client)
			target.client.perspective = EYE_PERSPECTIVE
			target.client.eye = chassis
		*/
		set_ready_state(0)
		pr_mech_sleeper.start()
		occupant_message("<font color='blue'>[target] successfully loaded into [src]. Life support functions engaged.</font>")
		chassis.visible_message("[chassis] loads [target] into [src].")
		log_message("[target] loaded. Life support functions engaged.")
	return

/obj/item/mecha_parts/mecha_equipment/tool/sleeper/proc/go_out()
	if(!occupant_legacy)
		return
	occupant_legacy.forceMove(get_turf(src))
	occupant_legacy.update_perspective()
	occupant_message("[occupant_legacy] ejected. Life support functions disabled.")
	log_message("[occupant_legacy] ejected. Life support functions disabled.")
	/*
	if(occupant_legacy.client)
		occupant_legacy.client.eye = occupant_legacy.client.mob
		occupant_legacy.client.perspective = MOB_PERSPECTIVE
	*/
	occupant_legacy.Stasis(0)
	occupant_legacy = null
	pr_mech_sleeper.stop()
	set_ready_state(1)

/obj/item/mecha_parts/mecha_equipment/tool/sleeper/detach()
	if(occupant_legacy)
		occupant_message("Unable to detach [src] - equipment occupied.")
		return
	pr_mech_sleeper.stop()
	return ..()

/obj/item/mecha_parts/mecha_equipment/tool/sleeper/get_equip_info()
	var/output = ..()
	if(output)
		var/temp = ""
		if(occupant_legacy)
			temp = "<br />\[Occupant: [occupant_legacy] (Health: [occupant_legacy.integrity]%)\]<br /><a href='?src=\ref[src];view_stats=1'>View stats</a>|<a href='?src=\ref[src];eject=1'>Eject</a>"
		return "[output] [temp]"
	return

/obj/item/mecha_parts/mecha_equipment/tool/sleeper/Topic(href,href_list)
	..()
	var/datum/topic_input/top_filter = new /datum/topic_input(href,href_list)
	if(top_filter.get("eject"))
		go_out()
	if(top_filter.get("view_stats"))
		chassis.occupant_legacy << browse(get_occupant_stats(),"window=msleeper")
		onclose(chassis.occupant_legacy, "msleeper")
		return
	if(top_filter.get("inject"))
		inject_reagent(top_filter.getType("inject",/datum/reagent),top_filter.getObj("source"))
	return

/obj/item/mecha_parts/mecha_equipment/tool/sleeper/proc/get_occupant_stats()
	if(!occupant_legacy)
		return
	return {"<html>
				<head>
				<title>[occupant_legacy] statistics</title>
				<script language='javascript' type='text/javascript'>
				[js_byjax]
				</script>
				<style>
				h3 {margin-bottom:2px;font-size:14px;}
				#lossinfo, #reagents, #injectwith {padding-left:15px;}
				</style>
				</head>
				<body>
				<h3>Health statistics</h3>
				<div id="lossinfo">
				[get_occupant_dam()]
				</div>
				<h3>Reagents in bloodstream</h3>
				<div id="reagents">
				[get_occupant_reagents()]
				</div>
				<div id="injectwith">
				[get_available_reagents()]
				</div>
				</body>
				</html>"}

/obj/item/mecha_parts/mecha_equipment/tool/sleeper/proc/get_occupant_dam()
	var/t1
	switch(occupant_legacy.stat)
		if(0)
			t1 = "Conscious"
		if(1)
			t1 = "Unconscious"
		if(2)
			t1 = "*dead*"
		else
			t1 = "Unknown"
	return {"<font color="[occupant_legacy.integrity > 50 ? "blue" : "red"]"><b>Health:</b> [occupant_legacy.integrity]% ([t1])</font><br />
				<font color="[occupant_legacy.bodytemperature > 50 ? "blue" : "red"]"><b>Core Temperature:</b> [src.occupant_legacy.bodytemperature-T0C]&deg;C ([src.occupant_legacy.bodytemperature*1.8-459.67]&deg;F)</font><br />
				<font color="[occupant_legacy.getBruteLoss() < 60 ? "blue" : "red"]"><b>Brute Damage:</b> [occupant_legacy.getBruteLoss()]%</font><br />
				<font color="[occupant_legacy.getOxyLoss() < 60 ? "blue" : "red"]"><b>Respiratory Damage:</b> [occupant_legacy.getOxyLoss()]%</font><br />
				<font color="[occupant_legacy.getToxLoss() < 60 ? "blue" : "red"]"><b>Toxin Content:</b> [occupant_legacy.getToxLoss()]%</font><br />
				<font color="[occupant_legacy.getFireLoss() < 60 ? "blue" : "red"]"><b>Burn Severity:</b> [occupant_legacy.getFireLoss()]%</font><br />
				"}

/obj/item/mecha_parts/mecha_equipment/tool/sleeper/proc/get_occupant_reagents()
	if(occupant_legacy.reagents)
		for(var/datum/reagent/R in occupant_legacy.reagents.reagent_list)
			if(R.volume > 0)
				. += "[R]: [round(R.volume,0.01)]<br />"
	return . || "None"

/obj/item/mecha_parts/mecha_equipment/tool/sleeper/proc/get_available_reagents()
	var/output
	var/obj/item/mecha_parts/mecha_equipment/tool/syringe_gun/SG = locate(/obj/item/mecha_parts/mecha_equipment/tool/syringe_gun) in chassis
	if(SG && SG.reagents && islist(SG.reagents.reagent_list))
		for(var/datum/reagent/R in SG.reagents.reagent_list)
			if(R.volume > 0)
				output += "<a href=\"?src=\ref[src];inject=\ref[R];source=\ref[SG]\">Inject [R.name]</a><br />"
	return output


/obj/item/mecha_parts/mecha_equipment/tool/sleeper/proc/inject_reagent(var/datum/reagent/R,var/obj/item/mecha_parts/mecha_equipment/tool/syringe_gun/SG)
	if(!R || !occupant_legacy || !SG || !(SG in chassis.equipment))
		return 0
	var/to_inject = min(R.volume, inject_amount)
	if(to_inject && occupant_legacy.reagents.get_reagent_amount(R.id) + to_inject > inject_amount*4)
		occupant_message("Sleeper safeties prohibit you from injecting more than [inject_amount*4] units of [R.name].")
	else
		occupant_message("Injecting [occupant_legacy] with [to_inject] units of [R.name].")
		log_message("Injecting [occupant_legacy] with [to_inject] units of [R.name].")
		//SG.reagents.trans_id_to(occupant_legacy,R.id,to_inject)
		SG.reagents.remove_reagent(R.id,to_inject)
		occupant_legacy.reagents.add_reagent(R.id,to_inject)
		update_equip_info()
	return

/obj/item/mecha_parts/mecha_equipment/tool/sleeper/update_equip_info()
	if(..())
		send_byjax(chassis.occupant_legacy,"msleeper.browser","lossinfo",get_occupant_dam())
		send_byjax(chassis.occupant_legacy,"msleeper.browser","reagents",get_occupant_reagents())
		send_byjax(chassis.occupant_legacy,"msleeper.browser","injectwith",get_available_reagents())
		return 1
	return

/obj/item/mecha_parts/mecha_equipment/tool/sleeper/verb/eject()
	set name = "Sleeper Eject"
	set category = "Exosuit Interface"
	set src = usr.loc
	set popup_menu = 0
	if(usr!=src.occupant_legacy || usr.stat == 2)
		return
	to_chat(usr,"<span class='notice'>Release sequence activated. This will take one minute.</span>")
	sleep(600)
	if(!src || !usr || !occupant_legacy || (occupant_legacy != usr)) //Check if someone's released/replaced/bombed him already
		return
	go_out()//and release him from the eternal prison.

/datum/global_iterator/mech_sleeper

/datum/global_iterator/mech_sleeper/process(var/obj/item/mecha_parts/mecha_equipment/tool/sleeper/S)
	if(!S.chassis)
		S.set_ready_state(1)
		return stop()
	if(!S.chassis.has_charge(S.energy_drain))
		S.set_ready_state(1)
		S.log_message("Deactivated.")
		S.occupant_message("[src] deactivated - no power.")
		return stop()
	var/mob/living/carbon/M = S.occupant_legacy
	if(!M)
		return
	if(M.integrity > 0)
		M.adjustOxyLoss(-1)
		M.update_health()
	M.adjust_stunned(20 * -4)
	M.adjust_paralyzed(20 * -4)
	M.adjust_stunned(20 * -4)
	M.afflict_unconscious(20 * 2)
	M.afflict_paralyze(20 * 2)
	M.afflict_stun(20 * 2)
	if(M.reagents.get_reagent_amount("inaprovaline") < 5)
		M.reagents.add_reagent("inaprovaline", 5)
	S.chassis.use_power(S.energy_drain)
	S.update_equip_info()
	return
