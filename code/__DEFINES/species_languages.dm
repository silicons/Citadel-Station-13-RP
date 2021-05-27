// Species flags.
#define NO_MINOR_CUT      (1 << 0) // Can step on broken glass with no ill-effects. Either thick skin (diona), cut resistant (slimes) or incorporeal (shadows)
#define IS_PLANT          (1 << 1) // Is a treeperson.
#define NO_SCAN           (1 << 2) // Cannot be scanned in a DNA machine/genome-stolen.
#define NO_PAIN           (1 << 3) // Cannot suffer halloss/recieves deceptive health indicator.
#define NO_SLIP           (1 << 4) // Cannot fall over.
#define NO_POISON         (1 << 5) // Cannot not suffer toxloss.
#define NO_EMBED		  (1 << 6) // Can step on broken glass with no ill-effects and cannot have shrapnel embedded in it.
#define NO_HALLUCINATION  (1 << 7) // Don't hallucinate, ever
#define NO_BLOOD		  (1 << 8) // Never bleed, never show blood amount
#define UNDEAD			  (1 << 9) // Various things that living things don't do, mostly for skeletons
#define NO_INFECT		  (1 << 10) // Don't allow infections in limbs or organs, similar to IS_PLANT, without other strings.
#define NO_DEFIB          (1 << 11) // Cannot be defibbed
// unused: 0x8000 - higher than this will overflow

// Species EMP vuln for carbons
#define EMP_PAIN	0x1	// EMPs cause pain
#define EMP_BLIND	0x2	// EMPs cause screenflash and blindness
#define EMP_DEAFEN	0x4	// EMPs cause deafness
#define EMP_CONFUSE	0x8	// EMPs cause disorientation
#define EMP_WEAKEN	0x10	// EMPs cause collapsing (at high severity only)
#define EMP_BRUTE_DMG	0x20	// EMPs inflict brute damage
#define EMP_BURN_DMG	0x40	// EMPs inflict burn damage
#define EMP_TOX_DMG	0x80	// EMPs inflict toxin damage
#define EMP_OXY_DMG	0x100	// EMPs inflict oxy damage

// Species allergens
#define MEAT		0x1	// Skrell won't like this.
#define FISH		0x2	// Seperate for completion's sake. Still bad for skrell.
#define FRUIT		0x4	// An apple a day only keeps the doctor away if they're allergic.
#define VEGETABLE	0x8	// Taters 'n' carrots. Potato allergy is a thing, apparently.
#define GRAINS		0x10	// Wheat, oats, etc.
#define BEANS		0x20	// The musical fruit! Includes soy.
#define SEEDS		0x40	// Hope you don't have a nut allergy.
#define DAIRY		0x80	// Lactose intolerance, ho! Also bad for skrell.
#define FUNGI		0x100	// Delicious shrooms.
#define COFFEE		0x200	// Mostly here for tajara.
#define GENERIC		0x400	// Catchall for stuff that doesn't fall into the groups above. You shouldn't be allergic to this type, ever.
#define SUGARS		0x800	// For unathi-like reactions
#define EGGS      0x1000 // For Skrell eggs allergy

// Allergen reactions
#define AG_TOX_DMG	0x1	// the classic 
#define AG_OXY_DMG	0x2	// intense airway reactions
#define AG_EMOTE	0x4	// general emote reactions based on affect type
#define AG_PAIN		0x8	// short-lived hurt
#define AG_WEAKEN	0x10	// too weak to move, oof
#define AG_BLURRY	0x20	// blurred vision!
#define AG_SLEEPY	0x40	// fatigue/exhaustion

// Species spawn flags
#define SPECIES_IS_WHITELISTED				(1<<0) // Must be whitelisted to play.
#define SPECIES_IS_RESTRICTED				(1<<1) // Is not a core/normally playable species. (castes, mutantraces)
#define SPECIES_CAN_JOIN					(1<<2) // Species is selectable in chargen.
#define SPECIES_NO_FBP_CONSTRUCTION			(1<<3) FBP of this species can't be made in-game.
#define SPECIES_NO_FBP_CHARGEN				(1<<4) // FBP of this species can't be selected at chargen.
#define SPECIES_NO_POSIBRAIN				(1<<5) // FBP of this species cannot have a positronic brain.
#define SPECIES_NO_DRONEBRAIN				(1<<6) // FBP of this species cannot have a drone intelligence.
#define SPECIES_WHITELIST_SELECTABLE		(1<<7)

