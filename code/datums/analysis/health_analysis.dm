//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

/**
 * contains a health analysis request
 * * works somewhat like examine / clickchain; this is passed through
 * * much like the former, this IS mutable while being passed around!
 */
/datum/analyze_health
	/// granularity of radiation reporting
	var/rad_analysis = ANALYZE_HEALTH_RADIATION_NONE

	/// granularity of physical injury reporting (brute/burn, usually)
	var/phys_analysis = ANALYZE_HEALTH_PHYS_NONE
	/// analyze phys by zone
	var/phys_by_zone = FALSE

	/// granularity of organ injury reporting
	var/organ_analysis = ANALYZE_HEALTH_ORGAN_NONE
	/// analyze organ location
	var/organ_see_zone = FALSE

/**
 * contains emitted data for a mob
 * * doesn't contain data about who it is / identity / etc; this only contains
 *   things that were asked to be captured in the analysis
 */
/datum/health_analysis


#warn impl all
