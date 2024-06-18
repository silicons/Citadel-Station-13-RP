//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 silicons                             *//

//* Dirt *//

/// max dirt tracked on mob
#define DIRT_TRACK_CAPACITY_MOB 1500
/// max dirt tracked on shoes
#define DIRT_TRACK_CAPACITY_SHOES 6000
/// % of dirt to leave behind when stepping on a turf
#define DIRT_TRACK_DROP_RATIO_MOB (1 / 20)
/// % of dirt to leave behind when stepping on a turf
#define DIRT_TRACK_DROP_RATIO_SHOES (1 / 20)
/// % of dirt to pick up when stepping on a turf
#define DIRT_TRACK_PICKUP_RATIO_SHOES (1 / 10)
/// % of dirt to pick up when stepping on a turf
#define DIRT_TRACK_PICKUP_RATIO_MOB (1 / 10)
/// % of remaining capacity we can pick up at once
#define DIRT_TRACK_PICKUP_LIMITER_SHOES (1 / 10)
/// % of remaining capacity we can pick up at once
#define DIRT_TRACK_PICKUP_LIMITER_MOB (1 / 10)
/// amount we can always pick up despite limiter
#define DIRT_TRACK_PICKUP_ALWAYS_SHOES 50
/// amount we can always pick up despite limiter
#define DIRT_TRACK_PICKUP_ALWAYS_MOB 50

/// max dirt on a tile
#define DIRT_TILE_CAPACITY 1000
/// dirt at which the dirt object is created
#define DIRT_TILE_VISIBLE 200
/// dirt at which visibility is maximum
#define DIRT_TILE_MAXIMUM_VISIBILITY 700
/// dirt at which we persist
#define DIRT_TILE_MINIMUM_PERSIST 1
