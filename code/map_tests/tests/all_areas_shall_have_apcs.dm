//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

/datum/map_test/all_areas_shall_have_apcs

/datum/map_test/all_areas_shall_have_apcs/run(list/zlevels)
	for(var/area/A in world)
		if(!(A.z in zlevels))
			continue
		if(A.apc)
			if(A.always_unpowered)
				emit_error(A, "Shouldn't have APC - Always Unpowered", "Has APC, but always unpowered.")
			else if(!A.requires_power)
				emit_error(A, "Shouldn't have APC - Doesn't Require Power", "Has APC, but doesn't require power.")
			else if(A.test_allow_no_apc)
				emit_error(A, "Shouldn't have APC - test_allow_no_apc enabled", "Has APC. An area should not be flagged as no-apc-allowed if it is going to have an APC.")
			continue
		if(A.always_unpowered)
			emit_notice(A, "Allow APC-less - Always unpowered")
		else if(!A.requires_power)
			emit_notice(A, "Allow APC-less - Doesn't require power")
		else if(A.test_allow_no_apc)
			emit_notice(A, "Allow APC-less - test_allow_no_apc")
		else
			emit_error(A, "No APC", "This area lacks an APC.")
