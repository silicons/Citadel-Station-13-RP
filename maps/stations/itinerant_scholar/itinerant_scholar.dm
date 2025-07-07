//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

/datum/map/station/itinerant_scholar
	id = "itinerant_scholar"
	name = "World - NSV Itinerant Scholar"
	levels = list(
		/datum/map_level/station/itinerant_scholar/deck_1,
		/datum/map_level/station/itinerant_scholar/deck_2,
		/datum/map_level/station/itinerant_scholar/deck_3,
		/datum/map_level/station/itinerant_scholar/deck_4,
	)
	width = 192
	height = 192
	world_width = 192
	world_height = 192

/datum/map_level/station/itinerant_scholar
	abstract_type = /datum/map_level/station/itinerant_scholar
	persistence_allowed = TRUE
	traits = list(
		ZTRAIT_STATION,
		ZTRAIT_FACILITY_SAFETY,
	)

/datum/map_level/station/itinerant_scholar/deck_1
	id = "itinerant-scholar-1"
	name = "Itinerant Scholar - Deck 1"
	display_id = "itinerant-scholar-deck-1"
	display_name = "NSV Itinerant Scholar - Service Deck"
	path = "maps/stations/itinerant_scholar/levels/deck-1.dmm"
	base_turf = /turf/space

/datum/map_level/station/itinerant_scholar/deck_2
	id = "itinerant-scholar-2"
	name = "Itinerant Scholar - Deck 2"
	display_id = "itinerant-scholar-deck-2"
	display_name = "NSV Itinerant Scholar - Operations Deck"
	path = "maps/stations/itinerant_scholar/levels/deck-2.dmm"
	base_turf = /turf/simulated/open

/datum/map_level/station/itinerant_scholar/deck_3
	id = "itinerant-scholar-3"
	name = "Itinerant Scholar - Deck 3"
	display_id = "itinerant-scholar-deck-4"
	display_name = "NSV Itinerant Scholar - Flight Deck"
	path = "maps/stations/itinerant_scholar/levels/deck-3.dmm"
	base_turf = /turf/simulated/open

/datum/map_level/station/itinerant_scholar/deck_4
	id = "itinerant-scholar-4"
	name = "Itinerant Scholar - Deck 4"
	display_id = "itinerant-scholar-deck-4"
	display_name = "NSV Itinerant Scholar - Control Deck"
	path = "maps/stations/itinerant_scholar/levels/deck-4.dmm"
	base_turf = /turf/simulated/open
