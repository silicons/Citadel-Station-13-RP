//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

/atom/movable/on_melee_act(mob/attacker, obj/item/weapon, datum/melee_attack/attack_style, target_zone, datum/event_args/actor/clickchain/clickchain, clickchain_flags)
	. = ..()
	ai_holder?.on_melee_act(attacker, weapon, attack_style, target_zone)

/atom/movable/on_bullet_act(obj/projectile/proj, impact_flags, list/bullet_act_args)
	. = ..()
	ai_holder?.on_bullet_act(proj, impact_flags, bullet_act_args)

/atom/movable/inflict_damage_instance(SHIELDCALL_PROC_HEADER)
	. = ..()
	ai_holder?.on_damage_instance(arglist(args))
