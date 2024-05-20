// todo: get rid of this and make it like DEFINE_ENUM
#define DEFINE_BITFIELD(v, f) /datum/bitfield/single/##v { \
	flags = ##f; \
	variable = #v; \
}

// todo: get rid of this and make it like DEFINE_ENUM
#define DEFINE_SHARED_BITFIELD(n, v, f) /datum/bitfield/multi/##n { \
	flags = ##f; \
	variables = ##v; \
}

// todo: get rid of this, rename BITFIELD_NEW to this
#define BITFIELD(thing) #thing = thing

// todo: impl
/// KEY: must be unique, may be arbitrary; not a string, as it's used in typepath generation
/// CONSTRAINTS: list(/type = list(varname, ...), ...)
/// BITFIELDS: list of BITFIELD_NEW().
#define DEFINE_BITFIELD_NEW(NAME, CONSTRAINTS, BITFIELDS)
#define BITFIELD_NEW(name, thing) name = thing
