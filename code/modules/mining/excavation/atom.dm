/**
 * excavation - "horizontal" mining, breaking rock walls
 * now generic'd to allow for future hooking
 *
 * the archeology system hooks into this.
 */

/**
 * allow drilling
 * if called with a user, the user tried to start drilling with a physical tool
 * feedback/aftereffects are allowed, this doesn't have to be a pure proc
 */
/atom/proc/CanExcavate(obj/item/pickaxe/P, excavation_level, mob/user)
	return CANT_EXCAVATE

/**
 * called when someone starts excavating us for feedback
 */
/atom/proc/BeginExcavating(obj/item/pickaxe/P, excavation_level, mob/user)
	return

/**
 * what happens when we are excavated x level (number) by y tool and z user
 */
/atom/proc/Excavated(obj/item/pickaxe/P, excavation_level, mob/user)
	return
