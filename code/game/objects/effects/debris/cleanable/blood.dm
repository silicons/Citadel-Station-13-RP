//for 1 unit of depth in puddle (amount var)
#define BLOOD_DRYING_TIME (5 * 60*10)

var/global/list/image/splatter_cache=list()

/obj/effect/debris/cleanable/blood
	name = "blood"
	var/dryname = "dried blood"
	desc = "It's thick and gooey. Perhaps it's the chef's cooking?"
	var/drydesc = "It's dry and crusty. Someone is not doing their job."
	gender = PLURAL
	density = 0
	anchored = 1
	icon = 'icons/effects/blood.dmi'
	icon_state = "mfloor1"
	random_icon_states = list("mfloor1", "mfloor2", "mfloor3", "mfloor4", "mfloor5", "mfloor6", "mfloor7")
	var/base_icon = 'icons/effects/blood.dmi'
	blood_DNA = list()
	var/basecolor="#A10808" // Color when wet.
	var/synthblood = 0
	var/list/datum/disease2/disease/virus2 = list()
	var/amount = 5
	var/drytime

/obj/effect/debris/cleanable/blood/serialize()
	. = ..()
	.["amount"] = amount
	.["color"] = color

/obj/effect/debris/cleanable/blood/deserialize(list/data)
	. = ..()
	amount = data["amount"] || 0
	color = data["color"] || "#ffffff"

/obj/effect/debris/cleanable/blood/reveal_blood()
	if(!fluorescent)
		fluorescent = 1
		basecolor = COLOR_LUMINOL
		update_icon()

/obj/effect/debris/cleanable/blood/clean_blood()
	fluorescent = 0
	if(invisibility != 100)
		invisibility = 100
		amount = 0
		obj_persist_status |= OBJ_PERSIST_STATUS_NO_THANK_YOU
		STOP_PROCESSING(SSobj, src)
	..(ignore=1)

/obj/effect/debris/cleanable/blood/Destroy()
	STOP_PROCESSING(SSobj, src)
	return ..()

/obj/effect/debris/cleanable/blood/Initialize(mapload)
	. = ..()
	update_icon()
	if(istype(src, /obj/effect/debris/cleanable/blood/gibs))
		return
	if(src.type == /obj/effect/debris/cleanable/blood)
		if(src.loc && isturf(src.loc))
			for(var/obj/effect/debris/cleanable/blood/B in src.loc)
				if(B != src)
					if(mapload)
						return INITIALIZE_HINT_QDEL
					if (B.blood_DNA)
						blood_DNA |= B.blood_DNA.Copy()
					qdel(B)
	addtimer(CALLBACK(src, PROC_REF(dry)), BLOOD_DRYING_TIME * (amount + 1))

/obj/effect/debris/cleanable/blood/update_icon()
	. = ..()
	if(basecolor == "rainbow")
		basecolor = "#[get_random_colour(1)]"
	add_atom_color(basecolor)

	if(basecolor == SYNTH_BLOOD_COLOUR)
		name = "oil"
		desc = "It's quite oily."
	else if(synthblood)
		name = "synthetic blood"
		desc = "It's quite greasy."
	else
		name = initial(name)
		desc = initial(desc)

/obj/effect/debris/cleanable/blood/Crossed(mob/living/carbon/human/perp)
	. = ..()
	if(perp.is_incorporeal() || perp.is_avoiding_ground())
		return
	if (!istype(perp))
		return
	if(amount < 1)
		return

	var/obj/item/organ/external/l_foot = perp.get_organ("l_foot")
	var/obj/item/organ/external/r_foot = perp.get_organ("r_foot")
	var/hasfeet = 1
	if((!l_foot || l_foot.is_stump()) && (!r_foot || r_foot.is_stump()))
		hasfeet = 0
	if(perp.shoes && !perp.buckled)//Adding blood to shoes
		var/obj/item/clothing/shoes/S = perp.shoes
		if(istype(S))
			S.blood_color = basecolor
			S.track_blood = max(amount,S.track_blood)
			if(!S.blood_overlay)
				S.generate_blood_overlay()
			if(!S.blood_DNA)
				S.blood_DNA = list()
				S.blood_overlay.color = basecolor
				S.add_overlay(S.blood_overlay)
			if(S.blood_overlay && S.blood_overlay.color != basecolor)
				S.blood_overlay.color = basecolor
				S.add_overlay(S.blood_overlay)
			S.blood_DNA |= blood_DNA.Copy()
			perp.update_inv_shoes()

	else if (hasfeet)//Or feet
		perp.feet_blood_color = basecolor
		perp.track_blood = max(amount,perp.track_blood)
		LAZYINITLIST(perp.feet_blood_DNA)
		perp.feet_blood_DNA |= blood_DNA.Copy()
		perp.update_bloodied()
	else if (perp.buckled && istype(perp.buckled, /obj/structure/bed/chair/wheelchair))
		var/obj/structure/bed/chair/wheelchair/W = perp.buckled
		W.bloodiness = 4

	amount--

