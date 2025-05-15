/**
 * Boot sequence. Currently runs via spinlocks, including on sub-procs.
 */
/client/proc/boot()
	if(!pre_authenticate())
		pass()
	if(!authenticate())
		pass()
	if(!post_authenticate())
		pass()
	if(!pre_initialize())
		pass()
	if(!initialize())
		pass()
	if(!post_initialize())
		pass()
	on_ready()
	#warn on fail, check if already kicked; otherwise kick with a message.

//* Stages *//

/client/proc/pre_authenticate()
	PRIVATE_PROC(TRUE)
	return TRUE

/client/proc/authenticate()
	PRIVATE_PROC(TRUE)

	#warn handle auth
	#warn handle admin binding

	return TRUE

/client/proc/post_authenticate()
	PRIVATE_PROC(TRUE)
	return TRUE

/client/proc/pre_initialize()
	PRIVATE_PROC(TRUE)

	if(!boot_version_check())
		return FALSE
	return TRUE

/client/proc/initialize()
	PRIVATE_PROC(TRUE)

	persistent = resolve_client_data(ckey, key)
	player = resolve_player_data(ckey, key)

	return TRUE

/client/proc/post_initialize()
	PRIVATE_PROC(TRUE)
	return TRUE

/client/proc/on_ready()
	PRIVATE_PROC(TRUE)

	if(holder)
		add_admin_verbs()
		admin_memo_show()
		// to_chat(src, get_message_output("memo"))
		// adminGreet()

	if(custom_event_msg && custom_event_msg != "")
		to_chat(src, "<h1 class='alert'>Custom Event</h1>")
		to_chat(src, "<h2 class='alert'>A custom event is taking place. OOC Info:</h2>")
		to_chat(src, "<span class='alert'>[custom_event_msg]</span>")
		to_chat(src, "<br>")

#warn impl all

//* Helpers *//

/**
 * Disassociate from our current mob.
 */
/client/proc/begin_login_jail()

/**
 * Reassociate to whatever mob we should be in.
 */
/client/proc/end_login_jail()
