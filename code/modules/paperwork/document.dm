//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 silicons                             *//

/**
 * datastore for a piece of paper
 */
/datum/document
	/// hashed id; only computed after persisting.
	/// the document must be immutable after!
	var/immutable_hash
	/// width in pixels
	var/width = 600
	/// height in pixels
	var/height = 900

	/// written text
	/// newlines are allowed
	///
	/// schema:
	/// "x-y-rotation-size-text"
	/// x and y are float pixel positions
	/// rotation is radians clockwise
	/// size is in pixels
	/// text is a unicode string
	///
	/// text is markdown, with added LaTeX support via MathJax
	var/list/fragments
	/// shapes
	///
	/// schema:
	/// "ellipse-x-y-radius-eccentricity-turn": ellipse. turn is in radians clockwise.
	/// "rect-x1-y1-x2-y2": rectangle.
	/// "line-x1-y1-x2-y2": line.
	/// "shape-id-x1-y1-size": shape of given id, at given shape (distance from center).
	///                        valid ids are defined js-side.
	//                         x/y are centered.
	/// "bezier3-x1-y1-x2-y2-x3-y3": 3-point bezier curve
	/// "bezier4-x1-y1-x2-y2-x3-y3-x4-y4": 4-point bezier curve
	var/list/polygons
	/// stamps
	///
	/// unlike 'shape' schema, these are not js-defined shapes,
	/// but rather code-dfined stamps
	///
	/// schema:
	/// "id-x1-y1-size": put a stamp at given location
	///                  size is an absolute distance from center.
	///                  x/y are centered.
	var/list/stamps

	/// current fragment count
	var/fragment_count = 0
	/// current total unicode character count
	var/character_count = 0
	/// current polygon count
	var/polygon_count = 0
	/// current stamp count
	var/stamp_count = 0

	/// layer off of this document
	var/layer_from
	/// current layer depth
	/// * remember: this is how many additional layers the client-side will need to merge
	/// * please ensure layer stays at or below 5
	/// * if layer gets to a certain value, SSpaperwork will merge everything into a fresh document (assuming persistence is enabled)
	/// * additional layers will not allow putting in more fragments/polygons/stamps than otherwise allowed
	var/layer_depth



#warn impl
