//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

/**
 * Outbound API.
 *
 * This file is for procs for AI holders to call on their actors to request certain things.
 *
 * * This does not imply data flow is outbound, only that we're calling out to the actor.
 */

//* adapters *//
//* /datum/

/atom/movable/proc/request_intrinsic_attack_adapters()
/atom/movable/proc/request_intrinsic_defense_adapters()
/atom/movable/proc/request_intrinsic_recovery_adapters()
/atom/movable/proc/request_intrinsic_maneuvering_adapters()

/atom/movable/proc/request_equipped_attack_adapters()
/atom/movable/proc/request_equipped_defense_adapters()
/atom/movable/proc/request_equipped_recovery_adapters()
/atom/movable/proc/request_equipped_maneuvering_adapters()

#warn impl
