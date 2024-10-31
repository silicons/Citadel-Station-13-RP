# Mapping Module

## Contents

- `dmm_suite` - The softcode maploader used by the game. Has a global mutex; only one map can be loaded at a time. Contains support for map injections to be applied before and after initializations.
- `map_helpers` - `/obj/map_helper`'s that can hook map initializations on load; this is the intended way of interacting with the maploader from the `/atom` level.
- `map_injection` - `/datum/map_injection`'s that can modify the loaded map before atom initializations are fired.
- `map_generation` - A modular system for generating content. Supports generating new levels, overlaying generations onto existing levels, and more.
- `spawner` - obj's meant for spawning other obj's, sets of objs, etc. Can be used in both mapload context and used during the round.
- `utility` - external things included in mapping module, but technically not part of the mapping suite.
- `.` - The root folder contains definitions of maps, map levels, map templates, and turf reservations - the four building blocks of map orchestration in the codebase.

## Root

- `map.dm` - A map, which is a collection of map levels. Maps are unique, and can only be loaded once; they are meant for hardcoded things (though their contents can be procedurally generated if needed).
- `map_level.dm` - A single z-level; contains descriptors for a z-level, orchestration, handling, etc. They can exist as part of a map and/or struct, or without either; all z-levels in the server will always have a `/datum/map_level` associated with it for global state tracking.
- `map_template.dm` - A system for describing map chunks, including loadable shuttles.
- `map_struct.dm` - A system for describing the physical structure of a collection of levels. This can / can not be done as part of a map. All game systems, including overmaps, and more, will generally use map structs for orchestration, as `/datum/map` is not something meant to be 'visible' to the rest of the game.
