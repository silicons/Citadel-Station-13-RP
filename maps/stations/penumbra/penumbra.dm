//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

/datum/map/station/penumbra
	id = "station-penumbra"
	name = "Penumbra Station"

	#warn INDEV
	allow_random_draw = FALSE

/datum/map/station/penumbra/New()
	LAZYINITLIST(levels)
	for(var/datum/map_level/level_path as anything in subtypesof(/datum/map_level/station/penumbra))
		if(level_path.abstract_type == level_path)
			continue
		levels += level_path
	..()

#warn impl

#warn make sure /station exists
/datum/map_level/station/penumbra
	abstract_type = /datum/map_level/station/penumbra
	var/p_dmm_root = "penumbra-"
	var/p_name_root = "Penumbra Station "
	var/p_display_name_root = "<Planet Name Here> "
	var/p_id_root = "penumbra-surface-"
	var/p_display_id_root = "penumbra-surface-"

// -- SURFACE --

#warn struct x/y/z all of these
/datum/map_level/station/penumbra/surface
	abstract_type = /datum/map_level/station/penumbra/surface
	p_dmm_root = /datum/map_level/station/penumbra::p_dmm_root + "surface-"
	p_name_root = /datum/map_level/station/penumbra::p_name_root + "Surface "
	p_display_name_root = /datum/map_level/station/penumbra::p_display_name_root + "Surface "

/datum/map_level/station/penumbra/surface/l_1_1_station_1
	map_path = /datum/map_level/station/penumbra/surface::p_dmm_root + "1-1-1.dmm"
	id = /datum/map_level/station/penumbra/surface::p_id_root + "1-1-1"
	display_id = /datum/map_level/station/penumbra/surface::p_display_id_root + "1-1-station-1"
	name = /datum/map_level/station/penumbra/surface::p_name_root + "(1-1-Station-1)"
	display_name = /datum/map_level/station/penumbra/surface::p_display_name_root + "(1-1) (Station 1)"

/datum/map_level/station/penumbra/surface/l_1_1_station_2
	map_path = /datum/map_level/station/penumbra/surface::p_dmm_root + "1-1-2.dmm"
	id = /datum/map_level/station/penumbra/surface::p_id_root + "1-1-2"
	display_id = /datum/map_level/station/penumbra/surface::p_display_id_root + "1-1-station-2"
	name = /datum/map_level/station/penumbra/surface::p_name_root + "(1-1-Station-2)"
	display_name = /datum/map_level/station/penumbra/surface::p_display_name_root + "(1-1) (Station 2)"

/datum/map_level/station/penumbra/surface/l_1_1_station_3
	map_path = /datum/map_level/station/penumbra/surface::p_dmm_root + "1-1-3.dmm"
	id = /datum/map_level/station/penumbra/surface::p_id_root + "1-1-3"
	display_id = /datum/map_level/station/penumbra/surface::p_display_id_root + "1-1-station-3"
	name = /datum/map_level/station/penumbra/surface::p_name_root + "(1-1-Station-3)"
	display_name = /datum/map_level/station/penumbra/surface::p_display_name_root + "(1-1) (Station 3)"

/datum/map_level/station/penumbra/surface/l_1_2
	map_path = /datum/map_level/station/penumbra/surface::p_dmm_root + "1-2.dmm"
	id = /datum/map_level/station/penumbra/surface::p_id_root + "1-2"
	display_id = /datum/map_level/station/penumbra/surface::p_display_id_root + "1-2"
	name = /datum/map_level/station/penumbra/surface::p_name_root + "(1-2)"
	display_name = /datum/map_level/station/penumbra/surface::p_display_name_root + "(1-2)"

/datum/map_level/station/penumbra/surface/l_1_3
	map_path = /datum/map_level/station/penumbra/surface::p_dmm_root + "1-3.dmm"
	id = /datum/map_level/station/penumbra/surface::p_id_root + "1-3"
	display_id = /datum/map_level/station/penumbra/surface::p_display_id_root + "1-3"
	name = /datum/map_level/station/penumbra/surface::p_name_root + "(1-3)"
	display_name = /datum/map_level/station/penumbra/surface::p_display_name_root + "(1-3)"

/datum/map_level/station/penumbra/surface/l_2_1
	map_path = /datum/map_level/station/penumbra/surface::p_dmm_root + "2-1.dmm"
	id = /datum/map_level/station/penumbra/surface::p_id_root + "2-1"
	display_id = /datum/map_level/station/penumbra/surface::p_display_id_root + "2-1"
	name = /datum/map_level/station/penumbra/surface::p_name_root + "(2-1)"
	display_name = /datum/map_level/station/penumbra/surface::p_display_name_root + "(2-1)"

