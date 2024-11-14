//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

//* Adapter Types *//

#define AI_ADAPTER_TYPE_ATTACK (1<<0)
#define AI_ADAPTER_TYPE_MANEUVER (1<<1)
#define AI_ADAPTER_TYPE_SPLASH (1<<2)

//* IFF - Results *//

#define AI_IFF_FRIENDLY 3
#define AI_IFF_NEUTRAL 2
#define AI_IFF_HOSTILE 1

//* Telegraph - Priority *//

/// do random crap
#define AI_TELEGRAPH_PRIORITY_BACKGROUND -10
/// use med item
#define AI_TELEGRAPH_PRIORITY_RECOVERY -10
/// throw grenade
#define AI_TELEGRAPH_PRIORITY_ATTACK -5
/// default priority for AI telegraphs
#define AI_TELEGRAPH_PRIORITY_DEFAULT 0
/// livesaving actions
#define AI_TELEGRAPH_PRIORITY_SURVIVAL 5

//* Telegraph - Flags *//

/// do not move
#define AI_TELEGRAPH_FLAG_NO_MOVE (1<<0)

//* Telegraph - Status *//

/// successful telegraph
#define AI_TELEGRAPH_STATUS_SUCCESS 1
/// we were interrupted by a higher priority telegraph or interrupt
#define AI_TELEGRAPH_STATUS_INTERRUPTED 2
/// a higher priority telegraph was already ongoing
#define AI_TELEGRAPH_STATUS_YIELDED 3

//* Ticking *//

/// AI scheduling bucket limit
///
/// this is set to 10 seconds because it is the same duration
/// as the garbage collector,
/// which means things aren't considered to be leaking.
///
/// the AI scheduler does not explicitly clean up references; it just drops things
/// if they're no longer valid during the bucket scan.
#define AI_SCHEDULING_LIMIT (10 SECONDS)

/// AI scheduling bucket limit
///
/// 5 seconds of tolerance is allowed before AI callbacks are dropped.
#define AI_SCHEDULING_TOLERANCE (5 SECONDS)
