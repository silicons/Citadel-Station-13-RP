// hardness

/// default pickaxe hardness
#define PICKAXE_HARDNESS_DEFAULT				5

/// default rock hardness
#define MINERAL_HARDNESS_DEFAULT				5

/// calculation for speed based on hardness
#define MINING_HARDNESS_SPEED_CALC(base_speed, difference)		(base_speed * 1.3 ** difference - (base_speed * 0.3) * SIGN(difference))

// excavation levels - units are cm

/// max excavation level for a turf
#define EXCAVATION_LEVEL_MAX_TURF				200
/// max excavation level for a boulder (usually used for large finds)
#define EXCAVATION_LEVEL_MAX_BOULDER			100
/// default excavation level for pickaxes meant to destroy the whole turf
#define EXCAVATION_LEVEL_MINING_TOOLS			200

// ret vals
/// can't excavate
#define CANT_EXCAVATE							-1
