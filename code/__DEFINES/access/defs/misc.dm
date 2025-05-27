#warn audit ids, there's dupes. also, namespaces.

//? Syndicate

#define ACCESS_FACTION_SYNDICATE 150//General Syndicate Access
STANDARD_ACCESS_DATUM("syndicate", ACCESS_FACTION_SYNDICATE, faction/syndicate, "Syndicate")

//? Pirate

#define ACCESS_FACTION_PIRATE 168//Pirate Crew Access (Blackbeard was born in 1680.)
STANDARD_ACCESS_DATUM("pirate", ACCESS_FACTION_PIRATE, faction/pirate, "Pirate")

//? Alien

#define ACCESS_FACTION_ALIEN 300 // For things like crashed ships.
STANDARD_ACCESS_DATUM("alien", ACCESS_FACTION_ALIEN, faction/alien, "Alien")

//? Talon

#define ACCESS_FACTION_TALON 301
STANDARD_ACCESS_DATUM("talon", ACCESS_FACTION_TALON, faction/talon, "Talon")

//? Misc

#define ACCESS_MISC_CASHCRATE 200
STANDARD_ACCESS_DATUM("cashcrate", ACCESS_MISC_CASHCRATE, misc/cashcrate, "Cash Crates")

//* SPECIAL *//

//? Silicons

#define ACCESS_SPECIAL_SILICONS 199
STANDARD_ACCESS_DATUM("silicons", ACCESS_SPECIAL_SILICONS, special/silicons, "Synthetic")

// Network

#define ACCESS_NETWORK 404
STANDARD_ACCESS_DATUM(ACCESS_NETWORK, misc/network, "Network")
