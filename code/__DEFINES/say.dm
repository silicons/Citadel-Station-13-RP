//? all things say, emote, visible, audible, go in this file

//! Message Types - flags; these are only obeyed by some procs.
/// can see when not blinded
#define MESSAGE_TYPE_VISIBLE					(1<<0)
/// can see when not deafened
#define MESSAGE_TYPE_AUDIBLE					(1<<1)
/// can see when in range always
#define MESSAGE_TYPE_OMNI						(1<<2)
/// can see if at same semantic container as source atom, e.g. on turf if it is, or in same container, etc
#define MESSAGE_TYPE_CONTAINER					(1<<3)
/// CANNOT be seen by ghosts
#define MESSAGE_TYPE_NO_GHOSTS					(1<<4)

//! Message Class - used for filtering
/// message is standard dsay
#define MESSAGE_CLASS_SAY						1
/// message is over radio
#define MESSAGE_CLASS_RADIO						2
/// message is from atom/object (either say or emote)
#define MESSAGE_CLASS_OBJECT					3
/// message is a normal emote
#define MESSAGE_CLASS_EMOTE						4
/// message is a subtle(r)
#define MESSAGE_CLASS_SUBTLE					5


//! Message Ranges
/// message range for silenced combat actions
#define MESSAGE_RANGE_COMBAT_SILENCED			1
/// message range for subtle combat actions
#define MESSAGE_RANGE_COMBAT_SUBTLE				3
/// message range for loud combat actions
#define MESSAGE_RANGE_COMBAT_LOUD				7
