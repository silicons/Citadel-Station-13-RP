//A series(?) of prisms for PoIs. The base one only works for beams.

// todo: refactor to /obj/structure/reflector
/obj/structure/prop/prism
	name = "prismatic turret"
	desc = "A raised, externally powered 'turret'. It seems to have a massive crystal ring around its base."
	description_info = "This device is capable of redirecting any beam projectile."
	icon = 'icons/obj/props/prism.dmi'
	icon_state = "prism"
	density = TRUE
	anchored = TRUE

	layer = 3.1					//Layer over projectiles.
	plane = -10					//Layer over projectiles.

	/// projectile_type's to reflect
	/// all of these must be on a projectile
	var/projectile_type = PROJECTILE_TYPE_BEAM | PROJECTILE_TYPE_PHOTONIC
	/// can't reflect these
	var/projectile_type_cant = NONE

	var/rotation_lock = 0		// Can you rotate the prism at all?
	var/free_rotate = 1			// Does the prism rotate in any direction, or only in the eight standard compass directions?
	var/external_control_lock = 0	// Does the prism only rotate from the controls of an external switch?
	var/degrees_from_north = 0	// How far is it rotated clockwise?
	var/compass_directions = list("North" = 0, "South" = 180, "East" = 90, "West" = 270, "Northwest" = 315, "Northeast" = 45, "Southeast" = 135, "Southwest" = 225)
	var/interaction_sound = 'sound/mecha/mechmove04.ogg'

	var/dialID = null
	var/obj/structure/prop/prismcontrol/remote_dial = null

	var/silent = FALSE

	interaction_message = "<span class='notice'>The prismatic turret seems to be able to rotate.</span>"

/obj/structure/prop/prism/Initialize(mapload)
	. = ..()
	if(degrees_from_north)
		animate(src, transform = turn(NORTH, degrees_from_north), time = 3)

/obj/structure/prop/prism/Destroy()
	if(remote_dial)
		remote_dial.my_turrets -= src
		remote_dial = null
	..()

/obj/structure/prop/prism/proc/reset_rotation()
	var/degrees_to_rotate = -1 * degrees_from_north
	animate(src, transform = turn(src.transform, degrees_to_rotate), time = 2)

/obj/structure/prop/prism/attack_hand(mob/user, datum/event_args/actor/clickchain/e_args)
	..()

	if(rotation_lock)
		to_chat(user, "<span class='warning'>\The [src] is locked at its current bearing.</span>")
		return
	if(external_control_lock)
		to_chat(user, "<span class='warning'>\The [src]'s motors resist your efforts to rotate it. You may need to find some form of controller.</span>")
		return

	var/confirm = input("Do you want to try to rotate \the [src]?", "[name]") in list("Yes", "No")
	if(confirm == "No")
		visible_message(\
			"<span class='notice'>[user.name] decides not to try turning \the [src].</span>",\
			"<span class='notice'>You decide not to try turning \the [src].</span>")
		return

	var/new_bearing
	if(free_rotate)
		new_bearing = input("What bearing do you want to rotate \the [src] to?", "[name]") as num
		new_bearing = round(new_bearing)
		if(new_bearing <= -1 || new_bearing > 360)
			to_chat(user, "<span class='warning'>Rotating \the [src] [new_bearing] degrees would be a waste of time.</span>")
			return
	else
		var/choice = input("What point do you want to set \the [src] to?", "[name]") as null|anything in compass_directions
		new_bearing = round(compass_directions[choice])

	var/rotate_degrees = new_bearing - degrees_from_north

	if(new_bearing == 360) // Weird artifact.
		new_bearing = 0
	degrees_from_north = new_bearing

	var/two_stage = 0
	if(rotate_degrees == 180 || rotate_degrees == -180)
		two_stage = 1
		var/multiplier = pick(-1, 1)
		rotate_degrees = multiplier * (rotate_degrees / 2)

	playsound(src, interaction_sound, 50, 1)
	if(two_stage)
		animate(src, transform = turn(src.transform, rotate_degrees), time = 3)
		spawn(3)
			animate(src, transform = turn(src.transform, rotate_degrees), time = 3)
	else
		animate(src, transform = turn(src.transform, rotate_degrees), time = 6) //Can't update transform because it will reset the angle.

/obj/structure/prop/prism/proc/rotate_auto(var/new_bearing)
	if(rotation_lock)
		visible_message("<span class='notice'>\The [src] shudders.</span>")
		playsound(src, 'sound/effects/clang.ogg', 50, 1)
		return

	visible_message("<span class='notice'>\The [src] rotates to a bearing of [new_bearing].</span>")

	var/rotate_degrees = new_bearing - degrees_from_north

	if(new_bearing == 360)
		new_bearing = 0
	degrees_from_north = new_bearing

	var/two_stage = 0
	if(rotate_degrees == 180 || rotate_degrees == -180)
		two_stage = 1
		var/multiplier = pick(-1, 1)
		rotate_degrees = multiplier * (rotate_degrees / 2)

	playsound(src, interaction_sound, 50, 1)
	if(two_stage)
		animate(src, transform = turn(src.transform, rotate_degrees), time = 3)
		spawn(3)
			animate(src, transform = turn(src.transform, rotate_degrees), time = 3)
	else
		animate(src, transform = turn(src.transform, rotate_degrees), time = 6)

