//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers          *//

/datum/ai_dynamic_personality
	/// optimization, where
	/// `0` is 'use anything we want whenever'
	/// and `100` is 'use the most optimal thing always'
	var/optimization = 50
	/// strategical, where
	/// `0` is "use anything we want whenever we want"
	/// and `100` is "try not ot waste resources at all"
	var/strategical = 50
	/// patience, where
	/// `0` is "rush them immediately" and
	/// `100` is "wait as long as you need to while being safe"
	var/patience = 50

	// TODO: intelligence flags maybe?
	//       so some AIs won't know how to use guns,
	//       some don't know how to use complex devices, etc.
