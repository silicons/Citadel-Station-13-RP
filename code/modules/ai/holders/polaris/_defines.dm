// Defines for the ai_intelligence var.
// Controls if the mob will do 'advanced tactics' like running from grenades.
/// Be dumber than usual.
#define POLARIS_AI_DUMB			1
/// Default level.
#define POLARIS_AI_NORMAL		2
/// Will do more processing to be a little smarter, like not walking while confused if it could risk stepping randomly onto a bad tile.
#define POLARIS_AI_SMART		3
#define polaris_ai_log(M,V)	if(debug_ai) polaris_ai_log_output(M,V)

// Logging level defines.
/// Don't show anything.
#define POLARIS_AI_LOG_OFF		0
/// Show logs of things likely causing the mob to not be functioning correctly.
#define POLARIS_AI_LOG_ERROR	1
/// Show less serious but still helpful to know issues that might be causing things to work incorrectly.
#define POLARIS_AI_LOG_WARNING	2
/// Important regular events, like selecting a target or switching stances.
#define POLARIS_AI_LOG_INFO		3
/// More detailed information about the flow of execution.
#define POLARIS_AI_LOG_DEBUG	4
/// Even more detailed than the last. Will absolutely flood your chatlog.
#define POLARIS_AI_LOG_TRACE	5
// Results of pre-movement checks.
// Todo: Move outside AI code?
/// Recently moved and needs to try again soon.
#define POLARIS_AI_MOVEMENT_ON_COOLDOWN	-1
/// Move() returned false for whatever reason and the mob didn't move.
#define POLARIS_AI_MOVEMENT_FAILED			0
/// Move() returned true and the mob hopefully moved.
#define POLARIS_AI_MOVEMENT_SUCCESSFUL		1
