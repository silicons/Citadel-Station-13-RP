//! ## LANGUAGE_FLAGS
/// Language is available if the speaker is whitelisted.
#define LANGUAGE_WHITELISTED  (1<<0)
/// Language can only be acquired by spawning or an admin.
#define LANGUAGE_RESTRICTED   (1<<1)
/// Language has a significant non-verbal component. Speech is garbled without line-of-sight.
#define LANGUAGE_NONVERBAL    (1<<2)
/// Language is completely non-verbal. Speech is displayed through emotes for those who can understand.
#define LANGUAGE_SIGNLANG     (1<<3)
/// Broadcast to all mobs with this language.
#define LANGUAGE_HIVEMIND     (1<<4)
/// Do not add to general languages list.
#define LANGUAGE_NONGLOBAL    (1<<5)
/// All mobs can be assumed to speak and understand this language. (audible emotes)
#define LANGUAGE_INNATE       (1<<6)
/// Do not show the "\The [speaker] talks into \the [radio]" message
#define LANGUAGE_NO_TALK_MSG  (1<<7)
/// No stuttering, slurring, or other speech problems.
#define LANGUAGE_NO_STUTTER   (1<<8)
/// Language is not based on vision or sound. //Todo: Add this into the say code and use it for the rootspeak languages.
#define LANGUAGE_ALT_TRANSMIT (1<<9)

DEFINE_BITFIELD(language_flags, list(
	BITFIELD(LANGUAGE_WHITELISTED),
	BITFIELD(LANGUAGE_RESTRICTED),
	BITFIELD(LANGUAGE_NONVERBAL),
	BITFIELD(LANGUAGE_SIGNLANG),
	BITFIELD(LANGUAGE_HIVEMIND),
	BITFIELD(LANGUAGE_NONGLOBAL),
	BITFIELD(LANGUAGE_INNATE),
	BITFIELD(LANGUAGE_NO_TALK_MSG),
	BITFIELD(LANGUAGE_NO_STUTTER),
	BITFIELD(LANGUAGE_ALT_TRANSMIT),
))
