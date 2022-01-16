/datum/surgery_data/organic
	surgery_type = SURGERY_TYPE_ORGANIC

/datum/surgery_data/organic/is_fully_open()
	return open_state == SURGERY_OPEN_NORMAL

/datum/surgery_data/organic/is_partially_open()
	return open_state == SURGERY_OPEN_INCISION

/datum/surgery_data/organic/encased/is_fully_open()
	return open_state == SURGERY_OPEN_BONE

/datum/surgery_step/organic
	/// Can we infect/spread germs to the organ?
	var/can_infect = FALSE
	/// Do we get the surgeon bloody?
	var/bloody = SURGERY_BLOODLESS

/datum/surgery_state/organic/is_valid(obj/item/organ/external/affecting, datum/surgery_data/data)
	return data.surgery_type == SURGERY_TYPE_ORGANIC
