//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

/**
 * * These should never be mutated once used.
 */
/datum/disperser_weather_impulse
	var/name = "???"
	var/desc = "Some kind of weather effect. Try it out. It's never a war crime the first time."

/datum/disperser_weather_impulse/induce_condensation
	name = "cloud condenser"
	desc = "Forcefully condenses moisture (or other chemicals) in the air into clouds."

/datum/disperser_weather_impulse/induce_precipitation
	name = "precipitate seeding"
	desc = "Disperses seed precipitate, causing clouds in the area to dump out their contents."

/datum/disperser_weather_impulse/light_filter
	name = "spectral filtration"
	desc = "Disperses a special degrading material that filters photons passing through. Modifies sunlight, basically."

/datum/disperser_weather_impulse/charge_buildup
	name = "charge accelerant"
	desc = "Disperses an accelerant material that causes heightened charge buildup in airborne particulate."

/datum/disperser_weather_impulse/induce_freezing
	name = "flash freeze"
	desc = "Despite the intimidating name, this only works on certain airborne particles. Like water."

/datum/disperser_weather_impulse/pause_precipitation
	name = "precipitate barrier"
	desc = "Disperses a material that inhibits precipitation from forming."

/datum/disperser_weather_impulse/reduce_wind
	name = "drag barrier"
	desc = "Disperses a material that reduces wind speed, in exchange for heating up the ambient air."

/datum/disperser_weather_impulse/induce_wind
	name = "wind accelerant"
	desc = "Disperses a material that increases wind speed, in exchange for cooling down the ambient air."

/datum/disperser_weather_impulse/create_tornado
	name = "cyclonic catalyst"
	desc = "If deployed in an area with sufficient wind, this has a significant chance of causing a localized tornado to form."

#warn impl all
