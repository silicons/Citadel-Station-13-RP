//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station developers.          *//

/atom/movable/proc/ai_get_adapters() as /list
	return ai_get_self_adapters() + ai_get_equipment_adapters()

/atom/movable/proc/ai_get_self_adapters() as /list
	return list()

/atom/movable/proc/ai_get_equipment_adapters() as /list
	return list()

/atom/movable/proc/ai_supports_basic_movement()
	return FALSE

/**
 * @return ds to reschedule, 0 if failed
 */
/atom/movable/proc/ai_basic_move(dir)
	return 0
