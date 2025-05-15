//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

/**
 * Initiate a discord linking prompt.
 */
/client/proc/discord_initiate_linking()
	var/existing_id = discord_get_linked_id()

	var/datum/db_query/link_query = SSdbcore.NewQuery(
		,
		,
	)

/**
 * Get the id (snowflake) of our linked discord account.
 */
/client/proc/discord_get_linked_id()

	var/datum/db_query/lookup_query = SSdbcore.NewQuery(
		,
		,
	)


#warn impl all
