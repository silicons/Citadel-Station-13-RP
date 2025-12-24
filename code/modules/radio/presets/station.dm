//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

/datum/radio_preset/station
	abstract_type = /datum/radio_preset/station

//* allocated block: 1301 to 1399

/**
 * For asset protection & ERT & PARA
 */
/datum/radio_preset/station/emergency_responder
	name = "Station (Emergency Responder)"
	long_name = "Emergency Responder"
	short_name = "Responder"
	freq_number = 1331
	is_comms_channel = TRUE
	c_access_encoding = list(
		/datum/access/centcom/ert::access_value,
	)
	html_span = "centradio"

/datum/radio_preset/station/supply
	name = "Station (Supply)"
	long_name = "Supply"
	hotkey = "U"
	freq_number = 1347
	is_comms_channel = TRUE
	html_span = "suppradio"

/datum/radio_preset/station/service
	name = "Station (Service)"
	long_name = "Service"
	hotkey = "V"
	freq_number = 1349
	is_comms_channel = TRUE
	html_span = "servradio"

/datum/radio_preset/station/science
	name = "Station (Science)"
	long_name = "Science"
	hotkey = "N"
	freq_number = 1351
	is_comms_channel = TRUE
	html_span = "sciradio"

/datum/radio_preset/station/command
	name = "Station (Command)"
	long_name = "Command"
	hotkey = "C"
	freq_number = 1353
	is_comms_channel = TRUE
	html_span = "comradio"

/datum/radio_preset/station/medical
	name = "Station (Medical)"
	long_name = "Medical"
	hotkey = "M"
	freq_number = 1355
	is_comms_channel = TRUE
	html_span = "medradio"

/datum/radio_preset/station/engineering
	name = "Station (Engineering)"
	long_name = "Engineering"
	hotkey = "E"
	freq_number = 1357
	is_comms_channel = TRUE
	html_span = "engradio"

/datum/radio_preset/station/security
	name = "Station (Security)"
	long_name = "Security"
	hotkey = "S"
	freq_number = 1359
	is_comms_channel = TRUE
	html_span = "secradio"

/datum/radio_preset/station/exploration
	name = "Station (Exploration / Survey)"
	long_name = "Survey"
	hotkey = "Y"
	freq_number = 1361
	is_comms_channel = TRUE
	html_span = "expradio"

/datum/radio_preset/station/main
	name = "Station (General)"
	long_name = "Station"
	short_name = "Station"
	freq_number = 1363
	is_comms_channel = TRUE
	#warn span?

/datum/radio_preset/station/medical_internal
	name = "Station (Medical Internal)"
	long_name = "Medical Internal"
	short_name = "MED-I"
	freq_number = 1371
	is_comms_channel = TRUE
	html_span = "medradio"

/datum/radio_preset/station/security
	name = "Station (Security Internal)"
	long_name = "Security Internal"
	short_name = "SEC-I"
	freq_number = 1373
	is_comms_channel = TRUE
	html_span = "secradio"

/// Used to allow AIs to secure a private audience if they wish.
/datum/radio_preset/station/ai_routing_1
	name = "Station (AI Routing 1)"
	long_name = "AI Private #1"
	freq_number = 1391
	is_comms_channel = TRUE
	html_span = "aiprivradio"

/// Used to allow AIs to secure a private audience if they wish.
/datum/radio_preset/station/ai_routing_2
	name = "Station (AI Routing 2)"
	long_name = "AI Private #2"
	freq_number = 1393
	is_comms_channel = TRUE
	html_span = "aiprivradio"

/// Used to allow AIs to secure a private audience if they wish.
/datum/radio_preset/station/ai_routing_3
	name = "Station (AI Routing 3)"
	long_name = "AI Private #3"
	freq_number = 1395
	is_comms_channel = TRUE
	html_span = "aiprivradio"

/// Used to allow AIs to secure a private audience if they wish.
/datum/radio_preset/station/ai_routing_4
	name = "Station (AI Routing 4)"
	long_name = "AI Private #4"
	freq_number = 1397
	is_comms_channel = TRUE
	html_span = "aiprivradio"

/// Used to allow AIs to secure a private audience if they wish.
/datum/radio_preset/station/ai_routing_5
	name = "Station (AI Routing 1)"
	long_name = "AI Private #5"
	freq_number = 1399
	is_comms_channel = TRUE
	html_span = "aiprivradio"

#warn access for ai routing channels?

#warn impl all
