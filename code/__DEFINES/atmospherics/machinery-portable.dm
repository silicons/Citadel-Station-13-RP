//* /obj/machinery/portable_atmospherics atmos_portable_ui_flags *//

/// view flow
#define ATMOS_PORTABLE_UI_SEE_FLOW (1<<0)
/// toggle on/off
#define ATMOS_PORTABLE_UI_TOGGLE_POWER (1<<1)
/// adjust flow. implies SEE_FLOW.
#define ATMOS_PORTABLE_UI_SET_FLOW (1<<2)
/// adjust power. implies SEE_POWER.
#define ATMOS_PORTABLE_UI_SET_POWER (1<<3)
/// see power
#define ATMOS_PORTABLE_UI_SEE_POWER (1<<4)

DEFINE_BITFIELD(atmos_portable_ui_flags, list(
	BITFIELD(ATMOS_PORTABLE_UI_SEE_FLOW),
	BITFIELD(ATMOS_PORTABLE_UI_TOGGLE_POWER),
	BITFIELD(ATMOS_PORTABLE_UI_SET_FLOW),
	BITFIELD(ATMOS_PORTABLE_UI_SET_POWER),
	BITFIELD(ATMOS_PORTABLE_UI_SEE_POWER),
))
