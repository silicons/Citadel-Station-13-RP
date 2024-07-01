//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 silicons                             *//

/datum/supply_item2/material
	category = "Materials"
	units = "sheets"

/datum/supply_item2/material/resolve()
	if(istext(product))
		. = SSmaterials.resolve_material(product)
		if(.)
			return
	return ..()

