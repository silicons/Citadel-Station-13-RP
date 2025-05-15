/**
 * Client datum
 *
 * A datum that is created whenever a user joins a BYOND world, one will exist for every active connected
 * player
 *
 * when they first connect, this client object is created and [/client/New] is called
 *
 * When they disconnect, this client object is deleted and [/client/Del] is called
 *
 * All client topic calls go through [/client/Topic] first, so a lot of our specialised
 * topic handling starts here
 *
 * ## BYOND Client Login Proces
 *
 * 1. world.IsBanned() is called by BYOND
 * 2. client/New() is called
 * 3. When client/New() calls ..(), mob.Login() is called by whichever mob owns the client,
 *    or a /mob/new_player is made for them if not.
 * 4. rest of client/New() runs under the ..()
 *
 * ## Citadel Client Login Process
 *
 * We made some modifications.
 *
 * 1. BYOND client login runs. The client is immediately disassociated from the mob it's in
 *    if there is any, pending authentication.
 * 2. client/authenticate() is called to either admit the player as a hub authentication,
 *    or call manual authentication on them.
 * 3. If authentication fails, they are booted.
 * 4. client/initialize() is called after successful authentication to load their data in.
 * 5. If initialization fails, they are booted.
 * 5. client/on_ready() is called after successful initialization, and the new player panel
 *    loads
 */
