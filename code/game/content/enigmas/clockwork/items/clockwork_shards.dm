//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 silicons                             *//

/obj/item/trash/clockwork_shards
	name = "metallic shards"
	desc = "A set of dull, metallic shards."

/obj/item/trash/clockwork_shards/Initialize(mapload, amount)
	#warn impl
	return ..()

/obj/item/trash/clockwork_shards/ephemeral
	name = "metallic shards"
	desc = "A set of dull, metallic shards. It seems to be melting away before your eyes."

#warn impl
#warn clockwork descriptions
#warn collate ; stack-like mechanics?
#warn melt on pickup tbvqh