/datum/map_level/station/penumbra/surface/l_2_2
	map_path = /datum/map_level/station/penumbra/surface::p_dmm_root + "2-2.dmm"
	id = /datum/map_level/station/penumbra/surface::p_id_root + "2-2"
	display_id = /datum/map_level/station/penumbra/surface::p_display_id_root + "2-2"
	name = /datum/map_level/station/penumbra/surface::p_name_root + "(2-2)"
	display_name = /datum/map_level/station/penumbra/surface::p_display_name_root + "(2-2)"

/datum/map_level/station/penumbra/surface/l_2_3
	map_path = /datum/map_level/station/penumbra/surface::p_dmm_root + "2-3.dmm"
	id = /datum/map_level/station/penumbra/surface::p_id_root + "2-3"
	display_id = /datum/map_level/station/penumbra/surface::p_display_id_root + "2-3"
	name = /datum/map_level/station/penumbra/surface::p_name_root + "(2-3)"
	display_name = /datum/map_level/station/penumbra/surface::p_display_name_root + "(2-3)"

/datum/map_level/station/penumbra/surface/l_3_1
	map_path = /datum/map_level/station/penumbra/surface::p_dmm_root + "3-1.dmm"
	id = /datum/map_level/station/penumbra/surface::p_id_root + "3-1"
	display_id = /datum/map_level/station/penumbra/surface::p_display_id_root + "3-1"
	name = /datum/map_level/station/penumbra/surface::p_name_root + "(3-1)"
	display_name = /datum/map_level/station/penumbra/surface::p_display_name_root + "(3-1)"

/datum/map_level/station/penumbra/surface/l_3_2
	map_path = /datum/map_level/station/penumbra/surface::p_dmm_root + "3-2.dmm"
	id = /datum/map_level/station/penumbra/surface::p_id_root + "3-2"
	display_id = /datum/map_level/station/penumbra/surface::p_display_id_root + "3-2"
	name = /datum/map_level/station/penumbra/surface::p_name_root + "(3-2)"
	display_name = /datum/map_level/station/penumbra/surface::p_display_name_root + "(3-2)"

/datum/map_level/station/penumbra/surface/l_3_3
	map_path = /datum/map_level/station/penumbra/surface::p_dmm_root + "3-3.dmm"
	id = /datum/map_level/station/penumbra/surface::p_id_root + "3-3"
	display_id = /datum/map_level/station/penumbra/surface::p_display_id_root + "3-3"
	name = /datum/map_level/station/penumbra/surface::p_name_root + "(3-3)"
	display_name = /datum/map_level/station/penumbra/surface::p_display_name_root + "(3-3)"

// -- CAVERNS --

/datum/map_level/station/penumbra/cavern
	abstract_type = /datum/map_level/station/penumbra/cavern
	p_dmm_root = /datum/map_level/station/penumbra::p_dmm_root + "cavern-"
	p_name_root = /datum/map_level/station/penumbra::p_name_root + "Cavern "
	p_display_name_root = /datum/map_level/station/penumbra::p_display_name_root + "Cavern "

/datum/map_level/station/penumbra/cavern/l_1_1
	map_path = /datum/map_level/station/penumbra/cavern::p_dmm_root + "1-1.dmm"
	id = /datum/map_level/station/penumbra/cavern::p_id_root + "1-1"
	display_id = /datum/map_level/station/penumbra/cavern::p_display_id_root + "1-1"
	name = /datum/map_level/station/penumbra/cavern::p_name_root + "(1-1)"
	display_name = /datum/map_level/station/penumbra/cavern::p_display_name_root + "(1-1)"

/datum/map_level/station/penumbra/cavern/l_1_2
	map_path = /datum/map_level/station/penumbra/cavern::p_dmm_root + "1-2.dmm"
	id = /datum/map_level/station/penumbra/cavern::p_id_root + "1-2"
	display_id = /datum/map_level/station/penumbra/cavern::p_display_id_root + "1-2"
	name = /datum/map_level/station/penumbra/cavern::p_name_root + "(1-2)"
	display_name = /datum/map_level/station/penumbra/cavern::p_display_name_root + "(1-2)"

