/**
 * get user effective control flags
 */
/obj/item/rig/proc/get_control_flags(mob/user)

/**
 * sets user effective control flags
 *
 * @return new flags
 */
/obj/item/rig/proc/set_control_flags(mob/user, flags)

#warn impl

/**
 * check if user have ALL control flags specified
 */
/obj/item/rig/proc/check_control_flags(mob/user, flags)
	. = get_control_flags(user)
	return (. & flags) == flags
