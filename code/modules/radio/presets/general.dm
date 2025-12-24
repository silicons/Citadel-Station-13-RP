
//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

/**
 * Common general channels that everyone has (sorta)
 */
/datum/radio_preset/general
	abstract_type = /datum/radio_preset/general

//* allocated block: 1401 to 1499

/datum/radio_preset/general/common
	name = "Common"
	hotkey = "G"
	freq_number = 1459
	is_comms_channel = TRUE
	c_access_encoding = list()

/datum/radio_preset/general/signalling
	name = "Signalling"
	freq_number = 1457

/datum/radio_preset/general/entertainment
	name = "Entertainment"
	freq_number = 1461
	is_comms_channel = TRUE
	c_access_encoding = list()

/datum/radio_preset/general/traffic_control
	name = "Traffic Control"
	freq_number = 1463
	is_comms_channel = TRUE
	c_access_encoding = list()
