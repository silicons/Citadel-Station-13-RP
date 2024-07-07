//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 silicons                             *//

//* global safety constants *//
//*   -- do not touch --    *//

//? These are set for resource sanity, not for IC / rules enforcement.  ?//
//? Do not touch these other than for codebase stability / UX.          ?//

/// max fragments in a document
#define PAPERWORK_MAX_FRAGMENTS 128
/// max characters in a fragment
#define PAPERWORK_MAX_FRAGMENT_SIZE 4096
/// max characters in a document
#define PAPERWORK_MAX_CHARACTERS 32768
/// max polygons in a document
#define PAPERWORK_MAX_POLYGONS 128
/// max stamps in a document
#define PAPERWORK_MAX_STAMPS 64

#warn impl
