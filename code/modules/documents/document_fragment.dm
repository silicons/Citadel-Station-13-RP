//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

/**
 * A document fragment.
 *
 * * A formal definition of all of these is located at `tgui/interfaces/Document/types/DocumentFragment.ts`.
 */
/datum/document_fragment
	/// tgui key
	///
	/// * do not change this.
	var/key

/datum/document_fragment/proc/ui_data()
	return list("key" = key)

/**
 * required:
 *
 * content: markdown formatted text
 * x: top left offset in pixels
 * y: top left offset in pixels
 *
 * optional:
 *
 * angle: angle clockwise rotation from north in degrees
 * color: text string "#ffffffaa"
 */
/datum/document_fragment/markdown
	key = "markdown"
	var/content
	var/pos_x
	var/pos_y
	var/angle
	var/color = "#000000"

/datum/document_fragment/markdown/New(content, pos_x, pos_y, angle, color)
	src.content = content
	src.pos_x = pos_x
	src.pos_y = pos_y
	if(!isnull(angle) && angle != src.angle)
		src.angle = angle
	if(!isnull(color) && color != src.color)
		src.color = color

/datum/document_fragment/markdown/ui_data()
	. = ..()
	.["content"] = content
	.["pos_x"] = pos_x
	.["pos_y"] = pos_y
	.["angle"] = angle
	.["color"] = color

/**
 * Raw HTML fragment.
 *
 * * This is **extremely, extremely dangerous.**
 *   Players should never have access to this!
 *
 * required:
 *
 * content: raw HTML to put into the div
 * pos_x: from top left in pixels
 * pos_y: from top left in pixels
 */
/datum/document_fragment/html
	key = "html"
	var/content
	var/pos_x
	var/pos_y

/datum/document_fragment/html/New(content, pos_x, pos_y)
	src.content = content
	src.pos_x = pos_x
	src.pos_y = pos_y

#warn below

/**
 * style: "solid"
 * color: "aabbccdd" 6-8 char
 * vertices: "x1 y1 x2 y2 ..." must be even number (duh); offsets are pixel from top left
 */
/datum/document_fragment/polyline
	key = "polyline"
	var/style = "solid"
	var/color = "#000000"
	var/vertices

/datum/document_fragment/polyline/New(style, color, list/pixel_vertices)
	if(!isnull(style) && style != src.style)
		src.style = style
	if(!isnull(color) && color != src.color)
		src.color = color
	vertices = jointext(pixel_vertices, " ")

/datum/document_fragment/polyline/ui_data()
	. = ..()
	.["style"] = style
	.["color"] = color
	.["vertices"] = vertices

/datum/document_fragment/rectangle
	// todo: implement

/datum/document_fragment/ellipse
	// todo: implement
