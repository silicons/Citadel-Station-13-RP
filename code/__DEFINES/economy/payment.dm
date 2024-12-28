//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

//* Payment proc flags *//

/// all-or-nothing, require that amount
#define PAYMENT_FLAG_CHECKED (1<<0)
/// allow overflow (we will give change)
#define PAYMENT_FLAG_OVERFLOW (1<<1)
/// do not emit default feedback
#define PAYMENT_FLAG_SUPPRESS_MESSAGE (1<<2)
/// do not emit any default sounds
#define PAYMENT_FLAG_SUPPRESS_SOUND (1<<3)

#define PAYMENT_FLAGS_SILENT (PAYMENT_FLAG_SUPPRESS_MESSAGE | PAYMENT_FLAG_SUPPRESS_SOUND)

//* Payment data returns *//

#define PAYMENT_DATA_LEGACY_RECIPIENT "l-recipient"
#define PAYMENT_DATA_LEGACY_LOCATION "l-location"
#define PAYMENT_DATA_LEGACY_DEVICE "l-device"
#define PAYMENT_DATA_LEGACY_REASON "l-reason"

//* Payment handler returns *//

/// allow payment / succeed
#define PAYMENT_HANDLER_CONTINUE 1
/// disallow payment / stop
#define PAYMENT_HANDLER_STOP 2
