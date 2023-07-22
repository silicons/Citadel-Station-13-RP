/obj/item/card/fluff

/obj/item/card/fluff/license
	name = "license to be horny on main"
	desc = "What???"

	/// owner name
	var/owner_name = "nobody"

/obj/item/card/fluff/license/examine(mob/user, dist)
	. = ..()
	if(dist <= 2)
		. += SPAN_NOTICE("It appears to be owned by [owner_name]")

/obj/item/card/fluff/license/forklift
	name = "forklift license"
	desc = "A license certifying someone to be capable of 'safely' operating a forklift."

#warn impl all, icons

