//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

/datum/document_fragment
	/// tgui key
	///
	/// * do not change this.
	var/key
	/// content representation
	///
	/// * the semantics of this changes per fragment.
	var/repr_val
	/// positional representation
	///
	/// * the semantics of this changes per fragment.
	var/repr_pos

/datum/document_fragment/proc/data()
	return list("key" = key, "val" = repr_val, "pos" = repr_pos)

/**
 * repr_val: content as text (markdown formatted)
 * repr_pos: "x y angle"; angle is in degrees, rounded to nearest 1. "100 300 70"
 * font: text string
 * color: text string "#ffffffaa"
 * size: number as px
 */
/datum/document_fragment/text
	var/color = "#000000"
	var/font
	var/size

/datum/document_fragment/text/New(content, pos_x, pos_y, angle, color, font, size)
	src.repr_val = content
	src.repr_pos = "[pos_x] [pos_y] [angle]"
	if(color != src.color)
		src.color = color
	if(font != src.font)
		src.font = font
	if(size != src.size)
		src.size = size

/datum/document_fragment/text/data()
	. = ..()
	.["color"] = color
	.["font"] = font
	.["size"] = size

/**
 * repr_val: "thickness color";
 *           thickness: px
 *           color: "#aabbccdd" 6-8 char
 * repr_pos: "x1 y1 x2 y2 ...";
 */
/datum/document_fragment/polyline

/datum/document_fragment/polyline/New(thickness = 5, color = "#000000", list/ordered_coordinates)
	repr_val = "[thickness] [color]"
	repr_pos = jointext(ordered_coordinates, " ")

/datum/document_fragment/rectangle
	// todo: implement

/datum/document_fragment/ellipse
	// todo: implement

/**
 * Raw HTML fragment.
 *
 * * This is **extremely, extremely dangerous.**
 *   Players should never have access to this!
 *
 * repr_val: "raw html here"
 * repr_pos: "x1 y1" of top left of bounding box
 */
/datum/document_fragment/html

/datum/document_fragment/html/New(html, top_left_x, top_left_y)
	repr_val = html
	repr_pos = "[top_left_x] [top_left_y]"
