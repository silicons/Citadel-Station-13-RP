//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

#define AI_LOG_LEVEL_TRACE 1
#define AI_LOG_LEVEL_DEBUG 2
#define AI_LOG_LEVEL_INFO 3
#define AI_LOG_LEVEL_WARN 4
#define AI_LOG_LEVEL_FATAL 5

/// Enable debugging mode. This enables the AI debug interface, but will generally cause a decent bit of overhead/lag.
// #define AI_DEBUGGING

/// Enables introspection mode. This is basically a lite version of debugging.
#define AI_INTROSPECTION

#ifdef AI_DEBUGGING
	#define AI_INTROSPECTION
#endif

#ifdef AI_INTROSPECTION
	#define AI_INTROSPECTION_THOUGHT_BUFFER 10
#endif

#define AI_LOG_LEVEL AI_LOG_LEVEL_DEBUG

#if AI_LOG_LEVEL >= AI_LOG_LEVEL_TRACE
	#define AI_LOG_TRACE(HOLDER, MSG) HOLDER.log_ai(MSG)
#else
	#define AI_LOG_TRACE(HOLDER, MSG)
#endif

#if AI_LOG_LEVEL >= AI_LOG_LEVEL_DEBUG
	#define AI_LOG_DEBUG(HOLDER, MSG) HOLDER.log_ai(MSG)
#else
	#define AI_LOG_DEBUG(HOLDER, MSG)
#endif

#if AI_LOG_LEVEL >= AI_LOG_LEVEL_INFO
	#define AI_LOG_INFO(HOLDER, MSG) HOLDER.log_ai(MSG)
#else
	#define AI_LOG_INFO(HOLDER, MSG)
#endif

#if AI_LOG_LEVEL >= AI_LOG_LEVEL_WARN
	#define AI_LOG_WARN(HOLDER, MSG) HOLDER.log_ai(MSG)
#else
	#define AI_LOG_WARN(HOLDER, MSG)
#endif

#if AI_LOG_LEVEL >= AI_LOG_LEVEL_FATAL
	#define AI_LOG_FATAL(HOLDER, MSG) HOLDER.log_ai(MSG)
#else
	#define AI_LOG_FATAL(HOLDER, MSG)
#endif
