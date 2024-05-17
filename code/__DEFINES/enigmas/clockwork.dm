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

#warn DEFINE_BITFIELD target_validity_flags on /datum/clockwork_invocation

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

#warn DEFINE_BITFIELD effect_hint_flags on /datum/clockwork_invocation
