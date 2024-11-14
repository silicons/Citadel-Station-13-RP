//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

/// Enable debugging mode. This enables the AI debug interface, but will generally cause a decent bit of overhead/lag.
// #define AI_DEBUGGING

#ifdef AI_DEBUGGING
	#define AI_DEBUGGING_ENABLED TRUE
#else
	#define AI_DEBUGGING_ENABLED FALSE
#endif

// todo: log levels, fill these out

#define AI_LOG_DEBUG(...)
#define AI_LOG_INFO(...)
#define AI_LOG_WARN(...)
#define AI_LOG_ERROR(...)
#define AI_LOG_FATAL(...)
