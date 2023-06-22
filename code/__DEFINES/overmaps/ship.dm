//* ship control flags
/// allow viewing from ship perspective
#define SHIP_CONTROL_VIEW (1<<0)
/// allow controlling of piloting
#define SHIP_CONTROL_PILOT (1<<1)
/// allow controlling of sensors
#define SHIP_CONTROL_SENSORS (1<<2)
/// allow controlling of shields
#define SHIP_CONTROL_SHIELDS (1<<3)
/// allow controlling of auxillery piloting / motion peripherals like inertia damping
#define SHIP_CONTROL_DYNAMICS (1<<4)
/// allow controlling of FTL
#define SHIP_CONTROL_TRANSIT (1<<5)
/// allow controlling of docking/landing
#define SHIP_CONTROL_DOCKING (1<<6)

DEFINE_BITFIELD(ship_control_flags, list(
	BITFIELD(SHIP_CONTROL_VIEW),
	BITFIELD(SHIP_CONTROL_PILOT),
	BITFIELD(SHIP_CONTROL_SENSORS),
	BITFIELD(SHIP_CONTROL_SHIELDS),
	BITFIELD(SHIP_CONTROL_DYNAMICS),
	BITFIELD(SHIP_CONTROL_TRANSIT),
	BITFIELD(SHIP_CONTROL_DOCKING),
))
