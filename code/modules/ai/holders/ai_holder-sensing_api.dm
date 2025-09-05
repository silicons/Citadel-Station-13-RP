//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers          *//

/datum/ai_holder/proc/on_melee_act(mob/attacker, obj/item/weapon, datum/melee_attack/style, target_zone)
	return

/datum/ai_holder/proc/on_bullet_act(obj/projectile/proj, impact_flags, list/bullet_act_args)
	return

/datum/ai_holder/proc/on_damage_instance(SHIELDCALL_PROC_HEADER)
	return

/**
 * 'took damage, retaliate'. this is for procs that aren't hooked into standard defense procs.
 */
/datum/ai_holder/proc/on_legacy_damage_taunt(atom/attacker)
	return
