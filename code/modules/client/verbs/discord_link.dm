//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

/client/verb/discord_link()
	set name = "Link Discord Account"
	set category = VERB_CATEGORY_OOC

	var/existing_id = discord_get_linked_id()
	#warn impl
