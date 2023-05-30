/obj/procedural_marker/derilect

/obj/procedural_marker/derilect/connection
	/// chances of being sealed. if it is, it will not spawn another room connected to it.
	/// this cannot be modulated by the generator.
	/// rolls first.
	var/probability_sealed = 0
	/// chances of being closed. if it is, it will not immediately spawn another room connected to it.
	/// the generator can override this, or the probability of this.
	/// rolls second.
	var/probability_closed = 0
	/// what we (the host room) are. null to default to room, you usually want this as null.
	var/derilect_fragment
	/// what we want to connect to us
	var/derilect_connect = DERILECT_ACCEPT_ALL
	/// how big we are
	/// this is total width, not radius!
	/// rules:
	/// odd numbers - centered
	/// even numbers - shifted off to the right hand side, when looking outwards.
	/// e.g. 2 size connection facing north at 10, 10, 1 is occupying 10, 10, 1 and 11, 10, 1.
	///                        facing south at 10, 10, 1 is occupying 9, 10, 1 and 10, 10, 1.
	var/size = 1
	/// do we prefer same size connections?
	var/size_bias = TRUE

#warn impl

