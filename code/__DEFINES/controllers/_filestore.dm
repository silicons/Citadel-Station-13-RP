//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

//* This is here in [code/__DEFINES/controllers/_filestore.dm] for compile order reasons. *//
/datum/controller/subsystem/filestore/proc/__create_repositories()

//* This is here in [code/__DEFINES/controllers/_filestore.dm] for compile order reasons. *//
/datum/controller/subsystem/filestore/proc/__init_repositories()

//* This is here in [code/__DEFINES/controllers/_filestore.dm] for compile order reasons. *//
/datum/controller/subsystem/filestore/proc/__get_all_repositories()

// todo: redo recover logic; maybe /datum/controller as a whole should be brushed up
#define filestore_DEF(what) \
GLOBAL_REAL(RS##what, /datum/controller/filestore/##what); \
/datum/controller/filestore/##what/New(){ \
	if(global.RS##what != src && istype(global.RS##what)){ \
		Recover(global.RS##what); \
		qdel(global.RS##what); \
	} \
	global.RS##what = src; \
} \
/datum/controller/subsystem/filestore/var/datum/controller/filestore/##what/RS##what; \
/datum/controller/subsystem/filestore/__create_repositories() { \
	..(); \
	RS##what = new; \
	RS##what.Create(); \
} \
/datum/controller/subsystem/filestore/__init_repositories() { \
	..(); \
	RS##what.Initialize(); \
} \
/datum/controller/subsystem/filestore/__get_all_repositories() { \
	. = ..() || list(); \
	. += RS##what; \
} \
/datum/controller/filestore/##what

/// Returned from /datum/controller/filestore's fetch_or_defer() if we don't have something
/// on hand, but also don't know that it doesn't exist.
#define filestore_FETCH_DEFER "defer"

#warn impl?
