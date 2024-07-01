//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 silicons                             *//

/datum/supply_item2/gas
	units = "moles"

/datum/supply_item2/gas/resolve()
	if(istext(product))
		. = global.gas_data.gases[product]
		if(.)
			return
	return ..()
