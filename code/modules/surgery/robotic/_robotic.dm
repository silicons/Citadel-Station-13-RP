/datum/surgery_data/robotic
	surgery_type = SURGERY_TYPE_ROBOTIC

/datum/surgery_data/robotic/is_fully_open()
	return open_state == SURGERY_OPEN_PANEL

/datum/surgery_data/robotic/is_partially_open()
	return open_state == SURGERY_OPEN_PANEL

/datum/surgery_step/robotic

/datum/surgery_state/robotic/is_valid(obj/item/organ/external/affecting, datum/surgery_data/data)
	return data.surgery_type == SURGERY_TYPE_ROBOTIC
