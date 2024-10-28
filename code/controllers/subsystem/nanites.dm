SUBSYSTEM_DEF(nanites)
	name = "Nanites"
	wait = 0.05 SECONDS // we do our own processing buckets; scale up to 20 fps

	/// global glyph lookup; id = glyph instance
	var/list/glyph_lookup
	/// global glyph generation cache; orchestration pattern string = /datum/nanoswarm_glyph_generation
	var/list/pattern_lookup

/datum/controller/subsystem/nanites/Initialize()

/datum/controller/subsystem/nanites/proc/fetch_glyph(id) as /datum/nanoswarm_glyph

/datum/controller/subsystem/nanites/proc/fetch_pattern(pattern) as /datum/nanoswarm_pattern


#warn impl
