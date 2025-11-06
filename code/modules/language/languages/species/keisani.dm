/datum/prototype/language/species/keisani
	id = LANGUAGE_ID_KEISANI
	name = LANGUAGE_KEISANI
	language_flags = LANGUAGE_WHITELISTED
	translation_class = TRANSLATION_CLASS_DEFAULT_RARE_RACE
	desc = "The language of Ancient Keisa, it's composed of deep tones and throaty syllables working in harmony. The emergence of surviving drone units and continuous archeological digs have allowed it to be taught and learned to an extent, though it remains an incredibly niche language even in xenoarcheology circles."
	speech_verb = "speaks"
	ask_verb = "inquires"
	exclaim_verb = "promulgates"
	colour = "keisani" //so sandy
	//does not use syllables
	syllables = list()
	shorthand = "KEI"

	scrambler = /datum/language_scrambler/replacement{
		replace_map = list(
			"a" = "⋏",
			"A" = "⋏",
			"b" = "⊨",
			"B" = "⊨",
			"c" = "⩞",
			"C" = "⩞",
			"d" = "⊥",
			"D" = "⊥",
			"e" = "⊏",
			"E" = "⊏",
			"f" = "⩒",
			"F" = "⩒",
			"g" = "⋂",
			"G" = "⋂",
			"h" = "⊂",
			"H" = "⊂",
			"i" = "⪰",
			"I" = "⪰",
			"j" = "⩁",
			"J" = "⩁",
			"k" = "⊩",
			"K" = "⊩",
			"l" = "↽",
			"L" = "↽",
			"m" = "⋿",
			"M" = "⋿",
			"n" = "⫑",
			"N" = "⫑",
			"o" = "",
			"O" = "",
			"p" = "=",
			"P" = "=",
			"q" = "⫰",
			"Q" = "⫰",
			"r" = "⋌",
			"R" = "⋌",
			"s" = "◡",
			"S" = "◡",
			"t" = "",
			"T" = "",
			"u" = "⫝",
			"U" = "⫝",
			"v" = "⪾",
			"V" = "⪾",
			"w" = "⩊",
			"W" = "⩊",
			"x" = "⨰",
			"X" = "⨰",
			"y" = "⫙",
			"Y" = "⫙",
			"z" = "⩚",
			"Z" = "⩚"
		);
	}

