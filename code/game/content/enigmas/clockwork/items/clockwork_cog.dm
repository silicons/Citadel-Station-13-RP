//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 silicons                             *//

/**
 * Integration cogs
 *
 * Spliced into entities.
 * Unlike most items, these have no alignment until spliced.
 * This also is not important enough to have a personality.
 */
CLOCKWORK_DESCRIPTION( \
	/obj/item/clockwork_cog, \
	"integration cog", \
	list( \
		"A small, sharp cog made out of replicant alloy.", \
		"Inserting this into a machine will allow the Hierophant Network to assert control over it.", \
	) \
)
/obj/item/clockwork_cog
	name = "dull cog"
	desc = "A strange cog made out of brass. It's quite dull."

	/// entity we are bound to / attached inside
	var/obj/host
	/// current alignment
	var/datum/clockwork_alignment/alignment

/obj/item/clockwork_cog/examine(mob/user, dist)
	. = ..()
	if(user.is_holding(src))
		. += SPAN_WARNING("It's impossibly smooth to the touch.")
	if(prob(5))
		clockwork_touch_someone_back(
			src,
			user,
			SPAN_WARNING("As you touch the surface of [src], you feel [pick("the metal touching you back", "a finger touching your palm", "something crawling over your skin")]."),
		)

/obj/item/clockwork_cog/afterattack(atom/target, mob/user, clickchain_flags, list/params)
	. = ..()

/obj/item/clockwork_cog/proc/integrate(atom/movable/victim)
	// perform injection
	forceMove(victim)
	victim.AddComponent(/datum/component/clockwork_cogged, src)

#warn impl all

/**
 * bind / interop component injected into entities that have been spliced with an integration cog
 */
/datum/component/clockwork_cogged
	/// the cog we are made from
	var/obj/item/clockwork_cog/cog
	/// k-v list for settings
	var/list/settings

/datum/component/clockwork_cogged/Initialize(obj/item/clockwork_cog/cog)
	if(!ismovable(parent))
		return COMPONENT_INCOMPATIBLE
	. = ..()
	if(. & COMPONENT_INCOMPATIBLE)
		return
	src.cog = cog

#warn need a query for settings / presets to configure machines with

//* Obj Hooks *//

GLOBAL_LIST_EMPTY(clockwork_integration_lookup)

/obj/proc/clockwork_integration_query()
	RETURN_TYPE(/datum/clockwork_integration)

	if(isnull(GLOB.clockwork_integration_lookup[type]))
		GLOB.clockwork_integration_lookup[type] = clockwork_integration_construct()
	return GLOB.clockwork_integration_lookup[type]

/**
 * returns /datum/clockwork_integration, which is then cached **by type**.
 */
/obj/proc/clockwork_integration_construct()
	RETURN_TYPE(/datum/clockwork_integration)

//* Integration Data *//

/datum/clockwork_integration
	/// presets
	var/list/datum/clockwork_integration_preset/presets

#warn impl

/datum/clockwork_integration_preset
	/// name
	var/name
	/// k-v options list
	var/list/options
	/// rendering image
	var/image/visual

/datum/clockwork_integration_preset/New(name, list/options, image/visual)
	src.name = name
	src.options = options
	src.visual = visual
