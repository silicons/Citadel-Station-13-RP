//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers          *//

/datum/ai_holder/dynamic/on_melee_act(mob/attacker, obj/item/weapon, datum/melee_attack/style, target_zone)
	// TODO: react

/datum/ai_holder/dynamic/on_bullet_act(obj/projectile/proj, impact_flags, list/bullet_act_args)
	// TODO: react

/datum/ai_holder/dynamic/on_damage_instance(SHIELDCALL_PROC_HEADER)
	if(attack_type & (ATTACK_TYPE_PROJECTILE | ATTACK_TYPE_MELEE))
		// already handled
		return
	switch(attack_type)
		if(ATTACK_TYPE_THROWN)
			var/datum/thrownthing/thrown = attack_source
			// TODO: react
		if(ATTACK_TYPE_TOUCH)
			var/datum/event_args/actor/clickchain/clickchain = attack_source
			// TODO: react

/datum/ai_holder/polaris/on_legacy_damage_taunt(atom/attacker)
	// TODO: react
