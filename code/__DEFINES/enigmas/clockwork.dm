//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 silicons                             *//

//* Helpers *//

#define CLOCKWORK_DESCRIPTION(PATH, NAME, DESC_OR_LIST) \
##PATH/examine(mob/user, dist) { \
	. = ..(); \
}
#warn deal with name / desc

//* Invocations *//

/// targets mobs
#define CLOCKWORK_INVOCATION_TARGET_MOBS (1<<0)
/// targets objs
#define CLOCKWORK_INVOCATION_TARGET_OBJS (1<<1)
/// targets turfs
#define CLOCKWORK_INVOCATION_TARGET_TURFS (1<<2)
/// can only target yourself if targeting mobs
/// if objs / turfs are allowed, this won't block those.
#define CLOCKWORK_INVOCATION_TARGET_ONLY_SELF_FOR_MOB (1<<3)
/// requires Reachability()
#define CLOCKWORK_INVOCATION_TARGET_CHECK_REACHABILITY (1<<4)

DEFINE_BITFIELD_NEW(clockwork_invocation_targeting, list(
	/datum/clockwork_invocation = list(
		NAMEOF_STATIC(/datum/clockwork_invocation, target_validity_flags),
	),
), list(
	BITFIELD_NEW("Targets Mobs", CLOCKWORK_INVOCATION_TARGET_MOBS),
	BITFIELD_NEW("Targets Objs", CLOCKWORK_INVOCATION_TARGET_OBJS),
	BITFIELD_NEW("Targets Turfs", CLOCKWORK_INVOCATION_TARGET_TURFS),
	BITFIELD_NEW("Mob - Only Self", CLOCKWORK_INVOCATION_TARGET_ONLY_SELF_FOR_MOBS),
	BITFIELD_NEW("All - Reachability()", CLOCKWORK_INVOCATION_TARGET_CHECK_REACHABILITY),
))

/// heals
#define CLOCKWORK_INVOCATION_HINT_HEALS (1<<0)
/// harms
#define CLOCKWORK_INVOCATION_HINT_HARMS (1<<1)
/// stuns
#define CLOCKWORK_INVOCATION_HINT_STUNS (1<<2)
/// mends (machinery heal)
#define CLOCKWORK_INVOCATION_HINT_MENDS (1<<3)
/// damages (machinery harm)
#define CLOCKWORK_INVOCATION_HINT_BREAKS (1<<4)

DEFINE_BITFIELD_NEW(clockwork_invocation_targeting, list(
	/datum/clockwork_invocation = list(
		NAMEOF_STATIC(/datum/clockwork_invocation, effect_hint_flags),
	),
), list(
	BITFIELD_NEW("Heals (Mobs)", CLOCKWORK_INVOCATION_HINT_HEALS),
	BITFIELD_NEW("Harms (Mobs)", CLOCKWORK_INVOCATION_HINT_HARMS),
	BITFIELD_NEW("Stuns (Mobs)", CLOCKWORK_INVOCATION_HINT_STUNS),
	BITFIELD_NEW("Mends (Machinery Heal)", CLOCKWORK_INVOCATION_HINT_MENDS),
	BITFIELD_NEW("Breaks (Machinery Harm)", CLOCKWORK_INVOCATION_HINT_BREAKS),
))

//* Integration Cog - Preset Hostility *//

/// this is a stealthy preset
#define CLOCKWORK_INTEGRATION_PRESET_STEALTH 1
/// this is a normal / cooperative preset
#define CLOCKWORK_INTEGRATION_PRESET_COOPERATIVE 2
/// this is a hostile preset
#define CLOCKWORK_INTEGRATION_PRESET_HOSTILE 3

//* Recognition Query Response *//
// used by:
// - clockwork_user_recognition_query

/// don't know what this is at all
#define CLOCKWORK_RECOGNITION_NONE 0
/// know this is a clockwork item
#define CLOCKWORK_RECOGNITION_KNOWS_ABOUT_ORIGIN 1
/// know the name of this item
#define CLOCKWORK_RECOGNITION_KNOWS_NAME 2
/// know the function of this item
#define CLOCKWORK_RECOGNITION_KNOWS_FUNCTION 3
