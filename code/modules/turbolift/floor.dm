/**
 * Turbolift floor datums
 */
/datum/turbolift_floor
	/// Our area
	var/area/area_ref
	/// Friendly name
	var/label
	/// Our name
	var/name
	/// Announcement name
	var/announce_name
	/// Arrival sound
	var/arrival_sound = LIFT_DEFAULT_ARRIVAL_SOUND
	/// Up delay
	var/up_delay = LIFT_TRANSIT_TIME_UP
	/// Down delay
	var/down_delay = LIFT_TRANSIT_TIME_DOWN
	/// Door list
	var/list/atom/doors = list()
	/// Exterior call button
	var/obj/structure/lift/button/call_button
	/// Owner lift
	var/datum/turbolift/master
	/// Are we a valid exit, or are we just a midway destination?
	var/is_floor = TRUE

/datum/turbolift_floor/Destroy()
	area_ref = null
	master = null
	master.turbolift_floor_deleted(src)			// so they can clean up
	doors = null
	call_button.turbolift_floor_deleted(src)	// so they can clean up
	return ..()

/datum/turbolift_floor/proc/update_appearance()
	call_button?.update_appearance()

/datum/turbolift_floor/proc/on_arrival()
	if(!master.firefighter_mode())
		open_doors()

/datum/turbolift_floor/proc/on_departure()

/datum/turbolift_floor/proc/open_doors()

/datum/turbolift_floor/proc/close_doors()

/datum/turbolift_floor/proc/doors_closed()

/**
 * Returns FALSE to deny arrival
 */
/datum/turbolift_floor/proc/pre_arrival()
	return TRUE

/**
 * Returns FALSE to deny departure
 */
/datum/turbolift_floor/proc/pre_departure()
	close_doors()
	if(!doors_closed())
		return FALSE
	return TRUE

//////////////////////////////////////

/datum/turbolift_floor/proc/set_area_ref(var/ref)
	var/area/turbolift/A = locate(ref)
	if(!istype(A))
		log_debug("Turbolift floor area was of the wrong type: ref=[ref]")
		return

	area_ref = ref
	label = A.lift_floor_label
	name = A.lift_floor_name ? A.lift_floor_name : A.name
	announce_str = A.lift_announce_str
	arrival_sound = A.arrival_sound
	delay_time = A.delay_time

//called when a lift has queued this floor as a destination
/datum/turbolift_floor/proc/pending_move(var/datum/turbolift/lift)
	if(ext_panel)
		ext_panel.light_up()

//called when a lift arrives at this floor
/datum/turbolift_floor/proc/arrived(var/datum/turbolift/lift)
	if(!lift.fire_mode)
		lift.open_doors(src)
	if(ext_panel)
		ext_panel.reset()