/datum/map_level/station/penumbra/cavern/l_1_3
	map_path = /datum/map_level/station/penumbra/cavern::p_dmm_root + "1-3.dmm"
	id = /datum/map_level/station/penumbra/cavern::p_id_root + "1-3"
	display_id = /datum/map_level/station/penumbra/cavern::p_display_id_root + "1-3"
	name = /datum/map_level/station/penumbra/cavern::p_name_root + "(1-3)"
	display_name = /datum/map_level/station/penumbra/cavern::p_display_name_root + "(1-3)"

/datum/map_level/station/penumbra/cavern/l_2_1
	map_path = /datum/map_level/station/penumbra/cavern::p_dmm_root + "2-1.dmm"
	id = /datum/map_level/station/penumbra/cavern::p_id_root + "2-1"
	display_id = /datum/map_level/station/penumbra/cavern::p_display_id_root + "2-1"
	name = /datum/map_level/station/penumbra/cavern::p_name_root + "(2-1)"
	display_name = /datum/map_level/station/penumbra/cavern::p_display_name_root + "(2-1)"

/datum/map_level/station/penumbra/cavern/l_2_2
	map_path = /datum/map_level/station/penumbra/cavern::p_dmm_root + "2-2.dmm"
	id = /datum/map_level/station/penumbra/cavern::p_id_root + "2-2"
	display_id = /datum/map_level/station/penumbra/cavern::p_display_id_root + "2-2"
	name = /datum/map_level/station/penumbra/cavern::p_name_root + "(2-2)"
	display_name = /datum/map_level/station/penumbra/cavern::p_display_name_root + "(2-2)"

/datum/map_level/station/penumbra/cavern/l_2_3
	map_path = /datum/map_level/station/penumbra/cavern::p_dmm_root + "2-3.dmm"
	id = /datum/map_level/station/penumbra/cavern::p_id_root + "2-3"
	display_id = /datum/map_level/station/penumbra/cavern::p_display_id_root + "2-3"
	name = /datum/map_level/station/penumbra/cavern::p_name_root + "(2-3)"
	display_name = /datum/map_level/station/penumbra/cavern::p_display_name_root + "(2-3)"

/datum/map_level/station/penumbra/cavern/l_3_1
	map_path = /datum/map_level/station/penumbra/cavern::p_dmm_root + "3-1.dmm"
	id = /datum/map_level/station/penumbra/cavern::p_id_root + "3-1"
	display_id = /datum/map_level/station/penumbra/cavern::p_display_id_root + "3-1"
	name = /datum/map_level/station/penumbra/cavern::p_name_root + "(3-1)"
	display_name = /datum/map_level/station/penumbra/cavern::p_display_name_root + "(3-1)"

/datum/map_level/station/penumbra/cavern/l_3_2
	map_path = /datum/map_level/station/penumbra/cavern::p_dmm_root + "3-2.dmm"
	id = /datum/map_level/station/penumbra/cavern::p_id_root + "3-2"
	display_id = /datum/map_level/station/penumbra/cavern::p_display_id_root + "3-2"
	name = /datum/map_level/station/penumbra/cavern::p_name_root + "(3-2)"
	display_name = /datum/map_level/station/penumbra/cavern::p_display_name_root + "(3-2)"

/datum/map_level/station/penumbra/cavern/l_3_3
	map_path = /datum/map_level/station/penumbra/cavern::p_dmm_root + "3-3.dmm"
	id = /datum/map_level/station/penumbra/cavern::p_id_root + "3-3"
	display_id = /datum/map_level/station/penumbra/cavern::p_display_id_root + "3-3"
	name = /datum/map_level/station/penumbra/cavern::p_name_root + "(3-3)"
	display_name = /datum/map_level/station/penumbra/cavern::p_display_name_root + "(3-3)"

// -- CAVERNS --

/datum/map_level/station/penumbra/abyss
	abstract_type = /datum/map_level/station/penumbra/abyss
	p_dmm_root = /datum/map_level/station/penumbra::p_dmm_root + "abyss-"
	p_name_root = /datum/map_level/station/penumbra::p_name_root + "Abyss "
	p_display_name_root = /datum/map_level/station/penumbra::p_display_name_root + "Abyss "

/datum/map_level/station/penumbra/abyss/l_1_1
	map_path = /datum/map_level/station/penumbra/abyss::p_dmm_root + "1-1.dmm"
	id = /datum/map_level/station/penumbra/abyss::p_id_root + "1-1"
	display_id = /datum/map_level/station/penumbra/abyss::p_display_id_root + "1-1"
	name = /datum/map_level/station/penumbra/abyss::p_name_root + "(1-1)"
	display_name = /datum/map_level/station/penumbra/abyss::p_display_name_root + "(1-1)"

