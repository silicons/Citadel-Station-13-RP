/datum/emote/shake_head
	key = "shake"
	name = "Shake Head"
	message = "shakes %THEIR% head."
	message_preprocess = TRUE
	message_type = MESSAGE_TYPE_VISIBLE

/datum/emote/shrug
	key = "shrug"
	name = "Shrug"
	message = "shrugs."
	message_type = MESSAGE_TYPE_VISIBLE

/datum/emote/signal
	key = "signal"
	name = "Signal with fingers"
	message_type = MESSAGE_TYPE_VISIBLE

/datum/emote/signal/ProcessMessage(mob/user, message, extra)
	if(!extra)
		return "raises a finger."
	if(!text2num(extra))
		to_chat(user, SPAN_WARNING())

#warn impl

/datum/emote/smile
	key = "smile"
	name = "Smile"
	message = "smiles."
	message_type = MESSAGE_TYPE_VISIBLE
