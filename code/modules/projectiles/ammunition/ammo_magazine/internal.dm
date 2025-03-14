//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

/obj/item/ammo_magazine/internal
	magazine_internal = TRUE

/obj/item/ammo_magazine/internal/Initialize(mapload, max_ammo)
	src.ammo_max = max_ammo
	return ..()

/obj/item/ammo_magazine/internal/loaded

/obj/item/ammo_magazine/internal/loaded/Initialize(mapload, max_ammo, load_type)
	src.ammo_preload = load_type
	return ..()

/obj/item/ammo_magazine/internal/revolver
	ammo_vector = TRUE

/obj/item/ammo_magazine/internal/revolver/loaded

/obj/item/ammo_magazine/internal/revolver/loaded/Initialize(mapload, max_ammo, load_type)
	src.ammo_preload = load_type
	return ..()
