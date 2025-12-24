//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

/datum/radio_preset/station
	abstract_type = /datum/radio_preset/station
	block_start = 1301
	block_end = 1399

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
	c_access_encoding = list(
		/datum/access/station/supply/mining_outpost::access_value,
		/datum/access/station/supply/cargo::access_value,
	)

/datum/radio_preset/station/service
	name = "Station (Service)"
	long_name = "Service"
	hotkey = "V"
	freq_number = 1349
	is_comms_channel = TRUE
	html_span = "servradio"
	c_access_encoding = list(
		/datum/access/station/general/bar::access_value,
		/datum/access/station/general/chapel::access_value,
		/datum/access/station/general/hydroponics::access_value,
		/datum/access/station/general/kitchen::access_value,
		/datum/access/station/general/library::access_value,
		/datum/access/station/general/janitor::access_value,
		/datum/access/station/general/pilot::access_value,
	)

/datum/radio_preset/station/science
	name = "Station (Science)"
	long_name = "Science"
	hotkey = "N"
	freq_number = 1351
	is_comms_channel = TRUE
	html_span = "sciradio"
	c_access_encoding = list(
		/datum/access/station/science/fabrication::access_value,
		/datum/access/station/science/xenobiology::access_value,
		/datum/access/station/science/xenobotany::access_value,
		/datum/access/station/science/robotics::access_value,
		/datum/access/station/general/explorer::access_value,
	)

/datum/radio_preset/station/command
	name = "Station (Command)"
	long_name = "Command"
	hotkey = "C"
	freq_number = 1353
	is_comms_channel = TRUE
	html_span = "comradio"
	c_access_encoding = list(
		/datum/access/station/command/bridge::access_value,
	)

/datum/radio_preset/station/medical
	name = "Station (Medical)"
	long_name = "Medical"
	hotkey = "M"
	freq_number = 1355
	is_comms_channel = TRUE
	html_span = "medradio"
	c_access_encoding = list(
		/datum/access/station/medical/equipment::access_value,
	)

/datum/radio_preset/station/engineering
	name = "Station (Engineering)"
	long_name = "Engineering"
	hotkey = "E"
	freq_number = 1357
	is_comms_channel = TRUE
	html_span = "engradio"
	c_access_encoding = list(
		/datum/access/station/engineering/engine::access_value,
		/datum/access/station/engineering/atmos::access_value,
	)

/datum/radio_preset/station/security
	name = "Station (Security)"
	long_name = "Security"
	hotkey = "S"
	freq_number = 1359
	is_comms_channel = TRUE
	html_span = "secradio"
	c_access_encoding = list(
		/datum/access/station/medical/equipment::access_value,
	)

/datum/radio_preset/station/exploration
	name = "Station (Exploration)"
	long_name = "Explorer"
	hotkey = "Y"
	freq_number = 1361
	is_comms_channel = TRUE
	html_span = "expradio"
	c_access_encoding = list(
		/datum/access/station/general/explorer::access_value,
		/datum/access/station/general/pilot::access_value,
		/datum/access/station/general/pathfinder::access_value,
		/datum/access/station/science/rd::access_value,
	)

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
	c_access_encoding = list(
		/datum/access/station/medical/equipment::access_value,
	)

/datum/radio_preset/station/security
	name = "Station (Security Internal)"
	long_name = "Security Internal"
	short_name = "SEC-I"
	freq_number = 1373
	is_comms_channel = TRUE
	html_span = "secradio"
	c_access_encoding = list(
		/datum/access/station/medical/equipment::access_value,
	)

/// Used to allow AIs to secure a private audience if they wish.
/datum/radio_preset/station/ai_routing_1
	name = "Station (AI Routing 1)"
	long_name = "AI Private #1"
	freq_number = 1391
	is_comms_channel = TRUE
	html_span = "aiprivradio"
	c_access_encoding = list(
		/datum/access/special/silicons::access_value,
	)

/// Used to allow AIs to secure a private audience if they wish.
/datum/radio_preset/station/ai_routing_2
	name = "Station (AI Routing 2)"
	long_name = "AI Private #2"
	freq_number = 1393
	is_comms_channel = TRUE
	html_span = "aiprivradio"
	c_access_encoding = list(
		/datum/access/special/silicons::access_value,
	)

/// Used to allow AIs to secure a private audience if they wish.
/datum/radio_preset/station/ai_routing_3
	name = "Station (AI Routing 3)"
	long_name = "AI Private #3"
	freq_number = 1395
	is_comms_channel = TRUE
	html_span = "aiprivradio"
	c_access_encoding = list(
		/datum/access/special/silicons::access_value,
	)

/// Used to allow AIs to secure a private audience if they wish.
/datum/radio_preset/station/ai_routing_4
	name = "Station (AI Routing 4)"
	long_name = "AI Private #4"
	freq_number = 1397
	is_comms_channel = TRUE
	html_span = "aiprivradio"
	c_access_encoding = list(
		/datum/access/special/silicons::access_value,
	)

/// Used to allow AIs to secure a private audience if they wish.
/datum/radio_preset/station/ai_routing_5
	name = "Station (AI Routing 5)"
	long_name = "AI Private #5"
	freq_number = 1399
	is_comms_channel = TRUE
	html_span = "aiprivradio"
	c_access_encoding = list(
		/datum/access/special/silicons::access_value,
	)
