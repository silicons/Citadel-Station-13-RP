//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 silicons                             *//

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

//* /datum/ai_callback *//

/// didn't get fired yet
#define AI_CALLBACK_PENDING 0
/// invoked, whether or not it succeeded
#define AI_CALLBACK_FINISHED 1
/// dropped for one reason or another
#define AI_CALLBACK_DROPPED 2
