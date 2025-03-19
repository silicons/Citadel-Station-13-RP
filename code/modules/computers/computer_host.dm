//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

/**
 * Handler datum for a computer
 *
 * Implementation Notes:
 * * This is not a datum component because often times it doesn't make sense
 *   to attach this to something. Instead, we use relatively custom callbacks
 *   and sometimes special bindings to make things work.
 */
/datum/computer_host
	/// our primary binding
	var/datum/binding
	/// expected binding type
	var/binding_type

/datum/computer_host/New(datum/bind_to)
	#warn bind

/datum/computer_host/Destroy()
	#warn unbind
	return ..()

/datum/computer_host/proc/bind(datum/target)
	SHOULD_NOT_OVERRIDE(TRUE)
	SHOULD_NOT_SLEEP(TRUE)

/datum/computer_host/proc/unbind(datum/target)
	SHOULD_NOT_OVERRIDE(TRUE)
	SHOULD_NOT_SLEEP(TRUE)

/datum/computer_host/proc/on_bind(datum/target)
	PROTECTED_PROC(TRUE)
	SHOULD_NOT_SLEEP(TRUE)
	SHOULD_CALL_PARENT(TRUE)

/datum/computer_host/proc/on_unbind(datum/target)
	PROTECTED_PROC(TRUE)
	SHOULD_NOT_SLEEP(TRUE)
	SHOULD_CALL_PARENT(TRUE)

#warn impl
