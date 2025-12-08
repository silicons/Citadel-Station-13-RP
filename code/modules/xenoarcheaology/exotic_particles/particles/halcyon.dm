//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

//*                 woe, clockwork cult upon thee                         *//
//* while the rest of the module has integrations for external stuff,     *//
//* and special snowflake shit for EMs should be outside of the folders,  *//
//* because clockwork cult is the real reason this system got written     *//
//* ontop of the science department, it gets special treatment.           *//

//*                     as a general guide                                *//
//* - 'halcyon' is just the in-code project name for the clockwork cult;  *//
//*   much like how 'hierophant' is also going to refer to a particular   *//
//*   global brand of magic.                                              *//
//*   there's no real IC name for it that is known by the world.          *//
//* - clockcult-intrinsic things will not require these to work           *//
//* - exotic particle interactions will work for these                    *//
//* - generally disrupting these is possible but extremely difficult      *//
//* - generally when we can, we try to project these for their effects    *//
//*   within clockcult so they can interact with things.                  *//
//* - each particle will have a seemingly insane number of traits         *//
//*   and effects; they're not all active, obviously, but they're there   *//
//*   because it literally makes sense for them to be there.              *//

/datum/prototype/exotic_particle/halcyon
	abstract_type = /datum/prototype/exotic_particle/halcyon

/**
 * primary carrier wave + energy, affects energy
 */
/datum/prototype/exotic_particle/halcyon/carrier
	name = "Halcyon Carrier Wave"
	id = "halcyon-energy"

/**
 * transmutes and transfers matter, affects physics
 */
/datum/prototype/exotic_particle/halcyon/reshape
	name = "Halcyon Transference Wave"
	id = "halcyon-matter"

/**
 * transfers thoughts and gives life to the lifeless, affects mind / heuristics
 */
/datum/prototype/exotic_particle/halcyon/commune
	name = "Halcyon Consciousness Wave"
	id = "halcyon-mind"

/**
 * binding wave that interacts with other exotic particles and occult things
 */
/datum/prototype/exotic_particle/halcyon/antimagic
	name = "Halcyon Suppression Wave"
	id = "halcyon-antimagic"

#warn impl
