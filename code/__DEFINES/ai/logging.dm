//! ai log levels
/// Don't show anything.
#define AI_LOG_OFF		0
/// Show logs of things likely causing the mob to not be functioning correctly.
#define AI_LOG_ERROR	1
/// Show less serious but still helpful to know issues that might be causing things to work incorrectly.
#define AI_LOG_WARNING	2
/// Important regular events, like selecting a target or switching stances.
#define AI_LOG_INFO		3
/// More detailed information about the flow of execution.
#define AI_LOG_DEBUG	4
/// Even more detailed than the last. Will absolutely flood your chatlog.
#define AI_LOG_TRACE	5

//! ai log config
/// current max ai debug level. debug statements below this will not be compiled in for speed
#define MAXIMUM_AI_DEBUG_LEVEL AI_LOG_TRACE

//! ai log macros - run from inside ai_holder
#if MAXIMUM_AI_DEBUG_LEVEL > AI_LOG_OFF

#else

#endif

#warn finish

#if MAXIMUM_AI_DEBUG_LEVEL > AI_LOG_ERROR
	#define ai_log_error(t) if(log_level > AI_LOG_ERROR) log("")
	#define ai_log_error_on(h, t)
#else

#endif

#if MAXIMUM_AI_DEBUG_LEVEL > AI_LOG_WARNING

#else

#endif

#if MAXIMUM_AI_DEBUG_LEVEL > AI_LOG_INFO

#endif

#if MAXIMUM_AI_DEBUG_LEVEL > AI_LOG_DEBUG

#endif

#if MAXIMUM_AI_DEBUG_LEVEL > AI_LOG_TRACE

#endif
