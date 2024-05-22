//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 silicons                             *//

/**
 * holder datum for clockwork knowledge data
 *
 * var descriptions are written semi-ic to set the theme / intent
 * things are very carefully worded.
 *
 * entity = clockwork technology of some kind
 * actor = someone using or directing it
 * intended = **what the user wants to do**, not necessarily what it is supposed to do
 * non-negative = "it shot my friends but not me because it's non-negative towards me :D"
 */
/datum/clockwork_knowledge
	/// last time we did an integration cog search
	var/tmp/integration_last_search
	/// how many integration cogs we found that's considered a 'legitimate' find
	var/integration_legitimate_found = 0
	/// how many integration cogs we found that's considered a 'spammed' find
	var/integration_spam_found = 0
	/// how much we've been spamming integration cog searches
	var/tmp/integration_search_penalty = 0
