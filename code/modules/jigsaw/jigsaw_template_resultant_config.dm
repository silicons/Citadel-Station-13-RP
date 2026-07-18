//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2026 Citadel Station Developers           *//

/datum/jigsaw_template_resultant_config
	/// always start with these templates, if exists
	/// * may be typepaths or instances
	/// * this ignores budget and will not take from it.
	var/list/datum/prototype/jigsaw_template/initial_templates = list()
	/// ***attempt*** to place these templates, associate to count
	/// * this ignores budget and will not take from it.
	var/list/datum/prototype/jigsaw_template/priority_templates = list()
	/// require placement of these templates, associate to count
	/// * if any of these fail to place, the generation fails
	/// * this ignores budget and will not take from it.
	var/list/datum/prototype/jigsaw_template/required_templates = list()

	/// templates to use, weighted.
	/// * may be typepaths or instances
	/// * this are constrained by budgets.
	var/list/datum/prototype/jigsaw_template/weighted_templates = list()
