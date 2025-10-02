//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

/**
 * ## Impact
 * Disperser shells are treated as semi-simulated hypervelocity hitscan projectiles.
 * This means that they run prediction to see where they should hit when they enter a level,
 * so that they immediately leave and go through the overmap entity if they 'miss'.
 */
/obj/structure/disperser_shell
	name = "disperser shell"
	desc = "A round able to be shot out of most standard disperser cannons."

	/// velocity mult
	var/firing_velocity_mult = 1


#warn impl

/**
 * @return TRUE to delete self and register impact, FALSE to go through the target
 */
/obj/structure/disperser_shell/proc/entrypoint_projectile_traversal(obj/overmap/entity/entity, obj/overmap/entity/projectile/disperser_shell/projectile)
	SHOULD_NOT_OVERRIDE(TRUE)
	SHOULD_NOT_SLEEP(TRUE)
	#warn impl + log impact (including pierce)

/**
 * @return TRUE to delete self and register impact, FALSE to go through the target
 */
/obj/structure/disperser_shell/proc/entrypoint_bombardment_traversal(obj/overmap/entity/entity, obj/overmap/entity/projectile/disperser_shell/projectile)
	SHOULD_NOT_OVERRIDE(TRUE)
	SHOULD_NOT_SLEEP(TRUE)
	#warn impl + log impact (including pierce)

/**
 * @return FALSE to go through the target
 */
/obj/structure/disperser_shell/proc/handle_projectile_traversal(obj/overmap/entity/entity, obj/overmap/entity/projectile/disperser_shell/projectile, turf/predicted_impact, angle)
	return FALSE

/**
 * @return FALSE to go through the target
 */
/obj/structure/disperser_shell/proc/handle_bombardment_traversal(obj/overmap/entity/entity, obj/overmap/entity/projectile/disperser_shell/projectile, turf/predicted_impact)
	return FALSE

/obj/structure/disperser_shell/proc/log_data_list(obj/overmap/entity/projectile/disperser_shell/projectile)
	// THIS ONLY WORKS IF PARENT_TYPE IS NOT OVERRIDDEN ON SUBTYPES!
	return list(
		"type" = copytext("[type]", length("[/obj/structure/disperser_shell]") + 1),
		#warn entity data
		"firerEntity",
		#warn actor
		"firer",
	)
