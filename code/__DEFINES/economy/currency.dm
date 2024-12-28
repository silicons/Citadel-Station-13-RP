//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

//*                          Currency Names                           *//
//* Always use this in string interp, do not hardcode currency names. *//

/// currency name singular
#define CURRENCY_NAME_SINGULAR				"thaler"
/// currency name singular capitalized
#define CURRENCY_NAME_SINGULAR_PROPER		"Thaler"
/// currency name plural
#define CURRENCY_NAME_PLURAL				"thalers"
/// currency name plural capitalized
#define CURRENCY_NAME_PLURAL_PROPER			"Thalers"

//* Currency Types *//

/// hard currency.
#define CURRENCY_TYPE_CASH               (1<<0)
/// bitcoin wallet-likes
#define CURRENCY_TYPE_EWALLET            (1<<1)
/// some kind of bank-linking card
#define CURRENCY_TYPE_ELINK              (1<<2)

//* Currency Hints *//

/// hints to the backend that this currency is 'all or nothing', and can't be partial'd.
#define CURRECNY_HINT_DISCRETE           (1<<0)

//* static_currency_query return indices *//

#define STATIC_CURRENCY_QUERY_IDX_AMOUNT 1
#define STATIC_CURRENCY_QUERY_IDX_TYPE 2
#define STATIC_CURRENCY_QUERY_IDX_HINT 3
