//* /obj/machinery/atmospherics/component atmos_component_ui_flags *//

/// allow toggling power
#define ATMOS_COMPONENT_UI_TOGGLE_POWER (1<<0)
/// allow setting power. implies SEE_POWER.
#define ATMOS_COMPONENT_UI_SET_POWER (1<<1)
/// render power usage
#define ATMOS_COMPONENT_UI_SEE_POWER (1<<2)

DEFINE_BITFIELD(atmos_component_ui_flags, list(
	BITFIELD(ATMOS_COMPONENT_UI_TOGGLE_POWER),
	BITFIELD(ATMOS_COMPONENT_UI_SET_POWER),
	BITFIELD(ATMOS_COMPONENT_UI_SEE_POWER),
))
