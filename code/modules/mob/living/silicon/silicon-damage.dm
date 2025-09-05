//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 silicons                             *//

//* Damage Instance Handling *//

/mob/living/silicon/inflict_damage_instance(SHIELDCALL_PROC_HEADER)
	if(inflict_damage_type_special(args))
		return
	// we only care about those
	switch(damage_type)
		if(DAMAGE_TYPE_BRUTE)
			adjustBruteLoss(damage)
		if(DAMAGE_TYPE_BURN)
			adjustBruteLoss(damage)
