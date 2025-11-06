//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

// TODO: may need to optimize
/atom/MouseEntered(location, control, params)
	..()
	usr.client.mouse_predicted_last_atom = src

// TODO: may need to optimize
/atom/MouseExited(location, control, params)
	..()
	usr.client.mouse_predicted_last_atom = null
