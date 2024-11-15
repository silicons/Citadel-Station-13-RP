//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

//* Adapter Types *//

#define AI_ADAPTER_TYPE_ATTACK (1<<0)
#define AI_ADAPTER_TYPE_MANEUVER (1<<1)
#define AI_ADAPTER_TYPE_SPLASH (1<<2)

//* Return Status *//

/// success
#define AI_ADAPTER_STATUS_SUCCESS 1
/// generic fail
#define AI_ADAPTER_STATUS_FAIL 2

/// unknown failure
#define AI_ADAPTER_FAIL_UNKNOWN 1
/// on cooldown, check cooldown variable
#define AI_ADAPTER_FAIL_COOLDOWN 2
/// no available attack vector
#define AI_ADAPTER_FAIL_BLOCKED 3
/// out of range
#define AI_ADAPTER_FAIL_BAD_RANGE 4
