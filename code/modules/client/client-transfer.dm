//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

/**
 * transfers us to a mob
 *
 * **never directly set ckey on a client or mob!**
 */
/client/proc/transfer_to(mob/moving_to)
	var/mob/moving_from = mob
	return moving_from.transfer_client_to(moving_to)
