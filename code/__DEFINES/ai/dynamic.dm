//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

#define AI_DYNAMIC_PREEMPT_IDLE 1
#define AI_DYNAMIC_PREEMPT_RECOVERY 2
#define AI_DYNAMIC_PREEMPT_MANEUVER 3
#define AI_DYNAMIC_PREEMPT_COMBAT 4
#define AI_DYNAMIC_PREEMPT_ABSOLUTE 5

/// is steering towards a chase target
#define AI_DYNAMIC_STEERING_FOR_CHASE (1<<0)
/// is steering towards a general automated route, like a patrol
#define AI_DYNAMIC_STEERING_FOR_ROUTE (1<<1)
/// is steering towards a follow target
#define AI_DYNAMIC_STEERING_FOR_FOLLOW (1<<2)
/// is steering towards random idle maneuvers
/// * different from 'route' as idle maneuvers should be
///   low overhead and not use resources.
#define AI_DYNAMIC_STEERING_FOR_IDLE (1<<3)