/obj/structure/prop/prism/on_bullet_act(obj/projectile/proj, impact_flags, list/bullet_act_args)
	if(((proj.projectile_type & projectile_type) != projectile_type) || (proj.projectile_type & projectile_type_cant))
		return ..()
	if(!silent)
		visible_message("<span class='danger'>\The [src] redirects \the [proj]!</span>")
	flick("[initial(icon_state)]+glow", src)

	// todo: this is not the right way; visuals are weird and the raycast is :/
	proj.physics_kick_forwards(16)
	proj.set_angle(degrees_from_north)
	return PROJECTILE_IMPACT_REFLECT

/obj/structure/prop/prism/incremental
	free_rotate = 0
	description_info = "This device is capable of redirecting any beam projectile, but only locks to specific positions in rotation."

/obj/structure/prop/prism/incremental/externalcont
	external_control_lock = 1
	description_info = "This device is capable of redirecting any beam projectile, but can only be rotated by a control dial to specific positions."

/obj/structure/prop/prism/externalcont
	external_control_lock = 1
	description_info = "This device is capable of redirecting any beam projectile, but can only be rotated by an external control dial."

/obj/structure/prop/prismcontrol
	name = "prismatic dial"
	desc = "A large dial with a crystalline ring."
	icon = 'icons/obj/props/prism.dmi'
	icon_state = "dial"
	density = FALSE
	anchored = TRUE

	interaction_message = "<span class='notice'>The dial pulses as your hand nears it.</span>"
	var/list/my_turrets = list()
	var/dialID = null

/obj/structure/prop/prismcontrol/attack_hand(mob/user, datum/event_args/actor/clickchain/e_args)
	..()

	var/confirm = input("Do you want to try to rotate \the [src]?", "[name]") in list("Yes", "No")
	if(confirm == "No")
		visible_message(\
			"<span class='notice'>[user.name] decides not to try turning \the [src].</span>",\
			"<span class='notice'>You decide not to try turning \the [src].</span>")
		return

	if(!my_turrets || !my_turrets.len)
		to_chat(user, "<span class='notice'>\The [src] doesn't seem to do anything.</span>")
		return

	var/free_rotate = 1
	var/list/compass_directions = list()
	for(var/obj/structure/prop/prism/P in my_turrets)
		if(!P.free_rotate) //Doesn't use bearing, it uses compass points.
			free_rotate = 0
			compass_directions |= P.compass_directions

	var/new_bearing
	if(free_rotate)
		new_bearing = input("What bearing do you want to rotate \the [src] to?", "[name]") as num
		new_bearing = round(new_bearing)
		if(new_bearing <= -1 || new_bearing > 360)
			to_chat(user, "<span class='warning'>Rotating \the [src] [new_bearing] degrees would be a waste of time.</span>")
			return
	else
		var/choice = input("What point do you want to set \the [src] to?", "[name]") as null|anything in compass_directions
		new_bearing = round(compass_directions[choice])

	confirm = input("Are you certain you want to rotate \the [src]?", "[name]") in list("Yes", "No")
	if(confirm == "No")
		visible_message(\
			"<span class='notice'>[user.name] decides not to try turning \the [src].</span>",\
			"<span class='notice'>You decide not to try turning \the [src].</span>")
		return

	to_chat(user, "<span class='notice'>\The [src] clicks into place.</span>")
	for(var/obj/structure/prop/prism/P in my_turrets)
		P.rotate_auto(new_bearing)

/obj/structure/prop/prismcontrol/Initialize(mapload)
	. = ..()
	if(my_turrets.len) //Preset controls.
		for(var/obj/structure/prop/prism/P in my_turrets)
			P.remote_dial = src
		return
	spawn()
		for(var/obj/structure/prop/prism/P in orange(src, 30)) //Don't search a huge area. //Second note. I widened this area because the dial search area was ridiculously small.
			if(P.dialID == dialID && !P.remote_dial && P.external_control_lock)
				my_turrets |= P
				P.remote_dial = src

/obj/structure/prop/prismcontrol/Destroy()
	for(var/obj/structure/prop/prism/P in my_turrets)
		P.remote_dial = null
	my_turrets = list()
	..()

/obj/structure/prop/prism/reflector
	name = "reflector prism"
	desc = "A box with an internal set of mirrors that reflects all laser beams in a single direction."
	icon_state = "reflector_box"
	icon = 'icons/obj/reflector.dmi'
	silent = TRUE
	free_rotate = FALSE
	anchored = FALSE
	worth_intrinsic = 350

/obj/structure/prop/prism/reflector/attackby(obj/item/I, mob/living/user, list/params, clickchain_flags, damage_multiplier)
	. = ..()
	if(I.is_wrench())
		if(do_after(user,40 * I.tool_speed))
			to_chat(user, SPAN_NOTICE("You [anchored ? "anchor" : "unanchor"] [src]."))
			anchored = !anchored
