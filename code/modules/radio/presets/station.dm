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
	short_name = "ERT"
	freq_number = 1331
	is_comms_channel = TRUE
	c_access_encoding = list(
		/datum/access/centcom/ert::access_value,
	)

/datum/radio_preset/station/supply
	name = "Station (Supply)"
	long_name = "Supply"
	short_name = "SUP"
	hotkey = "U"
	freq_number = 1347
	is_comms_channel = TRUE

/datum/radio_preset/station/service
	name = "Station (Service)"
	long_name = "Service"
	short_name = "SRV"
	hotkey = "V"
	freq_number = 1349
	is_comms_channel = TRUE

/datum/radio_preset/station/science
	name = "Station (Science)"
	long_name = "Science"
	short_name = "SCI"
	hotkey = "N"
	freq_number = 1351
	is_comms_channel = TRUE

/datum/radio_preset/station/command
	name = "Station (Command)"
	long_name = "Command"
	short_name = "COM"
	hotkey = "C"
	freq_number = 1353
	is_comms_channel = TRUE

/datum/radio_preset/station/medical
	name = "Station (Medical)"
	long_name = "Medical"
	short_name = "MED"
	hotkey = "M"
	freq_number = 1355
	is_comms_channel = TRUE

/datum/radio_preset/station/engineering
	name = "Station (Engineering)"
	long_name = "Engineering"
	short_name = "ENG"
	hotkey = "E"
	freq_number = 1357
	is_comms_channel = TRUE

/datum/radio_preset/station/security
	name = "Station (Security)"
	long_name = "Security"
	short_name = "SEC"
	hotkey = "S"
	freq_number = 1359
	is_comms_channel = TRUE

/datum/radio_preset/station/exploration
	name = "Station (Exploration / Survey)"
	long_name = "Survey"
	short_name = "EXP"
	hotkey = "Y"
	freq_number = 1361
	is_comms_channel = TRUE

/datum/radio_preset/station/main
	name = "Station (General)"
	long_name = "General"
	short_name = "SHIP"
	freq_number = 1363
	is_comms_channel = TRUE

/datum/radio_preset/station/medical_internal
	name = "Station (Medical Internal)"
	long_name = "Medical Internal"
	short_name = "MED-I"
	freq_number = 1371
	is_comms_channel = TRUE

/datum/radio_preset/station/security
	name = "Station (Security Internal)"
	long_name = "Security Internal"
	short_name = "SEC-I"
	freq_number = 1373
	is_comms_channel = TRUE

#warn impl all