/datum/map_level/station/penumbra/abyss/l_1_2
	map_path = /datum/map_level/station/penumbra/abyss::p_dmm_root + "1-2.dmm"
	id = /datum/map_level/station/penumbra/abyss::p_id_root + "1-2"
	display_id = /datum/map_level/station/penumbra/abyss::p_display_id_root + "1-2"
	name = /datum/map_level/station/penumbra/abyss::p_name_root + "(1-2)"
	display_name = /datum/map_level/station/penumbra/abyss::p_display_name_root + "(1-2)"

/datum/map_level/station/penumbra/abyss/l_1_3
	map_path = /datum/map_level/station/penumbra/abyss::p_dmm_root + "1-3.dmm"
	id = /datum/map_level/station/penumbra/abyss::p_id_root + "1-3"
	display_id = /datum/map_level/station/penumbra/abyss::p_display_id_root + "1-3"
	name = /datum/map_level/station/penumbra/abyss::p_name_root + "(1-3)"
	display_name = /datum/map_level/station/penumbra/abyss::p_display_name_root + "(1-3)"

/datum/map_level/station/penumbra/abyss/l_2_1
	map_path = /datum/map_level/station/penumbra/abyss::p_dmm_root + "2-1.dmm"
	id = /datum/map_level/station/penumbra/abyss::p_id_root + "2-1"
	display_id = /datum/map_level/station/penumbra/abyss::p_display_id_root + "2-1"
	name = /datum/map_level/station/penumbra/abyss::p_name_root + "(2-1)"
	display_name = /datum/map_level/station/penumbra/abyss::p_display_name_root + "(2-1)"

/datum/map_level/station/penumbra/abyss/l_2_2
	map_path = /datum/map_level/station/penumbra/abyss::p_dmm_root + "2-2.dmm"
	id = /datum/map_level/station/penumbra/abyss::p_id_root + "2-2"
	display_id = /datum/map_level/station/penumbra/abyss::p_display_id_root + "2-2"
	name = /datum/map_level/station/penumbra/abyss::p_name_root + "(2-2)"
	display_name = /datum/map_level/station/penumbra/abyss::p_display_name_root + "(2-2)"

/datum/map_level/station/penumbra/abyss/l_2_3
	map_path = /datum/map_level/station/penumbra/abyss::p_dmm_root + "2-3.dmm"
	id = /datum/map_level/station/penumbra/abyss::p_id_root + "2-3"
	display_id = /datum/map_level/station/penumbra/abyss::p_display_id_root + "2-3"
	name = /datum/map_level/station/penumbra/abyss::p_name_root + "(2-3)"
	display_name = /datum/map_level/station/penumbra/abyss::p_display_name_root + "(2-3)"

/datum/map_level/station/penumbra/abyss/l_3_1
	map_path = /datum/map_level/station/penumbra/abyss::p_dmm_root + "3-1.dmm"
	id = /datum/map_level/station/penumbra/abyss::p_id_root + "3-1"
	display_id = /datum/map_level/station/penumbra/abyss::p_display_id_root + "3-1"
	name = /datum/map_level/station/penumbra/abyss::p_name_root + "(3-1)"
	display_name = /datum/map_level/station/penumbra/abyss::p_display_name_root + "(3-1)"

/datum/map_level/station/penumbra/abyss/l_3_2
	map_path = /datum/map_level/station/penumbra/abyss::p_dmm_root + "3-2.dmm"
	id = /datum/map_level/station/penumbra/abyss::p_id_root + "3-2"
	display_id = /datum/map_level/station/penumbra/abyss::p_display_id_root + "3-2"
	name = /datum/map_level/station/penumbra/abyss::p_name_root + "(3-2)"
	display_name = /datum/map_level/station/penumbra/abyss::p_display_name_root + "(3-2)"

/datum/map_level/station/penumbra/abyss/l_3_3
	map_path = /datum/map_level/station/penumbra/abyss::p_dmm_root + "3-3.dmm"
	id = /datum/map_level/station/penumbra/abyss::p_id_root + "3-3"
	display_id = /datum/map_level/station/penumbra/abyss::p_display_id_root + "3-3"
	name = /datum/map_level/station/penumbra/abyss::p_name_root + "(3-3)"
	display_name = /datum/map_level/station/penumbra/abyss::p_display_name_root + "(3-3)"
