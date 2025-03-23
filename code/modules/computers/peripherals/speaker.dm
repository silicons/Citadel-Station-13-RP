//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

/obj/item/computer_peripheral/speaker
	name = /obj/item/computer_peripheral::name + " (speaker)"
	#warn icon

	/// volume modulator
	/// * 0 is normal negative is less positive is more
	var/volume_mod

/obj/item/computer_peripheral/speaker/proc/play_sound(sfx, volume, volume)
