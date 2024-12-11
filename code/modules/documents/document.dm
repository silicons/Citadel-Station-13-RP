//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

/**
 * Documents
 *
 * * Documents are rendered with `tgui/interfaces/Document`. This is an advanced WYSIWYG editor that
 *   can be embedded in other interfaces.
 */
/datum/document
	/// serialized hash
	///
	/// * if non-null, we are permanently stored, and to make a mutable one we will need to be cloned.
	#warn impl
	var/serialized_hash

	/// document fragments we are comprised of.
	///
	/// * The ordering does matter here. They're layered by order, for the time being.
	var/list/datum/document_fragment/fragments = list()

#warn impl

/**
 * Gets a mutable copy of ourselves.
 */
/datum/document/proc/get_mutable()
	return src

/**
 * Get our data as a full list.
 */
/datum/document/proc/ui_data()
	. = list()
	.["metadata"] = list(
		"serializedHash" = serialized_hash,
	)
	.["fragmentCount"] = length(fragments)
	for(var/i in 1 to length(fragments))
		var/datum/document_fragment/fragment = fragments[i]
		.["fragment-[i]"] = fragment.ui_Data()

	#warn impl

/**
 * Draw a fragment ontop.
 */
/datum/document/proc/draw_fragment(datum/document_fragment/fragment)

// todo: ui_partial_data
