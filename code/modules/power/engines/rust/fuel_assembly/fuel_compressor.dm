/obj/machinery/fusion_fuel_compressor
	name = "fuel compressor"
	icon = 'icons/obj/machines/power/fusion.dmi'
	icon_state = "fuel_compressor1"
	density = 1
	anchored = 1

	circuit = /obj/item/circuitboard/fusion_fuel_compressor

/obj/machinery/fusion_fuel_compressor/MouseDroppedOnLegacy(var/atom/movable/target, var/mob/user)
	if(user.incapacitated() || !user.Adjacent(src))
		return
	return do_special_fuel_compression(target, user)

/obj/machinery/fusion_fuel_compressor/proc/do_special_fuel_compression(var/obj/item/thing, var/mob/user)
	if(istype(thing) && thing.reagents && thing.reagents.total_volume && thing.is_open_container())
		if(length(thing.reagents.reagent_volumes) > 1)
			to_chat(user, "<span class='warning'>The contents of \the [thing] are impure and cannot be used as fuel.</span>")
			return 1
		if(thing.reagents.total_volume < 50)
			to_chat(user, "<span class='warning'>You need at least fifty units of material to form a fuel rod.</span>")
			return 1
		var/datum/reagent/R = SSchemistry.fetch_reagent(thing.reagents.reagent_volumes[1])
		visible_message("<span class='notice'>\The [src] compresses the contents of \the [thing] into a new fuel assembly.</span>")
		var/obj/item/fuel_assembly/F = new(get_turf(src), R.id, R.color)
		thing.reagents.remove_reagent(R.id, thing.reagents.get_reagent_amount(R.id))
		user.put_in_hands(F)

	else if(istype(thing, /obj/machinery/power/supermatter))
		var/obj/item/fuel_assembly/F = new(get_turf(src), "supermatter")
		visible_message("<span class='notice'>\The [src] compresses \the [thing] into a new fuel assembly.</span>")
		qdel(thing)
		user.put_in_hands(F)
		return 1
	return 0

/obj/machinery/fusion_fuel_compressor/attackby(var/obj/item/thing, var/mob/user)

	if(default_deconstruction_screwdriver(user, thing))
		return
	if(default_deconstruction_crowbar(user, thing))
		return
	if(default_part_replacement(user, thing))
		return

	if(istype(thing, /obj/item/stack/material))
		var/obj/item/stack/material/M = thing
		var/datum/prototype/material/mat = M.material
		if(!mat.is_fusion_fuel)
			to_chat(user, "<span class='warning'>It would be pointless to make a fuel rod out of [mat.use_name].</span>")
			return
		if(M.get_amount() < 25)
			to_chat(user, "<span class='warning'>You need at least 25 [mat.sheet_plural_name] to make a fuel rod.</span>")
			return
		var/obj/item/fuel_assembly/F = new(get_turf(src), mat.name)
		visible_message("<span class='notice'>\The [src] compresses the [mat.use_name] into a new fuel assembly.</span>")
		M.use(25)
		user.put_in_hands(F)

	else if(do_special_fuel_compression(thing, user))
		return

	return ..()
