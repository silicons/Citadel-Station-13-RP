/obj/machinery/mineral/equipment_vendor/survey
	name = "exploration equipment vendor"
	desc = "An equipment vendor for explorers, points collected with a survey scanner can be spent here."
	icon = 'icons/obj/machines/mining_machines_vr.dmi'
	icon_state = "exploration"
	density = TRUE
	anchored = TRUE
	circuit = /obj/item/circuitboard/exploration_equipment_vendor
	icon_deny = "exploration-deny"
	var/icon_vend = "exploration-vend"
	child = TRUE
	prize_list = list(
		new /datum/data/mining_equipment("Jump Boots",					/obj/item/clothing/shoes/bhop,								250),
		new /datum/data/mining_equipment("Industrial Equipment - Phoron Bore",	/obj/item/gun/magnetic/matfed,						300),
		new	/datum/data/mining_equipment("Colonial Recce Pack",			/obj/item/storage/lockbox/colonial,							350),
		new	/datum/data/mining_equipment("Cyan Posse Pack",				/obj/item/storage/lockbox/cowboy,							800),
		new	/datum/data/mining_equipment("Conscript Pack",				/obj/item/storage/lockbox/russian,							250),
		new	/datum/data/mining_equipment("Maniple Pack",				/obj/item/storage/lockbox/maniple,							200),
		new /datum/data/mining_equipment("Away Team Pack",				/obj/item/storage/lockbox/away,								550),
		new /datum/data/mining_equipment("Defense Equipment - Smoke Bomb",/obj/item/grenade/smokebomb,								10),
		new /datum/data/mining_equipment("Defense Equipment - Razor Drone Deployer",/obj/item/grenade/spawnergrenade/manhacks/station/locked,	100),
		new /datum/data/mining_equipment("Defense Equipment - Sentry Drone Deployer",/obj/item/grenade/spawnergrenade/ward,			150),
		)

	#warn convert remaining

/obj/machinery/mineral/equipment_vendor/survey/interact(mob/user)
	user.set_machine(src)

	var/dat
	dat +="<div class='statusDisplay'>"
	if(istype(inserted_id))
		dat += "You have [inserted_id.survey_points] survey points collected. <A href='?src=\ref[src];choice=eject'>Eject ID.</A><br>"
	else
		dat += "No ID inserted.  <A href='?src=\ref[src];choice=insert'>Insert ID.</A><br>"
	dat += "</div>"
	dat += "<br><b>Equipment point cost list:</b><BR><table border='0' width='100%'>"
	for(var/datum/data/mining_equipment/prize in prize_list)
		dat += "<tr><td>[prize.equipment_name]</td><td>[prize.cost]</td><td><A href='?src=\ref[src];purchase=\ref[prize]'>Purchase</A></td></tr>"
	dat += "</table>"
	var/datum/browser/popup = new(user, "miningvendor", "Survey Equipment Vendor", 400, 600)
	popup.set_content(dat)
	popup.open()

/obj/machinery/mineral/equipment_vendor/survey/Topic(href, href_list)
	if(..())
		return 1

	if(href_list["choice"])
		if(istype(inserted_id))
			if(href_list["choice"] == "eject")
				to_chat(usr, "<span class='notice'>You eject the ID from [src]'s card slot.</span>")
				usr.put_in_hands_or_drop(inserted_id)
				inserted_id = null
		else if(href_list["choice"] == "insert")
			var/obj/item/card/id/I = usr.get_active_held_item()
			if(istype(I) && !inserted_id)
				if(!usr.attempt_insert_item_for_installation(I, src))
					return
				inserted_id = I
				interact(usr)
				to_chat(usr, "<span class='notice'>You insert the ID into [src]'s card slot.</span>")
			else
				to_chat(usr, "<span class='warning'>No valid ID.</span>")
				flick(icon_deny, src)

	if(href_list["purchase"])
		if(istype(inserted_id))
			var/datum/data/mining_equipment/prize = locate(href_list["purchase"])
			if (!prize || !(prize in prize_list))
				to_chat(usr, "<span class='warning'>Error: Invalid choice!</span>")
				flick(icon_deny, src)
				return
			if(prize.cost > inserted_id.survey_points)
				to_chat(usr, "<span class='warning'>Error: Insufficent points for [prize.equipment_name]!</span>")
				flick(icon_deny, src)
			else
				inserted_id.survey_points -= prize.cost
				to_chat(usr, "<span class='notice'>[src] clanks to life briefly before vending [prize.equipment_name]!</span>")
				flick(icon_vend, src)
				new prize.equipment_path(drop_location())
		else
			to_chat(usr, "<span class='warning'>Error: Please insert a valid ID!</span>")
			flick(icon_deny, src)
	updateUsrDialog()
