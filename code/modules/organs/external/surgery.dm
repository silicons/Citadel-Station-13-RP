/**
 * Procs to link to the surgery module.
 */
/obj/item/organ/external
	/// What kind of surgeries can be done on us
	var/surgery_type = SURGERY_TYPE_NONE
	/// Our current open stage
	var/open_state = SURGERY_OPEN_NONE
	/// Current list of mobs operating on us
	var/list/mob/living/operated_by
	/// List of states, associated to path
	var/list/states

/obj/item/organ/external/proc/attempt_surgery(obj/item/I, mob/user, always_fail = FALSE)


/obj/item/organ/external/proc/is_fully_open()
	switch(robotic)
		if(ORGAN_FLESH, ORGAN_ASSISTED)

		if(ORGAN_LIFELIKE, ORGAN_ROBOT)

	return FALSE

/obj/item/organ/external/proc/is_partially_open()
	switch(robotic)
		if(ORGAN_FLESH, ORGAN_ASSISTED)

		if(ORGAN_LIFELIKE, ORGAN_ROBOT)

	return FALSE

/obj/item/organ/external/proc/set_surgery_state(type, data)
	if(!states)
		states = list()
	states[type] = new type(data)
	validate_surgery_states()

/obj/item/organ/external/proc/clear_surgery_state(type)
	if(!states)
		return
	states -= type
	validate_surgery_states()

/obj/item/organ/external/proc/get_surgery_state(type)
	return states && states[type]

/obj/item/organ/external/proc/set_open(new_state)
	open_state = new_state
	validate_surgery_states()

/obj/item/organ/external/proc/validate_surgery_states()
	if(!parent)
		return
	for(var/path in states)
		var/datum/surgery_sate/state = states[path]
		if(!state.is_valid(parent, src))
			clear_state(type)
