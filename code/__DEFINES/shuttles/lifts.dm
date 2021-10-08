// Lift operating modes
/// Idle
#define LIFT_IDLE					1
/// Moving up
#define LIFT_MOVING_UP				2
/// Moving down
#define LIFT_MOVING_DOWN			3
/// Responding to priority call - ignore floor buttons, only allow one queued destination
#define LIFT_PRIORITY_RESPOND		4
/// Firefighter mode
#define LIFT_FIREFIGHTER_MODE		5

/// Default lift turf
#define LIFT_DEFAULT_WALL				/turf/simulated/wall/elevator
/// Default lift flooring
#define LIFT_DEFAULT_FLOOR				/turf/simulated/floor/tiled/dark
/// Default turbolift door
#define LIFT_DEFAULT_DOOR				/obj/machinery/door/airlock/lift
/// Default turbolift area
#define LIFT_DEFAULT_AREA				/area/turbolift
/// Default arrival sound
#define LIFT_DEFAULT_ARRIVAL_SOUND		null

/// Lift floor wait
#define LIFT_FLOOR_WAIT				(8 SECONDS)
/// Lift default floor transit time for going up
#define LIFT_TRANSIT_TIME_UP		(1 SECONDS)
/// Lift default floor transit time for going down
#define LIFT_TRANSIT_TIME_DOWN		(1 SECONDS)
/// Lockout delay - do not allow occupants to force doors closed for this long after arriving
#define LIFT_FLOOR_WAIT_ENFORCE		(1 SECONDS)
/// Priority call button lockout time
#define LIFT_PRIORITY_LOCKOUT_TIME	(30 SECONDS)

/// Doors open
#define LIFT_DOORS_OPEN				1
/// Doors closed
#define LIFT_DOORS_CLOSED			2
/// Doors are in errored state
#define LIFT_DOORS_ERROR			3
