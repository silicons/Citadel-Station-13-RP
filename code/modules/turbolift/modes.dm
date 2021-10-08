/**
 * Sets our mode
 */
/datum/turbolift/proc/set_mode(mode)
	var/old_mode = src.mode
	src.mode = mode
	update_appearance(old_mode)
	update_ambience(old_mode)
	if(mode == LIFT_IDLE)
		STOP_PROCESSING(SSfastprocess, src)
	else
		START_PROCESSING(SSfastprocess, src)

/**
 * Checks if we're in firefighter mode
 */
/datum/turbolift/proc/is_firefighter_mode()
	return mode == LIFT_FIREFIGHTER_MODE

/**
 * Enters firefighter mode
 */
/datum/turbolift/proc/enter_firefighter_mode(mob/user)
	set_mode(LIFT_FIREFIGHTER_MODE)

/**
 * Exits firefighter mode
 */
/datum/turbolift/proc/exit_firefighter_mode

/**
 * Checks if we're in the middle of a priority call
 */
/datum/turbolift/proc/
