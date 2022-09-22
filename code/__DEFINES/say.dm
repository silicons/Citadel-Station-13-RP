//? all things say, emote, visible, audible, go in this file

//! Message Types - flags
/// can see when not blinded
#define MESSAGE_TYPE_VISIBLE					(1<<0)
/// can see when not deafened
#define MESSAGE_TYPE_AUDIBLE					(1<<1)
/// can see when in range always
#define


//! Message Ranges
/// message range for silenced combat actions
#define MESSAGE_RANGE_COMBAT_SILENCED			1
/// message range for subtle combat actions
#define MESSAGE_RANGE_COMBAT_SUBTLE				3
/// message range for loud combat actions
#define MESSAGE_RANGE_COMBAT_LOUD				7
