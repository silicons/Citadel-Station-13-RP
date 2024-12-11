//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

/obj/item/paper_new
	name = "paper"
	desc = "A piece of paper."

	#warn sprite

	/// our owned document
	///
	/// * this may or may not be mutable
	/// * call [make_document_mutable()] before any edits.
	var/datum/document/document

/**
 * Ensures our document is mutable.
 *
 * * Makes a new document if we don't have one.
 */
/obj/item/paper_new/proc/make_document_mutable()
	document = document ? document.get_mutable() : new /datum/document

/obj/item/paper_new

/obj/item/paper_new

/obj/item/paper_new/ui_modul


/obj/item/paper_new/ui_static_data(mob/user, datum/tgui/ui)
	. = ..()


/obj/item/paper_new/ui_data(mob/user, datum/tgui/ui)
	. = ..()


/obj/item/paper_new/ui_act(action, list/params, datum/tgui/ui)
	. = ..()


/obj/item/paper_new/ui_interact(mob/user, datum/tgui/ui, datum/tgui/parent_ui)
	. = ..()



#warn impl
