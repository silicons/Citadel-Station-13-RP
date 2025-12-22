//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

/**
 * An estimate of how old something is.
 * * This is technically a generic, serializable, cacheable datum for things like
 *   carbon dating.
 * * This only stores a number, and the zeros after it. Why? This allows
 *   us to neatly represent large numbers and format it without much fuss.
 */
/datum/archeology_dating_estimate
	/// zeros after the number
	var/magnitude = 0
	/// the number
	var/value = 0

/datum/archeology_dating_estimate/New(magnitude, value)
	src.magnitude = magnitude
	src.value = value

/datum/archeology_dating_estimate/clone()
	return new /datum/archeology_dating_estimate(magnitude, value)

/datum/archeology_dating_estimate/serialize()
	. = list(
		"magnitude" = magnitude,
		"value" = value,
	)

/datum/archeology_dating_estimate/deserialize(list/data)
	if(is_safe_number(data["magnitude"]) && is_safe_number(data["value"]))
		magnitude = data["magnitude"]
		value = data["value"]
	else
		magnitude = value = 0

/datum/archeology_dating_estimate/proc/set_number(of_years_ago)
	if(of_years_ago > 1000)
		return set_thousands(of_years_ago / 1000)
	magnitude = 0
	value = of_years_ago
	truncate()

/datum/archeology_dating_estimate/proc/set_thousands(of_years_ago)
	if(of_years_ago > 1000)
		return set_millions(of_years_ago / 1000)
	magnitude = 3
	value = of_years_ago
	truncate()

/datum/archeology_dating_estimate/proc/set_millions(of_years_ago)
	if(of_years_ago > 1000)
		return set_billions(of_years_ago / 1000)
	magnitude = 6
	value = of_years_ago
	truncate()

/datum/archeology_dating_estimate/proc/set_billions(of_years_ago)
	if(of_years_ago > 1000)
		return set_trillions(of_years_ago / 1000)
	magnitude = 9
	value = of_years_ago
	truncate()

/**
 * for when EMs want to scare the shit out of people
 */
/datum/archeology_dating_estimate/proc/set_trillions(of_years_ago)
	if(of_years_ago > 1000)
		CRASH("Stop.")
	magnitude = 12
	value = of_years_ago
	truncate()

/datum/archeology_dating_estimate/proc/truncate()
	#warn impl

/datum/archeology_dating_estimate/proc/ui_serialize()
	return list(
		"magnitude" = magnitude,
		"value" = value,
	)

/datum/archeology_dating_estimate/proc/to_string()
	var/power_of_ten = floor(log(10, value)) + magnitude
	#warn re-impl

	var/static/list/multipliers = list(
		0,
		10,
		100,
	)
	var/static/list/magnitudes = list(
		"",
		"",
		"",
		" thousand",
		" thousand",
		" thousand",
		" million",
		" million",
		" million",
		" billion",
		" billion",
		" billion",
		" trillion",
		" trillion",
		" trillion",
	)
	var/i = src.magnitude + 1
	var/multiplier = multipliers[clamp(i, 1, length(multiplier))]
	var/magnitude = magnitudes[clamp(i, 1, length(lookup))]
	return "~[value * multiplier][magnitude] years ago"
