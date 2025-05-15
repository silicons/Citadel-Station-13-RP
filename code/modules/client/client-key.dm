//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

/**
 * Get real ckey. This should always be used in place of `ckey`.
 */
/client/proc/get_real_ckey()
	#warn impl

/**
 * Get real key. This should always be used in place of `ckey`.
 */
/client/proc/get_real_key()
	#warn impl

/**
 * get effective ckey for render, respecting stealth keys
 */
/client/proc/get_public_key()
	return holder?.fakekey || deadmin_holder?.fakekey || key

/**
 * gets effective ckey & stealth key for render
 */
/client/proc/get_revealed_key()
	if(!(holder?.fakekey || deadmin_holder?.fakekey))
		return key
	var/fake_ckey = holder?.fakekey || deadmin_holder?.fakekey || "INVALID-KEY"
	return "[fake_ckey]/([key])"
