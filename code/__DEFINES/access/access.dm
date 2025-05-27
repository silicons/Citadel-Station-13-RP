//? Access Regions
//* For custom accesses, use none.
//* Keep this synced with [tgui/packages/tgui/constants/access.ts]

#define ACCESS_REGION_NONE (0)
#define ACCESS_REGION_ALL (~0)
#define ACCESS_REGION_SECURITY (1<<0)
#define ACCESS_REGION_MEDBAY (1<<1)
#define ACCESS_REGION_RESEARCH (1<<2)
#define ACCESS_REGION_ENGINEERING (1<<3)
#define ACCESS_REGION_COMMAND (1<<4)
#define ACCESS_REGION_GENERAL (1<<5)
#define ACCESS_REGION_SUPPLY (1<<6)

// todo: nuke this from orbit
#define DUMB_OLD_ACCESS_REGION_LIST list(ACCESS_REGION_SECURITY, ACCESS_REGION_MEDBAY, ACCESS_REGION_RESEARCH, ACCESS_REGION_ENGINEERING, ACCESS_REGION_COMMAND, ACCESS_REGION_GENERAL, ACCESS_REGION_SUPPLY)

DEFINE_SHARED_BITFIELD(access_region, list(
	"access_region",
	"access_edit_region"
), list(
	BITFIELD(ACCESS_REGION_SECURITY),
	BITFIELD(ACCESS_REGION_MEDBAY),
	BITFIELD(ACCESS_REGION_RESEARCH),
	BITFIELD(ACCESS_REGION_ENGINEERING),
	BITFIELD(ACCESS_REGION_COMMAND),
	BITFIELD(ACCESS_REGION_GENERAL),
	BITFIELD(ACCESS_REGION_SUPPLY),
))

GLOBAL_LIST_INIT(access_region_names, list(
	"[ACCESS_REGION_GENERAL]" = "General",
	"[ACCESS_REGION_COMMAND]" = "Command",
	"[ACCESS_REGION_SECURITY]" = "Security",
	"[ACCESS_REGION_ENGINEERING]" = "Engineering",
	"[ACCESS_REGION_MEDBAY]" = "Medical",
	"[ACCESS_REGION_RESEARCH]" = "Science",
	"[ACCESS_REGION_SUPPLY]" = "Supply",
))

//? Access Types
//* For custom accesses, use none.
//* Keep this synced with [tgui/packages/tgui/constants/access.ts]

#define ACCESS_TYPE_NONE (0)
#define ACCESS_TYPE_ALL (~0)
#define ACCESS_TYPE_CENTCOM (1<<0)
#define ACCESS_TYPE_STATION (1<<1)
#define ACCESS_TYPE_SYNDICATE (1<<2)
#define ACCESS_TYPE_PRIVATE (1<<3)

DEFINE_SHARED_BITFIELD(access_type, list(
	"access_type",
	"access_edit_type"
), list(
	BITFIELD(ACCESS_TYPE_CENTCOM),
	BITFIELD(ACCESS_TYPE_STATION),
	BITFIELD(ACCESS_TYPE_SYNDICATE),
	BITFIELD(ACCESS_TYPE_PRIVATE),
))

GLOBAL_LIST_INIT(access_type_names, list(
	"[ACCESS_TYPE_CENTCOM]" = "Central Command",
	"[ACCESS_TYPE_STATION]" = "Station",
	"[ACCESS_TYPE_SYNDICATE]" = "Mercenary",
	"[ACCESS_TYPE_PRIVATE]" = "Unknown",
))

//? Access Values - constants & datums                ?//
//! DEFINE NUMBERS MUST NEVER CHANGE                  !//
//* Otherwise all maps break.                         *//
//* MAPPERS: This is also where you find your values! *//

//--------------------------------------------------------------------------------------------------//
//--------------------------------------------------------------------------------------------------//
//? THE CURRENT HIGHEST IS 307. UPDATE THIS VALUE AS NEEDED. ADD CONTINUOUSLY, DO NOT SKIP VALUES. ?//
//--------------------------------------------------------------------------------------------------//
//--------------------------------------------------------------------------------------------------//

// When oh when will we escape the tyranny of number enums?
// todo: eventually we'll want a script for "migrating" access in .dmms. if that's, y'know, even possible
//       when we do this however it has to be a "do this once and never again" deal
//       as it's bound to break stuff.

#warn require leading / on type
#warn namespace

#define STANDARD_ACCESS_DATUM(key, value, type, desc) \
/datum/prototype/access/##type { \
	access_name = desc; \
	access_key = key; \
	access_numeric_legacy_key = value; \
} \
/datum/prototype/access/##type

#warn audit ids, there's dupes. also, namespaces.
