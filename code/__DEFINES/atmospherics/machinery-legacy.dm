//! legacy

// Will not bother pumping or filtering if the gas source as fewer than this amount of moles, to help with performance.
#define MINIMUM_MOLES_TO_PUMP		0.00001
#define MINIMUM_MOLES_TO_FILTER		0.00001
#define MINIMUM_MOLES_TO_SCRUB		0.00001
// fire sparking
#define MINIMUM_MOLES_TO_SPARK		0.015

// The flow rate/effectiveness of various atmos devices is limited by their internal volume,
// so for many atmos devices these will control maximum flow rates in L/s.
/// Liters.
#define ATMOS_DEFAULT_VOLUME_PUMP   200
/// L.
#define ATMOS_DEFAULT_VOLUME_FILTER 200
/// L.
#define ATMOS_DEFAULT_VOLUME_MIXER  200
