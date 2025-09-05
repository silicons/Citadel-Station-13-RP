//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station developers.          *//

/// can be used to attack
#define AI_ADAPTER_BROADPHASE_OFFENSIVE (1<<0)
/// can be used to move somewhere
#define AI_ADAPTER_BROADPHASE_MOBILITY (1<<1)
/// can be used to heal from injury
#define AI_ADAPTER_BROADPHASE_RECOVERY (1<<2)

/// can keep using
#define AI_ADAPTER_RETURN_SUCCESS -1
/// drop adapter
/// * the adapter must drop the adapter
#define AI_ADAPTER_RETURN_INVALID -2
/// try again in a moment, do not need to switch weapons
#define AI_ADAPTER_RETURN_RETRY -3
/// try again way later
/// * the ai holder is allowed to just drop the adapter for now, it's
///   implementation defined
#define AI_ADAPTER_RETURN_BACKOFF -4

//* offensive *//

/// attempting to find a less lethal option
#define AI_ADAPTER_OFFENSIVE_FLAG_LESSLETHAL (1<<0)
/// allow melee / 'proximity required' adapters
/// * put this on adapters that work in melee
/// * scan for this if you want to require adapters that accept melee also
#define AI_ADAPTER_OFFENSIVE_FLAG_PROXIMITY (1<<1)
/// allow melee / 'proximity required' adapters exclusively
/// * put this on adapters that require melee
/// * scan for this if you want melee-only adapters
/// * adapters should always put on `PROXIMITY` if this is enabled, generally
#define AI_ADAPTER_OFFENSIVE_FLAG_MELEE (1<<2)

//* locomotion *//

/// require going somewhere immediately, skipping tiles inbetween
#define AI_ADAPTER_LOCOMOTION_FLAG_TELEPORT (1<<0)

//* recovery *//

#warn impl
