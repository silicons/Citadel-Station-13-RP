//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 silicons                             *//

//* Objective completion status

/// default - unknown
#define GAME_OBJECTIVE_COMPLETION_UNKNOWN 0
/// got the target/whatever
#define GAME_OBJECTIVE_COMPLETION_SUCCESS 1
/// didn't yet get the target/whatever
#define GAME_OBJECTIVE_COMPLETION_INCOMPLETE 2
/// failed to get the target (e.g. not physically able to anymore)
#define GAME_OBJECTIVE_COMPLETION_FAILURE 3
/// target is no longer valid, but it isn't a failure
#define GAME_OBJECTIVE_COMPLETION_VOIDED 4
/// cataclysmic failure
#define GAME_OBJECTIVE_COMPLETION_BACKFIRED 5

#warn DEFINE_ENUM
