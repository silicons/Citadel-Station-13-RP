//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

/obj/structure/disperser_shell/airburst
	name = /obj/structure/disperser_shell::name + " (airburst)"

	/// range before hitting a significant structure that we should
	/// burst on.
	var/airburst_distance = 5

#warn impl

/**
 * @params
 * * entity - overmap entity
 * * where - where we are calculated to airburst at
 * * projectile - (optional) the projectile we travelled in on
 * * detected - what we are airbursting because of (predicted impact)
 * * distance - how far away are we from predicted impact
 * * angle - our approximate travel angle
 */
/obj/structure/disperser_shell/airburst/proc/on_projectile_airburst(obj/overmap/entity/entity, turf/where, obj/overmap/entity/projectile/disperser_shell/projectile, turf/detected, distance, angle)
	return

/**
 * @params
 * * entity - overmap entity
 * * where - where we are calculated to airburst at
 * * projectile - (optional) the projectile we travelled in on
 */
/obj/structure/disperser_shell/airburst/proc/on_bombardment_airburst(obj/overmap/entity/entity, turf/where, obj/overmap/entity/projectile/disperser_shell/projectile)
	return
