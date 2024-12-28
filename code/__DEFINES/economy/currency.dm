//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

//* Currency name defines. Always use this in string interp, do not hardcode currency names. *//

/// currency name singular
#define CURRENCY_NAME_SINGULAR				"thaler"
/// currency name singular capitalized
#define CURRENCY_NAME_SINGULAR_PROPER		"Thaler"
/// currency name plural
#define CURRENCY_NAME_PLURAL				"thalers"
/// currency name plural capitalized
#define CURRENCY_NAME_PLURAL_PROPER			"Thalers"

//* Static currency types. *//

/// hard currency. why do we use this in 25th century?
#define CURRENCY_STATIC_TYPE_CASH               (1<<1)
/// bitcoin wallet practically
#define CURRENCY_STATIC_TYPE_HOLOCHIPS          (1<<2)

/// hints to the backend that this currency is 'all or nothing', and can't be partial'd.
#define CURRECNY_STATIC_TYPE_HINT_DISCRETE      (1<<3)
