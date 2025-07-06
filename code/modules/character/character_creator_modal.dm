//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

/**
 * Dynamic character creator.
 *
 * Given an input,
 * * Automatically solves for allowed factions.
 * * Automatically solves for allowed species.
 * * Allows picking presets for characteristics later.
 * * Presents the initial picker.
 *
 * Can be used to modify an existing character datum, rather than a new one, as well.
 */
// TODO: mob_modal
/datum/mob_modal/character_creator_modal

	var/list/character_faction_ids = list()
	var/list/character

	var/datum/callback/handle_creation_callback

	var/ran_solver = FALSE


	#warn reconsider

/datum/mob_modal/character_creator_modal/New(mob/user)
	..()
	if(isnull(handle_creation_callback))
		handle_creation_callback = CALLBACK(src, PROC_REF(new_character_impl))

/datum/mob_modal/character_creator_modal/proc/initialize_solver(
	list/character_faction_ids,
)
	ran_solver = FALSE

/datum/mob_modal/character_creator_modal/proc/constrain_species(
	list/species_ids,
	forcefully_add_unavailable,
)

/datum/mob_modal/character_creator_modal/proc/constrain_backgrounds(

)

/datum/mob_modal/character_creator_modal/proc/solve()


	ran_solver = TRUE

/datum/mob_modal/character_creator_modal/ui_static_data(mob/user, datum/tgui/ui)
	. = ..()
	CRASH("unimplemented")

/datum/mob_modal/character_creator_modal/ui_data(mob/user, datum/tgui/ui)
	. = ..()
	CRASH("unimplemented")

/datum/mob_modal/character_creator_modal/ui_interact(mob/user, datum/tgui/ui, datum/tgui/parent_ui)
	CRASH("unimplemented")

/datum/mob_modal/character_creator_modal/ui_act(action, list/params, datum/tgui/ui)
	. = ..()
	if(.)
		return
	CRASH("unimplemented")


/datum/mob_modal/character_creator_modal/proc/create()

/datum/mob_modal/character_creator_modal/proc/new_character_impl(datum/mob_modal/character_creator_modal/modal) as /datum/character
	#warn imprint
	return new /datum/character

