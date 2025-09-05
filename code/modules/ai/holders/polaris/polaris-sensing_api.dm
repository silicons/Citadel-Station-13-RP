
/datum/ai_holder/polaris/on_melee_act(mob/attacker, obj/item/weapon, datum/melee_attack/style, target_zone)
	react_to_attack(attacker)

/datum/ai_holder/polaris/on_bullet_act(obj/projectile/proj, impact_flags, list/bullet_act_args)
	if(ismob(proj.firer))
		react_to_attack(proj.firer)

/datum/ai_holder/polaris/on_damage_instance(SHIELDCALL_PROC_HEADER)
	if(attack_type & (ATTACK_TYPE_PROJECTILE | ATTACK_TYPE_MELEE))
		// already handled
		return
	switch(attack_type)
		if(ATTACK_TYPE_THROWN)
			var/datum/thrownthing/thrown = attack_source
			if(ismob(thrown?.thrower))
				react_to_attack(thrown.thrower)
		if(ATTACK_TYPE_TOUCH)
			var/datum/event_args/actor/clickchain/clickchain = attack_source
			if(clickchain)
				react_to_attack(clickchain.performer)

/datum/ai_holder/polaris/on_legacy_damage_taunt(atom/attacker)
	if(ismob(attacker))
		react_to_attack(attacker)
