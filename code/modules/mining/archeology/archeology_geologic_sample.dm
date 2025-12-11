//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

/datum/archeology_geologic_sample
	/**
	 * * Nullable
	 * * Do not edit this directly, clone() it first; this may be a cached datum for performance.
	 */
	var/datum/archeology_dating_estimate/immutable_dating_estimate

/datum/archeology_geologic_sample/clone()
	var/datum/archeology_geologic_sample/cloning = new
	cloning.immutable_dating_estimate = immutable_dating_estimate?.clone()
	return cloning

/datum/archeology_geologic_sample/proc/clone_shallow()
	var/datum/archeology_geologic_sample/cloning = new
	cloning.immutable_dating_estimate = immutable_dating_estimate
	return cloning