// Species appearance flags
#define HAS_SKIN_TONE     (1 << 0) // Skin tone selectable in chargen. (0-255)
#define HAS_SKIN_COLOR    (1 << 1) // Skin colour selectable in chargen. (RGB)
#define HAS_LIPS          (1 << 2) // Lips are drawn onto the mob icon. (lipstick)
#define HAS_UNDERWEAR     (1 << 3) // Underwear is drawn onto the mob icon.
#define HAS_EYE_COLOR     (1 << 4) // Eye colour selectable in chargen. (RGB)
#define HAS_HAIR_COLOR    (1 << 5) // Hair colour selectable in chargen. (RGB)
#define RADIATION_GLOWS   (1 << 6) // Radiation causes this character to glow.


// Languages.
#define LANGUAGE_GALCOM "Galactic Common"
#define LANGUAGE_EAL "Encoded Audio Language"
#define LANGUAGE_SWARMBOT "Ancient Audio Encryption"
#define LANGUAGE_SOL_COMMON "Sol Common"
#define LANGUAGE_UNATHI "Sinta'unathi"
#define LANGUAGE_SIIK "Siik"
#define LANGUAGE_SKRELLIAN "Common Skrellian"
#define LANGUAGE_TRADEBAND "Tradeband"
#define LANGUAGE_GUTTER "Gutter"
#define LANGUAGE_SIGN "Sign Language"
#define LANGUAGE_SCHECHI "Schechi"
#define LANGUAGE_ROOTLOCAL "Local Rootspeak"
#define LANGUAGE_ROOTGLOBAL "Global Rootspeak"
#define LANGUAGE_CULT "Cult"
#define LANGUAGE_OCCULT "Occult"
#define LANGUAGE_CHANGELING "Changeling"
#define LANGUAGE_VOX "Vox-Pidgin"
#define LANGUAGE_TERMINUS "Terminus"
#define LANGUAGE_SKRELLIANFAR "High Skrellian"
#define LANGUAGE_MINBUS "Minbus"
#define LANGUAGE_EVENT1 "Occursus"
#define LANGUAGE_AKHANI "Akhani"
#define LANGUAGE_ALAI "Alai"
#define LANGUAGE_ZADDAT "Vedahq"
#define LANGUAGE_GIBBERISH "Babel"
#define LANGUAGE_SQUEAKISH "Squeakish"
#define LANGUAGE_VERNAL "Vernal"

//Languages from _vr file
#define LANGUAGE_SLAVIC "Pan-Slavic"
#define LANGUAGE_BIRDSONG "Birdsong"
#define LANGUAGE_SAGARU "Sagaru"
#define LANGUAGE_CANILUNZT "Canilunzt"
#define LANGUAGE_ECUREUILIAN "Ecureuilian"
#define LANGUAGE_DAEMON "Daemon"
#define LANGUAGE_ENOCHIAN "Enochian"
#define LANGUAGE_BONES "Echorus"
#define LANGUAGE_VESPINAE "Vespinae"

#define LANGUAGE_CHIMPANZEE "Chimpanzee"
#define LANGUAGE_NEAERA "Neaera"
#define LANGUAGE_STOK "Stok"
#define LANGUAGE_FARWA "Farwa"

#define LANGUAGE_SHADEKIN "Shadekin Empathy"


// Language flags.
#define WHITELISTED  (1 << 0) // Language is available if the speaker is whitelisted.
#define RESTRICTED   (1 << 1) // Language can only be acquired by spawning or an admin.
#define NONVERBAL    (1 << 2) // Language has a significant non-verbal component. Speech is garbled without line-of-sight.
#define SIGNLANG     (1 << 3) // Language is completely non-verbal. Speech is displayed through emotes for those who can understand.
#define HIVEMIND     (1 << 4) // Broadcast to all mobs with this language.
#define NONGLOBAL    (1 << 5) // Do not add to general languages list.
#define INNATE       (1 << 6) // All mobs can be assumed to speak and understand this language. (audible emotes)
#define NO_TALK_MSG  (1 << 7) // Do not show the "\The [speaker] talks into \the [radio]" message
#define NO_STUTTER   (1 << 8) // No stuttering, slurring, or other speech problems
#define ALT_TRANSMIT (1 << 9) // Language is not based on vision or sound (Todo: add this into the say code and use it for the rootspeak languages)

#define SKIN_NORMAL (1 << 0)
#define SKIN_THREAT (1 << 1)
#define SKIN_CLOAK  (1 << 2)
