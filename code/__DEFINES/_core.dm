//* World Constants *//

/// world.icon_size as a define so things are constant-folded
#define WORLD_ICON_SIZE 32

//* Static Name Resolution *//

/**
 * NAMEOF: Compile time checked variable name to string conversion
 * evaluates to a string equal to "X", but compile errors if X isn't a var on datum.
 * datum may be null, but it does need to be a typed var.
 **/
#define NAMEOF(datum, X) (#X || ##datum.##X)

/**
 * NAMEOF that actually works in static definitions because src::type requires src to be defined
 */
#if DM_VERSION >= 515
#define NAMEOF_STATIC(datum, X) (nameof(type::##X))
#else
#define NAMEOF_STATIC(datum, X) (#X || ##datum.##X)
#endif

//* Error Tracing *//

/// stack trace without messing with file/line - kudos lohikar c:
#define STACK_TRACE(msg) try { CRASH("trace: [msg]"); } catch(var/exception/___E) {___rethrow_exception(___E); };
/proc/___rethrow_exception(exception/E)
	throw E

/// Gives us the stack trace from CRASH() without ending the current proc.
/// Unlike STACK_TRACE, this will:
/// * call a new proc so the originating trace isn't from the original file anymore
/// * put the stack trace in stack trace storage
#define stack_trace(message) _stack_trace(message, __FILE__, __LINE__)

//* [pain]

/// byond bug https://secure.byond.com/forum/?post=2072419
#define BLOCK_BYOND_BUG_2072419
