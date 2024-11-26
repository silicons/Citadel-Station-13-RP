//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

// //* This is here in [code/__DEFINES/controllers/_repositories.dm] for compile order reasons. *//
/datum/controller/subsystem/filestore/proc/__create_filestores()

// //* This is here in [code/__DEFINES/controllers/_repositories.dm] for compile order reasons. *//
/datum/controller/subsystem/filestore/proc/__init_filestores()

// todo: redo recover logic; maybe /datum/controller as a whole should be brushed up
#define FILESTORE_DEF(what) \
GLOBAL_REAL(FS##what, /datum/controller/filestore/##what); \
/datum/controller/filestore/##what/New(){ \
	if(global.FS##what != src && istype(global.FS##what)){ \
		Recover(global.FS##what); \
		qdel(global.FS##what); \
	} \
	global.FS##what = src; \
} \
/datum/controller/subsystem/filestore/var/datum/controller/filestore/##what/FS##what; \
/datum/controller/subsystem/filestore/__create_repositories() { \
	..(); \
	FS##what = new; \
	FS##what.Create(); \
} \
/datum/controller/subsystem/filestore/__init_repositories() { \
	..(); \
	FS##what.Initialize(); \
} \
/datum/controller/filestore/##what

#warn this shit
