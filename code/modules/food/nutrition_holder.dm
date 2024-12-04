//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

/**
 * Holds data about satiety and nutrition.
 *
 * * Should be stateless. If you want to do effects, do it somewhere else. Thsi is a serializable
 *   datastruct.
 */
/datum/nutrition_holder

/datum/nutrition_holder/serialize()
	. = list()

/datum/nutrition_holder/deserialize(list/data)


#warn impl
