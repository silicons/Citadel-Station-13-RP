
/**
 * scale: watts
 */
/proc/tesla_zap(atom/source, zap_range = 3, power, explosive = FALSE, stun_mobs = TRUE)
	. = source.dir
	if(power < 1000)
		return

	var/closest_dist = 0
	var/closest_atom
	var/obj/machinery/power/tesla_coil/closest_tesla_coil
	var/obj/machinery/power/grounding_rod/closest_grounding_rod
	var/mob/living/closest_mob
	var/obj/machinery/closest_machine
	var/obj/structure/closest_structure
	var/obj/structure/blob/closest_blob
	var/static/things_to_shock = typecacheof(list(/obj/machinery, /mob/living, /obj/structure))
	var/static/blacklisted_tesla_types = typecacheof(list(
										/obj/machinery/atmospherics,
										/obj/machinery/power/emitter,
										/obj/machinery/field_generator,
										/obj/machinery/door/blast,
										/obj/machinery/particle_accelerator/control_box,
										/obj/structure/particle_accelerator/fuel_chamber,
										/obj/structure/particle_accelerator/particle_emitter/center,
										/obj/structure/particle_accelerator/particle_emitter/left,
										/obj/structure/particle_accelerator/particle_emitter/right,
										/obj/structure/particle_accelerator/power_box,
										/obj/structure/particle_accelerator/end_cap,
										/obj/machinery/containment_field,
										/obj/structure/disposalpipe,
										/obj/structure/sign,
										/obj/machinery/gateway,
										/obj/structure/lattice,
										/obj/structure/grille,
										/obj/machinery/the_singularitygen/tesla))

	for(var/A in typecache_filter_multi_list_exclusion(oview(source, zap_range+2), things_to_shock, blacklisted_tesla_types))
		if(istype(A, /obj/machinery/power/tesla_coil))
			var/dist = get_dist(source, A)
			var/obj/machinery/power/tesla_coil/C = A
			if(dist <= zap_range && (dist < closest_dist || !closest_tesla_coil) && !C.being_shocked)
				closest_dist = dist

				//we use both of these to save on istype and typecasting overhead later on
				//while still allowing common code to run before hand
				closest_tesla_coil = C
				closest_atom = C


		else if(closest_tesla_coil)
			continue //no need checking these other things

		else if(istype(A, /obj/machinery/power/grounding_rod))
			var/obj/machinery/power/grounding_rod/G = A
			var/dist = get_dist(source, A) - (G.anchored ? 2 : 0)
			if(dist <= zap_range && (dist < closest_dist || !closest_grounding_rod))
				closest_grounding_rod = A
				closest_atom = A
				closest_dist = dist

		else if(closest_grounding_rod)
			continue

		else if(isliving(A))
			var/dist = get_dist(source, A)
			var/mob/living/L = A
			if(dist <= zap_range && (dist < closest_dist || !closest_mob) && L.stat != DEAD && !(L.status_flags & STATUS_GODMODE))
				closest_mob = L
				closest_atom = A
				closest_dist = dist

		else if(closest_mob)
			continue

		else if(istype(A, /obj/machinery))
			var/obj/machinery/M = A
			var/dist = get_dist(source, A)
			if(dist <= zap_range && (dist < closest_dist || !closest_machine) && !M.being_shocked)
				closest_machine = M
				closest_atom = A
				closest_dist = dist

		else if(closest_machine)
			continue

		else if(istype(A, /obj/structure/blob))
			var/obj/structure/blob/B = A
			var/dist = get_dist(source, A)
			if(dist <= zap_range && (dist < closest_dist || !closest_tesla_coil) && !B.being_shocked)
				closest_blob = B
				closest_atom = A
				closest_dist = dist

		else if(closest_blob)
			continue

		else if(istype(A, /obj/structure))
			var/obj/structure/S = A
			var/dist = get_dist(source, A)
			if(dist <= zap_range && (dist < closest_dist || !closest_tesla_coil) && !S.being_shocked)
				closest_structure = S
				closest_atom = A
				closest_dist = dist

	//Alright, we've done our loop, now lets see if was anything interesting in range
	if(closest_atom)
		//common stuff
		var/atom/srcLoc = get_turf(source)
		srcLoc.Beam(closest_atom, icon_state="lightning[rand(1,12)]", time=5, maxdistance = INFINITY)
		var/zapdir = get_dir(source, closest_atom)
		if(zapdir)
			. = zapdir

	var/drain_energy = TRUE

	//per type stuff:
	if(closest_tesla_coil)
		closest_tesla_coil.tesla_act(power, explosive, stun_mobs)

	else if(closest_grounding_rod)
		closest_grounding_rod.tesla_act(power, explosive, stun_mobs)

	else if(closest_mob)
		var/shock_damage = clamp(round(power/400), 10, 90) + rand(-5, 5)
		closest_mob.electrocute(power, shock_damage, 0, ELECTROCUTE_ACT_FLAG_DISTRIBUTE, ran_zone(), source)
		log_game("TESLA([source.x],[source.y],[source.z]) Shocked [key_name(closest_mob)] for [shock_damage]dmg.")
		message_admins("Tesla zapped [key_name_admin(closest_mob)]!")
		if(issilicon(closest_mob))
			var/mob/living/silicon/S = closest_mob
			if(stun_mobs)
				S.emp_act(3 /*EMP_LIGHT*/)
			tesla_zap(closest_mob, 7, power / 1.5, explosive, stun_mobs) // metallic folks bounce it further
		else
			tesla_zap(closest_mob, 5, power / 1.5, explosive, stun_mobs)

	else if(closest_machine)
		drain_energy = TRUE // Safety First! Drain Tesla fast when its loose
		closest_machine.tesla_act(power, explosive, stun_mobs)

	else if(closest_blob)
		drain_energy = TRUE // Safety First! Drain Tesla fast when its loose
		closest_blob.tesla_act(power, explosive, stun_mobs)

	else if(closest_structure)
		drain_energy = TRUE // Safety First! Drain Tesla fast when its loose
		closest_structure.tesla_act(power, explosive, stun_mobs)

	// Safety First! Drain Tesla fast when its loose
	if(drain_energy && istype(source, /obj/singularity/energy_ball))
		var/obj/singularity/energy_ball/EB = source
		if (EB.energy > 0)
			EB.energy -= min(EB.energy, max(1, round(EB.energy * 0.001)))