/client

	/**
	 * This line makes clients parent type be a datum
	 *
	 * By default in byond if you define a proc on datums, that proc will exist on nearly every single type
	 * from icons to images to atoms to mobs to objs to turfs to areas, it won't however, appear on client
	 *
	 * instead by default they act like their own independent type so while you can do istype(icon, /datum)
	 * and have it return true, you can't do istype(client, /datum), it will always return false.
	 *
	 * This makes writing oo code hard, when you have to consider this extra special case
	 *
	 * This line prevents that, and has never appeared to cause any ill effects, while saving us an extra
	 * pain to think about
	 *
	 * This line is widely considered black fucking magic, and the fact it works is a puzzle to everyone
	 * involved, including the current engine developer, lummox
	 *
	 * If you are a future developer and the engine source is now available and you can explain why this
	 * is the way it is, please do update this comment
	 */
	parent_type = /datum
	show_verb_panel = FALSE

	//? Connection
	/// queued client security kick
	var/queued_security_kick
	/// currently age gate blocked
	var/age_verification_open = FALSE
	/// panic bunker is still resolving
	var/panic_bunker_pending = FALSE

	//* Actions *//
	/// our action holder
	var/datum/action_holder/action_holder

	//* Authentication *//
	#warn link system
	#warn vv guard
	#warn impl
	/// are we properly authenticated?
	var/authenticated = FALSE
	/// authenticated username
	/// * This should generally be used in place of 'ckey' for when hub auth is down.
	var/authenticated_ckey
	/// strongly authenticated via byond hub, rather than with manual login
	var/authenticated_via_hub = FALSE

	//* Context Menus *//
	/// open context menu
	var/datum/radial_menu/context_menu/context_menu

	//* HUDs *//
	/// active atom HUD providers associated to a list of ids or paths of atom huds that's providing it.
	var/list/datum/atom_hud_provider/atom_hud_providers

	//* Initialization *//
	/// are we ready?
	var/ready = FALSE

	//? Rendering
	/// Click catcher
	var/atom/movable/screen/click_catcher/click_catcher
	/// Parallax holder
	var/datum/parallax_holder/parallax_holder
	/// the perspective we're currently using
	var/datum/perspective/using_perspective
	/// Client global planes
	var/datum/plane_holder/client_global/global_planes

	//* Storage *//
	/// Persistent round-by-round data holder
	var/datum/client_data/persistent
	/// Database data
	var/datum/player_data/player

	//? Viewport
	/// what we *think* their current viewport size is in pixels
	var/assumed_viewport_spx
	/// what we *think* their current viewport size is in pixels
	var/assumed_viewport_spy
	/// what we *think* their current viewport zoom is
	var/assumed_viewport_zoom
	/// what we *think* their current viewport letterboxing setting is
	var/assumed_viewport_box
	/// current view x - for fast access
	var/current_viewport_width
	/// current view y - for fast access
	var/current_viewport_height
	/// if things are manipulating the viewport we don't want other things to touch it
	var/viewport_rwlock = TRUE	//? default block so we can release it during init_viewport
	/// viewport update queued?
	var/viewport_queued = FALSE
	/// forced temporary view
	var/temporary_viewsize_width
	/// forced temporary view
	var/temporary_viewsize_height
	/// temporary view active?
	var/using_temporary_viewsize = FALSE

	//? Datum Menus
	/// menu button statuses
	var/list/menu_buttons_checked = list()
	/// menu group statuses
	var/list/menu_group_status = list()

	//? Preferences
	/// client preferences
	var/datum/game_preferences/preferences

	//? Throttling
	/// block re-execution of expensive verbs
	var/verb_throttle = 0

	//? Cutscenes
	/// active cutscene
	var/datum/cutscene/cutscene
	/// is the cutscene browser in use?
	var/cutscene_browser = FALSE
	/// is the cutscene system init'd?
	var/cutscene_init = FALSE
	/// is the cutscene browser ready?
	var/cutscene_ready = FALSE
	/// cutscene lockout: set after a browser synchronization command to delay the next one
	/// since byond is deranged and will send winsets and browse calls out of order sometimes.
	var/cutscene_lockout = FALSE

	//* UI - Client *//
	/// our tooltips system
	var/datum/tooltip/tooltips
	/// statpanel
	var/datum/client_statpanel/tgui_stat

	//* UI - Map *//
	/// Our action drawer
	var/datum/action_drawer/action_drawer
	/// Our actor HUD holder
	var/datum/actor_hud_holder/actor_huds


		////////////////
		//ADMIN THINGS//
		////////////////
	///Contains admin info. Null if client is not an admin.
	var/datum/admins/holder = null
	var/datum/admins/deadmin_holder = null
	var/buildmode = 0
	///Used for admin AI interaction
	var/AI_Interact = FALSE

	///Contains the last message sent by this client - used to protect against copy-paste spamming.
	var/last_message = ""
	///contins a number of how many times a message identical to last_message was sent.
	var/last_message_count = 0
	///Internal counter for clients sending irc relay messages via ahelp to prevent spamming. Set to a number every time an admin reply is sent, decremented for every client send.
	var/ircreplyamount = 0

		/////////
		//OTHER//
		/////////
	// todo: rename to `preferences` & put it next to `persistent` to sate my OCD ~silicons
	///Player preferences datum for the client
	var/datum/preferences/prefs = null
	///when the client last died as a mouse
	var/time_died_as_mouse = null

		///////////////
		//SOUND STUFF//
		///////////////
	/// world.time when ambience was played to this client, to space out ambience sounds.
	var/time_last_ambience_played = 0

		////////////
		//SECURITY//
		////////////

	var/received_irc_pm = -99999
	///IRC admin that spoke with them last.
	var/irc_admin
	var/mute_irc = 0

		////////////////////////////////////
		//things that require the database//
		////////////////////////////////////

	preload_rsc = PRELOAD_RSC

	///Last ping of the client
	var/lastping = 0
	///Average ping of the client
	var/avgping = 0

	///Used for limiting the rate of topic sends by the client to avoid abuse
	var/list/topiclimiter
	///Used for limiting the rate of clicks sends by the client to avoid abuse
	var/list/clicklimiter

 	///world.time they connected
	var/connection_time
 	///world.realtime they connected
	var/connection_realtime
 	///world.timeofday they connected
	var/connection_timeofday

/client/vv_edit_var(var_name, var_value)
	switch (var_name)
		if (NAMEOF(src, holder))
			return FALSE
		if (NAMEOF(src, ckey))
			return FALSE
		if (NAMEOF(src, key))
			return FALSE
		if(NAMEOF(src, view))
			change_view(var_value, TRUE)
			return TRUE
	return ..()

/**
 * Checks if we're ready.
 */
/client/proc/is_ready()
	return ready
