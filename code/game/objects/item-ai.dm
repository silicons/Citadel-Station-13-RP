//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station developers.          *//

/obj/item/proc/request_ai_adapter()
	if(!ai_adapter && ai_adapter_type)
		ai_adapter = new ai_adapter_type
	return ai_adapter
