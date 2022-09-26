//? RIG zones
/// Chest
#define RIG_ZONE_CHEST				(1<<0)
/// Head
#define RIG_ZONE_HEAD				(1<<1)
/// Left leg
#define RIG_ZONE_LEFT_LEG			(1<<2)
/// Right leg
#define RIG_ZONE_RIGHT_LEG			(1<<3)
/// Left foot
#define RIG_ZONE_LEFT_FOOT			(1<<4)
/// Right foot
#define RIG_ZONE_RIGHT_FOOT			(1<<5)
/// Left arm
#define RIG_ZONE_LEFT_ARM			(1<<6)
/// Right arm
#define RIG_ZONE_RIGHT_ARM			(1<<7)
/// Left hand
#define RIG_ZONE_LEFT_HAND			(1<<8)
/// Right hand
#define RIG_ZONE_RIGHT_HAND			(1<<9)
/// Groin (lower body)
#define RIG_ZONE_GROIN				(1<<10)

//? Standard RIG zones

#define RIG_ZONES_HELMET			(RIG_ZONE_HEAD)
#define RIG_ZONES_CHESTPIECE		(RIG_ZONE_CHEST | RIG_ZONE_GROIN)
#define RIG_ZONES_GAUNTLETS			(RIG_ZONE_LEFT_ARM | RIG_ZONE_RIGHT_ARM | RIG_ZONE_LEFT_HAND | RIG_ZONE_RIGHT_HAND)
#define RIG_ZONES_BOOTS				(RIG_ZONE_LEFT_LEG | RIG_ZONE_RIGHT_LEG | RIG_ZONE_LEFT_FOOT | RIG_ZONE_RIGHT_FOOT)

//? Standard RIG piece layering

#define RIG_PIECE_LAYER_OUTER		2
#define RIG_PIECE_LAYER_INNER		1
