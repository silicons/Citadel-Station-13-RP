//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

//* Is-rank helpers *//

/**
 * are we a guest account?
 */
/client/proc/is_guest()
	return IsGuestKey(key)

/**
 * are we localhost?
 */
/client/proc/is_localhost()
	return isnull(address) || (address in list("127.0.0.1", "::1"))

/**
 * are we any sort of staff rank?
 */
/client/proc/is_staff()
	return !isnull(holder)

//* Stealthmin *//

/**
 * should we be under stealthmin
 */
/client/proc/is_under_stealthmin()
	return !!(holder?.fakekey || deadmin_holder?.fakekey)