/obj/effect/debris/cleanable/blood/proc/dry()
	name = dryname
	desc = drydesc
	var/newcolor = adjust_brightness(color, -50)
	add_atom_color(newcolor)
	amount = 0

/obj/effect/debris/cleanable/blood/attack_hand(mob/user, datum/event_args/actor/clickchain/e_args)
	. = ..()
	if(.)
		return
	var/mob/living/carbon/human/l = user
	if(!istype(l))
		return
	if (amount && istype(l))
		if (l.gloves)
			return
		var/taken = rand(1,amount)
		amount -= taken
		to_chat(l, SPAN_NOTICE("You get some of \the [src] on your hands."))
		if (!l.blood_DNA)
			l.blood_DNA = list()
		l.blood_DNA |= blood_DNA.Copy()
		l.bloody_hands += taken
		l.hand_blood_color = basecolor
		l.update_inv_gloves(1)
		add_verb(l, /mob/living/carbon/human/proc/bloody_doodle)

/obj/effect/debris/cleanable/blood/splatter
        random_icon_states = list("mgibbl1", "mgibbl2", "mgibbl3", "mgibbl4", "mgibbl5")
        amount = 2

/obj/effect/debris/cleanable/blood/drip
	name = "drips of blood"
	desc = "It's red."
	gender = PLURAL
	icon = 'icons/effects/drip.dmi'
	icon_state = "1"
	random_icon_states = list("1","2","3","4","5")
	amount = 0
	var/list/drips = list()

/obj/effect/debris/cleanable/blood/drip/Initialize(mapload)
	. = ..()
	drips |= icon_state

/obj/effect/debris/cleanable/blood/writing
	icon_state = "tracks"
	desc = "It looks like a writing in blood."
	gender = NEUTER
	random_icon_states = list("writing1","writing2","writing3","writing4","writing5")
	amount = 0
	var/message

/obj/effect/debris/cleanable/blood/writing/Initialize(mapload)
	. = ..()
	if(random_icon_states.len)
		for(var/obj/effect/debris/cleanable/blood/writing/W in loc)
			random_icon_states.Remove(W.icon_state)
		if(!length(random_icon_states))
			return INITIALIZE_HINT_QDEL
		icon_state = pick(random_icon_states)
	else
		icon_state = "writing1"

/obj/effect/debris/cleanable/blood/writing/examine(mob/user, dist)
	. = ..()
	. += "It reads: <font color='[basecolor]'>\"[message]\"</font>"

/obj/effect/debris/cleanable/blood/gibs
	name = "gibs"
	desc = "They look bloody and gruesome."
	gender = PLURAL
	density = 0
	anchored = 1
	icon = 'icons/effects/blood.dmi'
	icon_state = "gibbl5"
	random_icon_states = list("gib1", "gib2", "gib3", "gib5", "gib6")
	var/fleshcolor = "#FFFFFF"

/obj/effect/debris/cleanable/blood/gibs/update_icon()
	cut_overlays()
	. = ..()

	var/image/giblets = new(base_icon, "[icon_state]_flesh", dir)
	if(!fleshcolor || fleshcolor == "rainbow")
		fleshcolor = "#[get_random_colour(1)]"
	giblets.color = fleshcolor

	var/icon/blood = new(base_icon,"[icon_state]",dir)
	if(basecolor == "rainbow") basecolor = "#[get_random_colour(1)]"
	blood.Blend(basecolor,ICON_MULTIPLY)

	icon = blood
	add_overlay(giblets)

/obj/effect/debris/cleanable/blood/gibs/up
	random_icon_states = list("gib1", "gib2", "gib3", "gib5", "gib6","gibup1","gibup1","gibup1")

/obj/effect/debris/cleanable/blood/gibs/down
	random_icon_states = list("gib1", "gib2", "gib3", "gib5", "gib6","gibdown1","gibdown1","gibdown1")

/obj/effect/debris/cleanable/blood/gibs/body
	random_icon_states = list("gibhead", "gibtorso")

/obj/effect/debris/cleanable/blood/gibs/limb
	random_icon_states = list("gibleg", "gibarm")

/obj/effect/debris/cleanable/blood/gibs/core
	random_icon_states = list("gibmid1", "gibmid2", "gibmid3")


/obj/effect/debris/cleanable/blood/gibs/proc/streak(var/list/directions)
	spawn (0)
		var/direction = pick(directions)
		for (var/i = 0, i < pick(1, 200; 2, 150; 3, 50; 4), i++)
			sleep(3)
			if (i > 0)
				var/obj/effect/debris/cleanable/blood/b = new /obj/effect/debris/cleanable/blood/splatter(src.loc)
				b.basecolor = src.basecolor
				b.update_icon()

			if (step_to(src, get_step(src, direction), 0))
				break

#undef BLOOD_DRYING_TIME
