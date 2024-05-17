//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 silicons                             *//

// todo: /datum/storyteller_faction tbh

GLOBAL_DATUM_INIT(clockwork_alignment_station, /datum/clockwork_alignment/station, new)
GLOBAL_DATUM_INIT(clockwork_alignment_hostile, /datum/clockwork_alignment/hostile, new)
GLOBAL_DATUM_INIT(clockwork_alignment_friendly, /datum/clockwork_alignment/friendly, new)
GLOBAL_DATUM_INIT(clockwork_alignment_others, /datum/clockwork_alignment/others, new)
GLOBAL_DATUM_INIT(clockwork_alignment_halcyon, /datum/clockwork_alignment/halcyon, new)

/datum/clockwork_alignment

/**
 * * 0 = 'no association'
 *
 * @return -1 to 1 for 'fully hostile / going against one another' to 'fully allied / working as one'
 */
/datum/clockwork_alignment/proc/relative_alignment(datum/clockwork_alignment/other)


/datum/clockwork_alignment/station

/datum/clockwork_alignment/hostile

/datum/clockwork_alignment/friendly

/datum/clockwork_alignment/others

/datum/clockwork_alignment/halcyon

