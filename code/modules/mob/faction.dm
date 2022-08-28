/mob/proc/check_faction_any(mob/other)
	return islist(other.faction)? (other.faction & faction) : (islist(faction)? (faction & other) : faction == other)

/mob/proc/check_faction_all(mob/other)
	#warn impl

/mob/proc/set_faction(list/faction_or_list)

/mob/proc/add_faction(list/faction_or_list)

/mob/proc/remove_faction(list/faction_or_list)

/mob/proc/assert_self_faction()
	#warn add mob tag of self faction
