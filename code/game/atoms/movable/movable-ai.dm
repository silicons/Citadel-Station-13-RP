//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station developers.          *//

/atom/movable/proc/get_ai_adapters() as /list
	return get_self_ai_adapters() + get_equipment_ai_adapters()

/atom/movable/proc/get_self_ai_adapters() as /list
	return list()

/atom/movable/proc/get_equipment_ai_adapters() as /list
	return list()
