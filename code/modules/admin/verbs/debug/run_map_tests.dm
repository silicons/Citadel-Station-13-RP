//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

// todo: new admin verb system

#warn put into admin verbs
/client/proc/run_map_tests()
	// todo: #define'd category
	set category = "Debug"
	set name = "Run Map Tests"
	set desc = "Run map tests."

	if(!check_rights(R_DEBUG))
		return

	if(alert(usr, "Are you sure you want to run map tests? These are very laggy.", "Map Testing", "No", "Yes") != "Yes")
		return

	log_and_message_admins("[key_name(usr)] has initiated automated map testing.")

	#warn impl
