// air_status on /turf
/// Normal, fully simulated turf
#define TURF_AIR_SIMULATED			1
/// Turf air is immutable.
#define TURF_AIR_IMMUTABLE			2
/// Turf doesn't have air and doesn't allow air to pass
#define TURF_AIR_BLOCKED			3

// Bitflag values for c_airblock()
#define AIR_BLOCKED 1	// Blocked
#define ZONE_BLOCKED 2	// Not blocked, but zone boundaries will not cross.
#define BLOCKED 3		// Blocked, zone boundaries will not cross even if opened.

#define ZONE_MIN_SIZE 14 // Zones with less than this many turfs will always merge, even if the connection is not direct
