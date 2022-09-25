/obj/item/rig
	/// activation state
	var/activation_state = RIG_ACTIVATION_OFF

// activation - bit of a misnomer: this is actually whether or not the rig is attached/sealed to you
/**
 * set current activation state to
 */
/obj/item/rig/proc/set_activation_state(new_state)
	activation_state = new_state
	#warn automatically unseal if needed

/obj/item/rig/proc/is_activated()
	return activation_state == RIG_ACTIVATION_ON

/obj/item/rig/proc/is_activating()
	return activation_state == RIG_ACTIVATION_STARTUP

/obj/item/rig/proc/is_deactivating()
	return activation_state == RIG_ACTIVATION_SHUTDOWN

/obj/item/rig/proc/is_cycling()
	return activation_state == RIG_ACTIVATION_STARTUP || activation_state == RIG_ACTIVATION_SHUTDOWN

/**
 * online - whether or not the rig is semantically online. a completely depowered suit can be activated but not online.
 */
/obj/item/rig/proc/is_online()
	return is_activated() && cell?.charge

/**
 * finishes activation sequence
 *
 * @params
 * - auto_deploy - automatically extend and start sealing pieces
 * - instant_deploy - seal is instant
 * - forceful_deploy - deploy will knock things out of slots if they can be unequipped
 */
/obj/item/rig/proc/activate(auto_deploy = FALSE, instant_deploy = FALSE, forceful_deploy = FALSE)

/**
 * finishes deactivation sequence
 * unseal is ALWAYS instant.
 *
 * @params
 * - auto_retract - automatically retract pieces
 */
/obj/item/rig/proc/deactivate(auto_undeploy = FALSE)

#warn impl


/// hook - automatically deactivate if dropped
/obj/item/rig/dropped(mob/user, flags, atom/newLoc)
	. = ..()
	reset()
	// todo: above is utter shitcode fuck springtrap suits rigs need refactored


// todo: the rest of activation logic should be refactored and put in this file
