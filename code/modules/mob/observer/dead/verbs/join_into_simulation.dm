//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

// TODO: DECLARE_MOB_VERB
/mob/observer/dead/verb/join_into_simulation()
	set name = "Join Into Simulation"
	set desc = "Join into an available simulation core."
	set category = VERB_CATEGORY_OOC


#warn impl

#if DM_VERSION >= 517
#error remove this already players should've adapted by now
#endif
/mob/observer/dead/verb/join_into_simulation_legacy()
	set name = "Join Into Soulcatcher"
	tgui_alert(src, "Please use 'Join Into Simulation'! This is only provided to ease the \
	transition period for Soulcatchers being remade as Simulation Cores!", "Legacy Verb", list("Okay"))
	join_into_simulation()
