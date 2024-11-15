//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

/datum/ai_holder
	/// registered adapters
	var/list/datum/ai_adapter/adapter_registration
	/// adapter types we care about
	var/adapter_types = NONE

#warn impl


/datum/ai_holder/proc/register_adapter(datum/ai_adapter/adapter)

/datum/ai_holder/proc/unregister_adapter(datum/ai_adapter/adapter)
