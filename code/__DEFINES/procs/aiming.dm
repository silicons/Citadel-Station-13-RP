//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

//*                    trigger_aiming() trigger_flags                           *//
//* movement is intentionally not part of these; listen to movement separately. *//

/// we touched someone
#define TRIGGER_AIMING_TOUCHED_OTHER (1<<0)
/// we did a (significant) melee attack
#define TRIGGER_AIMING_MELEED_OTHER (1<<1)
/// we fired some kind of ranged weapon
#define TRIGGER_AIMING_FIRED_GUN (1<<2)
/// we communicated in an obvious way (headset?)
#define TRIGGER_AIMING_USED_COMMS (1<<3)
/// we used a signaller or other 'dangerous' item
/// * most items count as dangerous unless flagged otherwise
#define TRIGGER_AIMING_ITEM_DANGEROUS (1<<4)
/// we used something benign like a bike horn
#define TRIGGER_AIMING_ITEM_BENIGN (1<<5)
/// we touched / used a console
#define TRIGGER_AIMING_TOUCHED_CONSOLE (1<<6)
/// catch-all: invoked item.melee_attack_chain and DID_SOMETHING
#define TRIGGER_AIMING_C_ITEM_ATTACK_CHAIN
