/*
	Hello and welcome to VOREStation sprite_accessories: For a more general overview
	please read sprite_accessories.dm. This file is for ears and tails.
	This is intended to be friendly for people with little to no actual coding experience.
	!!WARNING!!: changing existing accessory information can be VERY hazardous to savefiles,
	to the point where you may completely corrupt a server's savefiles. Please refrain
	from doing this unless you absolutely know what you are doing, and have defined a
	conversion in savefile.dm
*/

// Add Additional variable onto sprite_accessory
/datum/sprite_accessory
	// Ckey of person allowed to use this, if defined.
	var/list/ckeys_allowed = null
	var/apply_restrictions = FALSE		//whether to apply restrictions for specific tails/ears/wings
	var/center = FALSE
	var/dimension_x = 32
	var/dimension_y = 32
	/// category, e.g. "Cat", "Antlers", etc
	//? not currently used but include it anyways!
	var/category = "Misc"

/*
////////////////////////////
/  =--------------------=  /
/  == Ear Definitions  ==  /
/  =--------------------=  /
////////////////////////////
*/

// Ears avaliable to anyone

/datum/sprite_accessory/ears/antennae
	name = "antennae, colorable"
	icon_state = "antennae"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY


/datum/sprite_accessory/ears/bear_brown
	name = "bear, brown"
	icon_state = "bear-brown"

/datum/sprite_accessory/ears/bear_panda
	name = "bear, panda"
	icon_state = "panda"

/datum/sprite_accessory/ears/bearhc
	name = "bear, colorable"
	icon_state = "bear"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/ears/bee
	name = "bee antennae"
	icon_state = "bee"

/datum/sprite_accessory/ears/caprahorns
	name = "caprine horns"
	icon_state = "caprahorns"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/ears/cow
	name = "cow, horns"
	icon_state = "cow"

/datum/sprite_accessory/ears/cowc
	name = "cow, horns, colorable"
	icon_state = "cow-c"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/ears/cow_nohorns
	name = "cow, no horns"
	icon_state = "cow-nohorns"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/ears/curly_bug
	name = "curly antennae, colorable"
	icon_state = "curly_bug"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/ears/deer
	name = "deer ears"
	icon_state = "deer"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/ears/demon_horns1
	name = "demon horns"
	icon_state = "demon-horns1"

/datum/sprite_accessory/ears/demon_horns1_c
	name = "demon horns, colorable"
	icon_state = "demon-horns1_c"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/ears/demon_horns2
	name = "demon horns, colorable(outward)"
	icon_state = "demon-horns2"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/ears/demon_horns3
	name = "demon horns, colorable(upward)"
	icon_state = "demon-horns3"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/ears/demon_horns4
	name = "demon horns, colorable ring(upward)"
	icon_state = "demon-horns4"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "demon-horns4-ring"

/datum/sprite_accessory/ears/demon_horns5
	name = "demon horns, colorable (stubby)"
	icon_state = "demon-horns5"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/ears/donkey
	name = "donkey, colorable"
	icon_state = "donkey"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "otie-inner"

/datum/sprite_accessory/ears/dragon_horns
	name = "dragon horns, colorable"
	icon_state = "dragon-horns"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/ears/drake
	name = "drake frills"
	icon_state = "drake"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/ears/dual_robot
	name = "synth antennae, colorable"
	icon_state = "dual_robot_antennae"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/ears/elfs
	name = "elven ears"
	icon_state = "elfs"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/ears/elfshort
	name = "elven ears (short)"
	icon_state = "elfshort"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/ears/fenears
	name = "flatland zorren ears"
	icon_state = "fenears"

/datum/sprite_accessory/ears/fenearshc
	name = "flatland zorren ears, colorable"
	icon_state = "fenearshc"
	extra_overlay = "fenears-inner"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/ears/floppyelf
	name = "floppy elven ears"
	icon_state = "floppy-elf"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/ears/foxears
	name = "highlander zorren ears"
	icon_state = "foxears"

/datum/sprite_accessory/ears/foxearshc
	name = "highlander zorren ears, colorable"
	icon_state = "foxearshc"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/ears/inkling
	name = "colorable mature inkling tentacles"
	icon = 'icons/mob/human_face_vr.dmi'
	icon_state = "inkling-colorable"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/ears/jackalope
	name = "Jackalope Ears and Antlers"
	icon = 'icons/mob/sprite_accessories/ears_32x64.dmi'
	icon_state = "jackalope"
	extra_overlay = "jackalope-antlers"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/ears/kittyhc
	name = "kitty, colorable"
	icon_state = "kitty"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "kittyinner"

/datum/sprite_accessory/ears/kittyr
	name = "kitty right only, colorable"
	icon = 'icons/mob/sprite_accessories/ears_uneven.dmi'
	icon_state = "kittyrinner"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "kittyr"

/datum/sprite_accessory/ears/large_dragon
	name = "vary large dragon horns"
	icon_state = "big_liz"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/ears/leafeon
	name = "Leaf Ears"
	icon_state = "leaf_ears"

/datum/sprite_accessory/ears/left_robot
	name = "left synth, colorable"
	icon_state = "left_robot_antennae"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/ears/mousehc
	name = "mouse, colorable"
	icon_state = "mouse"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "mouseinner"

/datum/sprite_accessory/ears/mousehcno
	name = "mouse, colorable, no inner"
	icon_state = "mouse"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/ears/mouse_grey
	name = "mouse, grey"
	icon_state = "mouse-grey"

/datum/sprite_accessory/ears/oni_h1
	name = "oni horns"
	icon_state = "oni-h1"

/datum/sprite_accessory/ears/oni_h1_c
	name = "oni horns, colorable"
	icon_state = "oni-h1_c"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/ears/otie
	name = "otie, colorable"
	icon_state = "otie"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "otie-inner"

/datum/sprite_accessory/ears/peekinghuman
	name = "peeking ears"
	icon_state = "earpeek"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/ears/rabbit_swept
	name = "Rabbit Ears (swept back)"
	icon = 'icons/mob/sprite_accessories/ears_32x64.dmi'
	icon_state = "rabbit-swept"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/ears/ram
	name = "ram horns"
	icon_state = "ram"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/ears/right_robot
	name = "right synth, colorable"
	icon_state = "right_robot_antennae"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/ears/sandfox
	name = "Sandfox Ears"
	icon = 'icons/mob/sprite_accessories/ears_32x64.dmi'
	icon_state = "sandfox"
	extra_overlay = "sandfox-inner"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/ears/sergal //Redundant
	name = "Sergal ears"
	icon_state = "serg_plain_s"

/datum/sprite_accessory/ears/sergalhc
	name = "Sergal ears, colorable"
	icon_state = "serg_plain_s"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/ears/sleek
	name = "sleek ears"
	icon_state = "sleek"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/ears/smallantlers
	name = "small antlers"
	icon_state = "smallantlers"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/ears/smallantlers_e
	name = "small antlers with ears"
	icon_state = "smallantlers"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "deer"

/datum/sprite_accessory/ears/smallbear
	name = "small bear"
	icon_state = "smallbear"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/ears/squirrelhc
	name = "squirrel, colorable"
	icon_state = "squirrel"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/ears/squirrel_orange
	name = "squirel, orange"
	icon_state = "squirrel-orange"

/datum/sprite_accessory/ears/squirrel_red
	name = "squirrel, red"
	icon_state = "squirrel-red"

/datum/sprite_accessory/ears/swooped_bunny
	name = "Swooped bunny ears (colorable)"
	icon_state = "swooped_bunny"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/ears/synthhorns_curly
	name = "Synth horns, curly"
	icon_state = "synthhorns_curled"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/ears/synthhorns_plain
	name = "Synth horns, plain"
	icon_state = "synthhorns_plain"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "synthhorns_plain_light"

/datum/sprite_accessory/ears/synthhorns_thick
	name = "Synth horns, thick"
	icon_state = "synthhorns_thick"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "synthhorns_thick_light"

/datum/sprite_accessory/ears/teppiears
	name = "Teppi Ears"
	icon = 'icons/mob/sprite_accessories/ears_32x64.dmi'
	icon_state = "teppi_ears"
	extra_overlay = "teppi_ears_inner"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/ears/teppihorns
	name = "Teppi Horns"
	icon = 'icons/mob/sprite_accessories/ears_32x64.dmi'
	icon_state = "teppi_horns"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/ears/teppiearshorns
	name = "Teppi Ears and Horns"
	icon = 'icons/mob/sprite_accessories/ears_32x64.dmi'
	icon_state = "teppi_ears"
	extra_overlay = "teppi_ears_inner"
	extra_overlay2 = "teppi_horns"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/ears/teshari
	name = "Teshari ears (colorable)"
	icon_state = "teshari"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "teshariinner"

/datum/sprite_accessory/ears/tesharihigh
	name = "Teshari upper ears (colorable)"
	icon_state = "tesharihigh"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "tesharihighinner"

/datum/sprite_accessory/ears/tesharilow
	name = "Teshari lower ears (colorable)"
	icon_state = "tesharilow"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "tesharilowinner"

/datum/sprite_accessory/ears/tesh_pattern_ear_male
	name = "Teshari male ear pattern (colorable)"
	icon_state = "teshari"
	color_blend_mode = ICON_MULTIPLY
	do_colouration = 1
	extra_overlay = "teshari_male_pattern"

/datum/sprite_accessory/ears/tesh_pattern_ear_female
	name = "Teshari female ear pattern (colorable)"
	icon_state = "teshari"
	color_blend_mode = ICON_MULTIPLY
	do_colouration = 1
	extra_overlay = "teshari_female_pattern"

/datum/sprite_accessory/ears/vulp
	name = "vulpkanin, dual-color"
	icon_state = "vulp"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "vulp-inner"

/datum/sprite_accessory/ears/vulp_jackal
	name = "vulpkanin thin, dual-color"
	icon_state = "vulp_jackal"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "vulp_jackal-inner"

/datum/sprite_accessory/ears/vulp_short
	name = "vulpkanin short"
	icon_state = "vulp_terrier"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/ears/vulp_short_dc
	name = "vulpkanin short, dual-color"
	icon_state = "vulp_terrier"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "vulp_terrier-inner"

/datum/sprite_accessory/ears/wisewolf
	name = "wolf, wise"
	icon_state = "wolf-wise"

/datum/sprite_accessory/ears/wolfhc
	name = "wolf, colorable"
	icon_state = "wolf"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "wolfinner"

/datum/sprite_accessory/ears/wolf_green
	name = "wolf, green"
	icon_state = "wolf-green"

/datum/sprite_accessory/ears/wolf_grey
	name = "wolf, grey"
	icon_state = "wolf-grey"

/datum/sprite_accessory/ears/zears
	name = "jagged ears"
	icon_state = "zears"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

//Moths
/datum/sprite_accessory/ears/moth_antenna_fluff_burnt
	name = "burnt moth antennae and fluff"
	icon_state = "moth_antenna_fluff_burnt"

/datum/sprite_accessory/ears/moth_antenna_fluff_deathhead
	name = "death's-head hawkmoth antennae and fluff"
	icon_state = "moth_antenna_fluff_deathhead"

/datum/sprite_accessory/ears/moth_antenna_fluff_firewatch
	name = "firewatch moth antennae and fluff"
	icon_state = "moth_antenna_fluff_firewatch"

/datum/sprite_accessory/ears/moth_antenna_fluff_gothic
	name = "gothic moth antennae and fluff"
	icon_state = "moth_antenna_fluff_goth"

/datum/sprite_accessory/ears/moth_antenna_fluff_jungle
	name = "jungle moth antennae and fluff"
	icon_state = "moth_antenna_fluff_jungle"

/datum/sprite_accessory/ears/moth_antenna_fluff_lovers
	name = "lovers moth antennae and fluff"
	icon_state = "moth_antenna_fluff_lovers"

/datum/sprite_accessory/ears/moth_antenna_fluff_moonfly
	name = "moonfly moth antennae and fluff"
	icon_state = "moth_antenna_fluff_moonfly"

/datum/sprite_accessory/ears/moth_antenna_fluff_oakworm
	name = "oakworm moth antennae and fluff"
	icon_state = "moth_antenna_fluff_oakworm"

/datum/sprite_accessory/ears/moth_antenna_fluff_plain
	name = "plain moth antennae and fluff"
	icon_state = "moth_antenna_fluff_plain"

/datum/sprite_accessory/ears/moth_antenna_fluff_poison
	name = "poison moth antennae and fluff"
	icon_state = "moth_antenna_fluff_poison"

/datum/sprite_accessory/ears/moth_antenna_fluff_ragged
	name = "ragged moth antennae and fluff"
	icon_state = "moth_antenna_fluff_ragged"

/datum/sprite_accessory/ears/moth_antenna_fluff_red
	name = "red moth antennae and fluff"
	icon_state = "moth_antenna_fluff_red"

/datum/sprite_accessory/ears/moth_antenna_fluff_royal
	name = "royal moth antennae and fluff"
	icon_state = "moth_antenna_fluff_royal"

/datum/sprite_accessory/ears/moth_antenna_fluff_snowy
	name = "snowy moth antennae and fluff"
	icon_state = "moth_antenna_fluff_snowy"

/datum/sprite_accessory/ears/moth_antenna_fluff_whitefly
	name = "whitefly moth antennae and fluff"
	icon_state = "moth_antenna_fluff_whitefly"

/datum/sprite_accessory/ears/moth_antenna_fluff_witchwing
	name = "witchwing moth antennae and fluff"
	icon_state = "moth_antenna_fluff_witchwing"

//Mushroom Heads - Ha.
/datum/sprite_accessory/ears/fungal_muscaria
    name = "fungal muscaria cap"
    desc = ""
    icon_state = "fungal_muscaria"

/datum/sprite_accessory/ears/fungal_polypore
    name = "fungal polyporous cap"
    desc = ""
    icon_state = "fungal_polypore"

// Species-unique ears
/datum/sprite_accessory/ears/shadekin
	name = "Shadekin Ears, colorable"
	icon_state = "shadekin"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	apply_restrictions = TRUE
	species_allowed = list(SPECIES_SHADEKIN, SPECIES_SHADEKIN_CREW)

// Special snowflake (Read: Whitelisted) ears go below here.
//None of these seem to be for Citadel users, but I'm retaining them for now.
/datum/sprite_accessory/ears/alurane
	name = "alurane ears/hair (Pumila)"
	icon_state = "alurane-ears"
	ckeys_allowed = list("natje")

/datum/sprite_accessory/ears/aronai
	name = "aronai ears/head (Aronai)"
	icon_state = "aronai"
	ckeys_allowed = list("arokha")

/datum/sprite_accessory/ears/frost
    name = "Frost antenna"
    desc = ""
    icon_state = "frosted_tips"
    ckeys_allowed = list("tucker0666")

/datum/sprite_accessory/ears/holly
	name = "tigress ears (Holly Sharp)"
	icon_state = "tigressears"
	ckeys_allowed = list("hoodoo")

/datum/sprite_accessory/ears/kerena
	name = "wingwolf ears (Kerena)"
	icon_state = "kerena"
	ckeys_allowed = list("somekindofpony")

/datum/sprite_accessory/ears/lilimoth_antennae
	name = "citheronia antennae (Kira72)"
	icon_state = "lilimoth_antennae"
	ckeys_allowed = list("kira72")

/datum/sprite_accessory/ears/miria_fluffdragon
	name = "fluffdragon ears (Miria Masters)"
	icon_state = "miria-fluffdragonears"
	ckeys_allowed = list("miriamasters")

/datum/sprite_accessory/ears/molenar_deathclaw
	name = "deathclaw ears"
	icon_state = "molenar-deathclaw"

/datum/sprite_accessory/ears/miria_kitsune
	name = "kitsune ears (Miria Masters)"
	icon_state = "miria-kitsuneears"
	ckeys_allowed = list("miriamasters")

/datum/sprite_accessory/ears/molenar_inkling
	name = "teal mature inkling hair (Kari Akiren)"
	icon_state = "molenar-tentacle"
	ckeys_allowed = list("molenar")

/datum/sprite_accessory/ears/molenar_kitsune
	name = "quintail kitsune ears (Molenar)"
	icon_state = "molenar-kitsune"
	ckeys_allowed = list("molenar")

/datum/sprite_accessory/ears/rosey
	name = "tritail kitsune ears (Rosey)"
	icon_state = "rosey"
	ckeys_allowed = list("joey4298")

/datum/sprite_accessory/ears/runac
	name = "fennecsune ears (Runac)"
	icon_state = "runac"
	ckeys_allowed = list("rebcom1807")

/datum/sprite_accessory/ears/shock
	name = "pharoah hound ears (Shock Diamond)"
	icon_state = "shock"
	ckeys_allowed = list("icowom","cameron653")

/*
////////////////////////////
/  =--------------------=  /
/  == Wing Definitions ==  /
/  =--------------------=  /
////////////////////////////
*/
/datum/sprite_accessory/wing
	name = "You should not see this..."
	icon = 'icons/mob/sprite_accessories/wings.dmi'
	dimension_x = 64
	do_colouration = 0 //Set to 1 to enable coloration using the tail color.

	color_blend_mode = ICON_ADD // Only appliciable if do_coloration = 1
	var/extra_overlay // Icon state of an additional overlay to blend in.
	var/extra_overlay2
	var/clothing_can_hide = 1 // If true, clothing with HIDETAIL hides it. If the clothing is bulky enough to hide a tail, it should also hide wings.
	// var/show_species_tail = 1 // Just so // TODO - Seems not needed ~Leshana
	var/desc = "You should not see this..."
	var/ani_state // State when flapping/animated
	var/spr_state // State when spreading wings w/o anim
	var/extra_overlay_w // Flapping state for extra overlay
	var/extra_overlay2_w

/datum/sprite_accessory/wing/bat_black
	name = "bat wings, black"
	icon_state = "bat-black"

/datum/sprite_accessory/wing/bat_color
	name = "bat wings, colorable"
	icon_state = "bat-color"
	do_colouration = 1

/datum/sprite_accessory/wing/bat_red
	name = "bat wings, red"
	icon_state = "bat-red"

/datum/sprite_accessory/wing/beewings
	name = "bee wings"
	icon_state = "beewings"

/datum/sprite_accessory/wing/cyberdoe
	name = "Cyber doe wing"
	icon_state = "cyberdoe_s"
	do_colouration = 0

/datum/sprite_accessory/wing/cyberdragon
	name = "Cyber dragon wing (colorable)"
	icon_state = "cyberdragon_s"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/wing/cyberdragon_red
	name = "Cyber dragon wing (red)"
	icon_state = "cyberdragon_red_s"
	do_colouration = 0

/datum/sprite_accessory/wing/drago_wing
	name = "Cybernetic Dragon wings"
	icon_state = "drago_wing"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "drago_wing_2"

/datum/sprite_accessory/wing/dragonfly
	name = "dragonfly"
	icon_state = "dragonfly"
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/wing/feathered
	name = "feathered wings (colorable)"
	icon_state = "feathered"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/wing/feathered_medium
	name = "medium feathered wings (colorable)" // Keekenox made these feathery things with a little bit more shape to them than the other wings. They are medium sized wing boys.
	icon_state = "feathered2"
	spr_state = "feathered2_spr"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/wing/feathered_large //Made by Natje!
	name = "large feathered wings (colorable)"
	icon_state = "feathered3"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/wing/harpywings
	name = "harpy wings (colorable)"
	icon_state = "harpywings"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/wing/Harpywings_alt
	name = "harpy wings alt, archeopteryx"
	icon_state = "Harpywings_alt"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "Neckfur"
	extra_overlay2 = "Harpywings_altmarkings"

/datum/sprite_accessory/wing/harpywings_alt
	name = "harpy wings alt, archeopteryx"
	icon_state = "harpywings_alt"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "harpywings_altmarkings"

/datum/sprite_accessory/wing/harpywings_alt_neckfur
	name = "harpy wings alt, archeopteryx & neckfur"
	icon_state = "harpywings_alt"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "harpywings_altmarkings"
	extra_overlay2 = "neckfur"

/datum/sprite_accessory/wing/Harpywings_Bat
	name = "harpy wings, bat"
	icon_state = "Harpywings_Bat"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "Neckfur"
	extra_overlay2 = "Harpywings_BatMarkings"

/datum/sprite_accessory/wing/harpywings_bat
	name = "harpy wings, bat"
	icon_state = "harpywings_bat"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "harpywings_batmarkings"

/datum/sprite_accessory/wing/harpywings_bat_neckfur
	name = "harpy wings, bat & neckfur"
	icon_state = "harpywings_bat"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "harpywings_batmarkings"
	extra_overlay2 = "neckfur"

/datum/sprite_accessory/wing/leafeon
	name = "Leaf Offshoots"
	icon_state = "leaf_markings"

/datum/sprite_accessory/wing/liquidfirefly_gazer //I g-guess this could be considered wings?
	name = "gazer eyestalks"
	icon_state = "liquidfirefly-eyestalks"
	//ckeys_allowed = list("liquidfirefly","seiga") //At request.

/datum/sprite_accessory/wing/mantis_arms //Same rationale as spider legs.
	name = "mantis arms"
	icon_state = "mantis-arms"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/wing/mantis_arms_saturated
	name = "mantis arms (saturated)"
	icon_state = "mantis-arms_saturated"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/wing/neckfur
	name = "neck fur"
	icon_state = "neckfur"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/wing/nevrean
	name = "nevrean wings/fantail"
	icon_state = "nevrean_s"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/wing/robo
	name = "Robotic Wings"
	icon_state = "Drago_wing"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/wing/sepulchre_c_yw
	name = "demon wings (colorable)"
	icon_state = "sepulchre_wingsc"
	do_colouration = 1

/datum/sprite_accessory/wing/snag
	name = "xenomorph backplate"
	icon_state = "snag-backplate"

/datum/sprite_accessory/wing/spider_legs //Not really /WINGS/ but they protrude from the back, kinda. Might as well have them here.
	name = "spider legs"
	icon_state = "spider-legs"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/wing/succubus
	name = "succubus wings, black"
	icon_state = "succubus-black"

/datum/sprite_accessory/wing/succubus_purple
	name = "succubus wings, purple"
	icon_state = "succubus-purple"

/datum/sprite_accessory/wing/succubus_red
	name = "succubus wings, red"
	icon_state = "succubus-red"

//Moth Wings (We have a lot!)
/datum/sprite_accessory/wing/moth
	name = "moth wings"
	icon_state = "moth"
	clothing_can_hide = FALSE

/datum/sprite_accessory/wing/mothc
	name = "moth wings (colorable)"
	icon_state = "moth"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/wing/moth_atlas
	name = "atlas moth wings"
	icon_state = "moth_atlas"

/datum/sprite_accessory/wing/moth_burnt
	name = "burnt moth wings"
	icon_state = "moth_burnt"

/datum/sprite_accessory/wing/moth_deathhead
	name = "death's-head hawkmoth wings"
	icon_state = "moth_deathhead"

/datum/sprite_accessory/wing/moth_firewatch
	name = "firewatch moth wings"
	icon_state = "moth_firewatch"
	front_behind_system = TRUE

/datum/sprite_accessory/wing/moth_full
	name = "moth antenna and wings"
	icon_state = "moth_full"

/datum/sprite_accessory/wing/moth_gothic
	name = "gothic moth wings"
	icon_state = "moth_gothic"

/datum/sprite_accessory/wing/moth_jungle
	name = "jungle moth wings"
	icon_state = "moth_jungle"

/datum/sprite_accessory/wing/moth_lover
	name = "lover moth wings"
	icon_state = "moth_lover"

/datum/sprite_accessory/wing/moth_luna
	name = "luna moth wings"
	icon_state = "moth_luna"

/datum/sprite_accessory/wing/moth_monarch
	name = "monarch moth wings"
	icon_state = "moth_monarch"

/datum/sprite_accessory/wing/moth_moonfly
	name = "moonfly moth wings"
	icon_state = "moth_moonfly"

/datum/sprite_accessory/wing/moth_oakworm
	name = "oakworm moth wings"
	icon_state = "moth_oakworm"

/datum/sprite_accessory/wing/moth_plain
	name = "plain moth wings"
	icon_state = "moth_plain"

/datum/sprite_accessory/wing/moth_poison
	name = "poison moth wings"
	icon_state = "moth_poison"

/datum/sprite_accessory/wing/moth_ragged
	name = "ragged moth wings"
	icon_state = "moth_ragged"

/datum/sprite_accessory/wing/moth_red
	name = "red moth wings"
	icon_state = "moth_red"

/datum/sprite_accessory/wing/moth_royal
	name = "royal moth wings"
	icon_state = "moth_royal"

/datum/sprite_accessory/wing/moth_snowy
	name = "snowy moth wings"
	icon_state = "moth_snowy"

/datum/sprite_accessory/wing/moth_white
	name = "white moth wings"
	icon_state = "moth_white"

/datum/sprite_accessory/wing/moth_whitefly
	name = "whitefly moth wings"
	icon_state = "moth_whitefly"

/datum/sprite_accessory/wing/moth_witchwing
	name = "witchwing moth wings"
	icon_state = "moth_witchwing"

/*
////////////////////////////
/  =--------------------=  /
/  == Tail Definitions ==  /
/  =--------------------=  /
////////////////////////////
*/
/datum/sprite_accessory/tail
	name = "You should not see this..."
	icon = 'icons/mob/sprite_accessories/tails.dmi'
	do_colouration = 0 //Set to 1 to enable coloration using the tail color.

	color_blend_mode = ICON_ADD // Only appliciable if do_coloration = 1
	var/extra_overlay // Icon state of an additional overlay to blend in.
	var/extra_overlay2 //Tertiary.
	var/show_species_tail = 0 // If false, do not render species' tail.
	var/clothing_can_hide = 1 // If true, clothing with HIDETAIL hides it
	var/desc = "You should not see this..."
	var/ani_state // State when wagging/animated
	var/extra_overlay_w // Wagging state for extra overlay
	var/extra_overlay2_w // Tertiary wagging.
	var/list/hide_body_parts = list() //Uses organ tag defines. Bodyparts in this list do not have their icons rendered, allowing for more spriter freedom when doing taur/digitigrade stuff.
	var/icon/clip_mask_icon = null //Icon file used for clip mask.
	var/clip_mask_state = null //Icon state to generate clip mask. Clip mask is used to 'clip' off the lower part of clothing such as jumpsuits & full suits.
	var/icon/clip_mask = null //Instantiated clip mask of given icon and state

/datum/sprite_accessory/tail/New()
	. = ..()
	if(clip_mask_icon && clip_mask_state)
		clip_mask = icon(icon = clip_mask_icon, icon_state = clip_mask_state)

// Everyone tails
/datum/sprite_accessory/tail/bear
	name = "bear, colorable"
	icon_state = "bear"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/tail/bear_brown
	name = "bear, brown"
	icon_state = "bear-brown"

/datum/sprite_accessory/tail/beaver
	name = "beaver tail, colorable"
	icon_state = "beaver"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/tail/beethorax
	name = "bee thorax"
	icon_state = "beethorax"

/datum/sprite_accessory/tail/blackwolf
	name = "wolf, black"
	icon_state = "wolf"

//Buggo Abdomens!
/datum/sprite_accessory/tail/buggo
	name = "Bug abdomen, colorable"
	icon_state = "buggo_s"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/tail/buggowag
	name = "Bug abdomen, colorable, vwag change"
	icon_state = "buggo_s"
	ani_state = "buggofat_s"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/tail/buggo_bee
	name = "Bug abdomen, bee top, dual-colorable"
	icon_state = "buggo_s"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "buggobee_markings"

/datum/sprite_accessory/tail/buggo_beefull
	name = "Bug abdomen, bee full, dual-colorable"
	icon_state = "buggo_s"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "buggobeefull_markings"

/datum/sprite_accessory/tail/buggo_beefullwag
	name = "Bug abdomen, bee full, dual color, vwag"
	icon_state = "buggo_s"
	ani_state = "buggofat_s"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "buggobeefull_markings"
	extra_overlay_w = "buggofatbeefull_markings"

/datum/sprite_accessory/tail/buggo_beewag
	name = "Bug abdomen, bee top, dual color, vwag"
	icon_state = "buggo_s"
	ani_state = "buggofat_s"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "buggobee_markings"
	extra_overlay_w = "buggofatbee_markings"

/datum/sprite_accessory/tail/buggo_firefly
	name = "Bug abdomen, firefly, dual-colorable"
	icon_state = "buggo_s"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "buggofirefly_markings"

/datum/sprite_accessory/tail/buggo_fireflywag
	name = "Bug abdomen, firefly, dual color, vwag"
	icon_state = "buggo_s"
	ani_state = "buggofat_s"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "buggofirefly_markings"
	extra_overlay_w = "buggofatfirefly_markings"

/datum/sprite_accessory/tail/buggo_under
	name = "Bug abdomen, underside, dual-colorable"
	icon_state = "buggo_s"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "buggounder_markings"

/datum/sprite_accessory/tail/buggo_underwag
	name = "Bug abdomen, underside, dual color, vwag"
	icon_state = "buggo_s"
	ani_state = "buggofat_s"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "buggounder_markings"
	extra_overlay_w = "buggofatunder_markings"

/datum/sprite_accessory/tail/buggofat
	name = "Fat bug abdomen, colorable"
	icon_state = "buggofat_s"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/tail/buggofat_bee
	name = "Fat bug abdomen, bee top, dual-colorable"
	icon_state = "buggofat_s"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "buggofatbee_markings"

/datum/sprite_accessory/tail/buggofat_beefull
	name = "Fat bug abdomen, bee full, dual-colorable"
	icon_state = "buggofat_s"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "buggofatbeefull_markings"

/datum/sprite_accessory/tail/buggofat_firefly
	name = "Fat bug abdomen, firefly, dual-colorable"
	icon_state = "buggofat_s"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "buggofatfirefly_markings"

/datum/sprite_accessory/tail/buggofat_under
	name = "Fat bug abdomen, underside, dual-colorable"
	icon_state = "buggofat_s"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "buggofatunder_markings"

//Vass buggo variants!
/datum/sprite_accessory/tail/buggovass
	name = "Bug abdomen, vass, colorable"
	icon_state = "buggo_vass_s"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/tail/buggovass_wag
	name = "Bug abdomen, vass, colorable, vwag change"
	icon_state = "buggo_vass_s"
	ani_state = "buggofat_vass_s"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/tail/buggovass_bee
	name = "Bug abdomen, bee top, dc, vass"
	icon_state = "buggo_vass_s"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "buggobee_vass_markings"

/datum/sprite_accessory/tail/buggovass_beewag
	name = "Bug abdomen, bee top, dc, vass, vwag"
	icon_state = "buggo_vass_s"
	ani_state = "buggofat_vass_s"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "buggobee_vass_markings"
	extra_overlay_w = "buggofatbee_vass_markings"

/datum/sprite_accessory/tail/buggovass_beefull
	name = "Bug abdomen, bee full, dc, vass"
	icon_state = "buggo_vass_s"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "buggobeefull_vass_markings"

/datum/sprite_accessory/tail/buggovass_beefullwag
	name = "Bug abdomen, bee full, dc, vass, vwag"
	icon_state = "buggo_vass_s"
	ani_state = "buggofat_vass_s"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "buggobeefull_vass_markings"
	extra_overlay_w = "buggofatbeefull_vass_markings"

/datum/sprite_accessory/tail/buggovass_firefly
	name = "Bug abdomen, firefly, dc, vass"
	icon_state = "buggo_vass_s"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "buggofirefly_vass_markings"

/datum/sprite_accessory/tail/buggovass_fireflywag
	name = "Bug abdomen, firefly, dc, vass, vwag"
	icon_state = "buggo_vass_s"
	ani_state = "buggofat_vass_s"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "buggofirefly_vass_markings"
	extra_overlay_w = "buggofatfirefly_vass_markings"

/datum/sprite_accessory/tail/buggovass_under
	name = "Bug abdomen, underside, dc, vass"
	icon_state = "buggo_vass_s"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "buggounder_vass_markings"

/datum/sprite_accessory/tail/buggovass_underwag
	name = "Bug abdomen, underside, dc, vass, vwag"
	icon_state = "buggo_vass_s"
	ani_state = "buggofat_vass_s"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "buggounder_vass_markings"
	extra_overlay_w = "buggofatunder_vass_markings"

/datum/sprite_accessory/tail/buggovassfat
	name = "Fat bug abdomen, vass, colorable"
	icon_state = "buggofat_vass_s"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/tail/buggovassfat_bee
	name = "Fat bug abdomen, bee top, dc, vass"
	icon_state = "buggofat_vass_s"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "buggofatbee_vass_markings"

/datum/sprite_accessory/tail/buggovassfat_beefull
	name = "Fat bug abdomen, bee full, dc, vass"
	icon_state = "buggofat_vass_s"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "buggofatbeefull_vass_markings"

/datum/sprite_accessory/tail/buggovassfat_firefly
	name = "Fat bug abdomen, firefly, dc, vass"
	icon_state = "buggofat_vass_s"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "buggofatfirefly_vass_markings"

/datum/sprite_accessory/tail/buggovassfat_under
	name = "Fat bug abdomen, underside, dc, vass"
	icon_state = "buggofat_vass_s"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "buggofatunder_vass_markings"

/datum/sprite_accessory/tail/bunny
	name = "bunny, colorable"
	icon_state = "bunny"
	do_colouration = 1

/datum/sprite_accessory/tail/cat_big
	name = "kitty (big), colorable"
	icon_state = "catbig"
	ani_state = "catbig_wag"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	front_behind_system = TRUE

/datum/sprite_accessory/tail/chameleon
	name = "Chameleon, colorable"
	icon_state = "chameleon"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/tail/cow
	name = "cow tail, colorable"
	icon_state = "cow"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/tail/crossfox
	name = "cross fox"
	icon_state = "crossfox"

/datum/sprite_accessory/tail/curltail
	name = "curltail (vwag)"
	icon_state = "curltail"
	ani_state = "curltail_w"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "curltail_mark"
	extra_overlay_w = "curltail_mark_w"

/datum/sprite_accessory/tail/deertail
	name = "deer tail, dual-color"
	icon_state = "deertail"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "deertail_mark"

/datum/sprite_accessory/tail/doublekitsune
	name = "double kitsune tail, colorable"
	icon_state = "doublekitsune"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/tail/dragon
	name = "dragon, colorable"
	icon_state = "dragon"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/tail/Easterntail
	name = "Eastern Dragon (Animated)"
	icon_state = "Easterntail"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "EasterntailColorTip"
	ani_state = "Easterntail_w"
	extra_overlay_w = "EasterntailColorTip_w"

/datum/sprite_accessory/tail/eboop
	name = "EGN mech tail (dual color)"
	icon_state = "eboop"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "eboop_mark"

/datum/sprite_accessory/tail/fantail
	name = "avian fantail, colorable"
	icon_state = "fantail"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/tail/fennec_tail
	name = "Fennec tail"
	icon_state = "fennec_tail_s"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/tail/fox_tail
	name = "Fox tail"
	icon_state = "fox_tail_s"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/tail/fox_tail_plain
	name = "Fox tail"
	icon_state = "fox_tail_plain_s"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/tail/foxtail
	name = "Fox"
	desc = ""	//leaving this just in case i break something if i just don't include a blank description because this codebase is akin to a house of cards
	icon_state = "foxtail_but_good"
	extra_overlay = "foxtail_but_good-tips"
	do_colouration = TRUE
	color_blend_mode = ICON_MULTIPLY
	ani_state = "foxtail_but_good_w"
	extra_overlay_w = "foxtail_but_good-tips_w"

/datum/sprite_accessory/tail/horse
	name = "horse tail, colorable"
	icon_state = "horse"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/tail/invisible
	name = "hide species-sprite tail"
	icon = null
	icon_state = null

/datum/sprite_accessory/tail/jackal_bicolor
	name = "jackal, dual-colorable"
	icon_state = "jackal_bicolor"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "jackal_bicolor_extra"

/datum/sprite_accessory/tail/ketrai_wag
	name = "fennix tail (vwag)"
	icon_state = "ketraitail"
	ani_state = "ketraitail_w"
	//ckeys_allowed = list("ketrai") //They requested it to be enabled for everyone.

/datum/sprite_accessory/tail/kitty
	name = "kitty, colorable, downwards"
	icon_state = "kittydown"
	ani_state = "kittydown_wag"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/tail/kitty_tg
	name = "kitty, colorable, main"
	icon_state = "kittytg"
	ani_state = "kittytg_wag"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/tail/kittyup
	name = "kitty, colorable, upwards"
	icon_state = "kittyup"
	ani_state = "kittyup_wag"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/tail/leafeon
	name = "Leaf Tail"
	icon_state = "leaf_tail"

/datum/sprite_accessory/tail/liontail
	name = "Lion Tail (vwag)"
	icon_state = "liontail"
	ani_state = "liontail_w"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "liontail_markings"
	extra_overlay_w = "liontail_markings_w"

/datum/sprite_accessory/tail/lizard_tail_dark_tiger
	name = "Lizard Tail (Dark Tiger)"
	icon_state = "lizard_tail_dark_tiger"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/tail/lizard_tail_light_tiger
	name = "Lizard Tail (Light Tiger)"
	icon_state = "lizard_tail_light_tiger"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/tail/lizard_tail_smooth
	name = "Lizard Tail (Smooth)"
	icon_state = "lizard_tail_smooth"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/tail/lizard_tail_spiked
	name = "Lizard Tail (Spiked)"
	icon_state = "lizard_tail_spiked"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/tail/mouse
	name = "mouse, colorable"
	icon_state = "mouse"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/tail/mouse_pink
	name = "mouse, pink"
	icon_state = "mouse-pink"

/datum/sprite_accessory/tail/nevreandc
	name = "nevrean tail, dual-color"
	icon_state = "nevreantail_dc"
	extra_overlay = "nevreantail_dc_tail"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/tail/nevreanwagdc
	name = "nevrean wagtail, dual-color"
	icon_state = "wagtail"
	extra_overlay = "wagtail_dc_tail"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/tail/nevreanwagdc_alt
	name = "nevrean wagtail, marked, dual-color"
	icon_state = "wagtail2_dc"
	extra_overlay = "wagtail2_dc_mark"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/tail/newtailmaw
	name = "new tailmaw (vwag)"
	icon_state = "newtailmaw"
	ani_state = "newtailmaw_w"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/tail/otietail
	name = "otie tail (vwag)"
	icon_state = "otie"
	ani_state = "otie_w"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/tail/Plugtail
	name = "Synthetic plug tail"
	icon_state = "Plugtail"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "PlugtailMarking"
	extra_overlay2 = "PlugtailMarking2"

/datum/sprite_accessory/tail/redpanda
	name = "red panda"
	icon_state = "redpanda"

/datum/sprite_accessory/tail/ringtail
	name = "ringtail, colorable"
	icon_state = "ringtail"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "ringtail_mark"

/datum/sprite_accessory/tail/robo_tail
	name = "Robo Dragon Tail"
	icon_state = "robo_dragon"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "robodragon_b"

/datum/sprite_accessory/tail/satyr
	name = "goat legs, colorable"
	icon_state = "satyr"
	color_blend_mode = ICON_MULTIPLY
	do_colouration = 1
	hide_body_parts = list(BP_L_LEG, BP_L_FOOT, BP_R_LEG, BP_R_FOOT) //Exclude pelvis just in case.
	clip_mask_icon = 'icons/mob/sprite_accessories/taurs.dmi'
	clip_mask_state = "taur_clip_mask_def" //Used to clip off the lower part of suits & uniforms.

/datum/sprite_accessory/tail/Segmentedlights
	name = "Segmented tail, animated synth"
	icon_state = "Segmentedtail"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "Segmentedlights"
	ani_state = "Segmentedtail_w"
	extra_overlay_w = "Segmentedlights_w"

/datum/sprite_accessory/tail/Segmentedtail
	name = "Segmented tail, animated"
	icon_state = "Segmentedtail"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "Segmentedtailmarking"
	ani_state = "Segmentedtail_w"
	extra_overlay_w = "Segmentedtailmarking_w"

/datum/sprite_accessory/tail/sergaltaildc
	name = "sergal, dual-color"
	icon_state = "sergal"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "sergal_mark"

/datum/sprite_accessory/tail/shorttail
	name = "shorttail (vwag)"
	icon_state = "straighttail"
	ani_state = "straighttail_w"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/tail/skunktail
	name = "skunk, dual-color"
	icon_state = "skunktail"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "skunktail_mark"

/datum/sprite_accessory/tail/snag
	name = "xenomorph tail 1"
	icon_state = "snag"

/datum/sprite_accessory/tail/snaketail
	name = "snake tail, colorable"
	icon_state = "snaketail"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/tail/sneptail
	name = "Snep/Furry Tail (vwag)"
	icon_state = "sneptail"
	ani_state = "sneptail_w"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "sneptail_mark"
	extra_overlay_w = "sneptail_mark_w"

/datum/sprite_accessory/tail/spade_color
	name = "spade-tail (colorable)"
	icon_state = "spadetail-black"
	do_colouration = 1

/datum/sprite_accessory/tail/squirrel
	name = "squirrel, colorable"
	icon_state = "squirrel"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/tail/squirrel_orange
	name = "squirel, orange"
	icon_state = "squirrel-orange"

/datum/sprite_accessory/tail/squirrel_red
	name = "squirrel, red"
	icon_state = "squirrel-red"

/datum/sprite_accessory/tail/stripey
	name = "stripey taj, colorable"
	icon_state = "stripeytail"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "stripeytail_mark"

/datum/sprite_accessory/tail/stripeytail_brown
	name = "stripey taj, brown"
	icon_state = "stripeytail-brown"

/datum/sprite_accessory/tail/synthtail_static
	name = "Synthetic lizard tail"
	icon_state = "synthtail"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/tail/synthtail_vwag
	name = "Synthetic lizard tail (vwag)"
	icon_state = "synthtail"
	ani_state = "synthtail_w"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/tail/tail_smooth
	name = "Smooth Lizard Tail, Colorable"
	icon_state = "tail_smooth"
	ani_state = "tail_smooth_w"
	do_colouration = 1

/datum/sprite_accessory/tail/tailmaw
	name = "tailmaw, colorable"
	icon_state = "tailmaw"
	color_blend_mode = ICON_MULTIPLY
	do_colouration = 1

/datum/sprite_accessory/tail/takahiro_kitsune
	name = "Takahiro Kitsune Tails" //takahiro had five tails i just wanted to follow the 'T' naming convention vs. tamamo and triple
	icon_state = "takahiro-kitsunetails"
	extra_overlay = "takahiro-kitsunetails-tips"
	do_colouration = TRUE
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/tail/tamamo_kitsune
	name = "Tamamo Kitsune Tails" //Tamamo-no-Tiro, let it be known!
	icon_state = "tamamo-kitsunetails"
	extra_overlay = "tamamo-kitsunetails-tips"
	do_colouration = TRUE
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/tail/tentacles
	name = "Tentacles"
	icon_state = "tentacles"
	do_colouration = TRUE
	color_blend_mode = ICON_MULTIPLY
	ani_state = "tentacles_wag"

/datum/sprite_accessory/tail/tesh_pattern_fem
	name = "Teshari female tail pattern"
	icon_state = "teshtail_s"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "teshpattern_fem_tail"

/datum/sprite_accessory/tail/tesh_pattern_fem_alt
	name = "Teshari male tail alt. pattern"
	icon_state = "teshtail_s"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "teshpattern_fem_alt"

/datum/sprite_accessory/tail/tesh_pattern_male
	name = "Teshari male tail pattern"
	icon_state = "teshtail_s"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "teshpattern_male_tail"

/datum/sprite_accessory/tail/tesh_pattern_male_alt
	name = "Teshari male tail alt. pattern"
	icon_state = "teshtail_s"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "teshpattern_male_alt"

/datum/sprite_accessory/tail/teshari_fluffytail
	name = "Teshari tail"
	icon_state = "teshari_fluffytail"
	extra_overlay = "teshari_fluffytail_mark"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/tail/tiger_new
	name = "tiger tail (vwag)"
	icon_state = "tigertail"
	ani_state = "tigertail_w"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "tigertail_mark"
	extra_overlay_w = "tigertail_mark_w"

/datum/sprite_accessory/tail/tiger_white
	name = "tiger, colorable"
	icon_state = "tiger"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "tigerinnerwhite"

/datum/sprite_accessory/tail/triple_kitsune
	name = "Triple Kitsune Tails"
	icon_state = "triple-kitsunetails"
	extra_overlay = "triple-kitsunetails-tips"
	do_colouration = TRUE
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/tail/vulp_new
	name = "new vulp tail (vwag)"
	icon_state = "vulptail"
	ani_state = "vulptail_w"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "vulptail_mark"
	extra_overlay_w = "vulptail_mark_w"

/datum/sprite_accessory/tail/vulpan_alt
	name = "vulpkanin alt style, colorable"
	icon_state = "vulptail_alt"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/tail/wagtail
	name = "avian wagtail, colorable"
	icon_state = "wagtail"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/tail/wartacosushi_tail //brightened +20RGB from matching roboparts
	name = "Ward-Takahashi Tail"
	icon_state = "wardtakahashi_vulp"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/tail/wartacosushi_tail_dc
	name = "Ward-Takahashi Tail, dual-color"
	icon_state = "wardtakahashi_vulp_dc"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "wardtakahashi_vulp_dc_mark"

/datum/sprite_accessory/tail/wolf_grey
	name = "wolf, grey"
	icon_state = "wolf-grey"

/datum/sprite_accessory/tail/wolf_green
	name = "wolf, green"
	icon_state = "wolf-green"

/datum/sprite_accessory/tail/wisewolf
	name = "wolf, wise"
	icon_state = "wolf-wise"

/datum/sprite_accessory/tail/wolf
	name = "wolf, colorable"
	icon_state = "wolf"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "wolfinner"

/datum/sprite_accessory/tail/xenotail
	name = "xenomorph tail 2"
	icon_state = "xenotail"

/datum/sprite_accessory/tail/xenotail_fullcolour
	name = "xenomorph tail (fully colourable)"
	icon_state = "xenotail_fullcolour"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/tail/xenotailalt_fullcolour
	name = "xenomorph tail alt. (fully colourable)"
	icon_state = "xenotailalt_fullcolour"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/tail/zenghu_taj
	name = "Zeng-Hu Tajaran Synth tail"
	icon_state = "zenghu_taj"

/datum/sprite_accessory/tail/ztail
	name = "jagged flufftail"
	icon_state = "ztail"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

//For all species tails. Includes haircolored tails.
/datum/sprite_accessory/tail/special
	name = "Blank tail. Do not select."
	icon = 'icons/effects/species_tails_vr.dmi'



/datum/sprite_accessory/tail/special/akula
	name = "akula tail"
	icon_state = "sharktail_s"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/tail/special/armalis
	name = "armalis tail"
	icon_state = "armalis_tail_humanoid_s"

/datum/sprite_accessory/tail/special/armalishc
	name = "armalis tail, colorable"
	icon_state = "armalis_tail_humanoid_hc_s"
	do_colouration = 1

/datum/sprite_accessory/tail/special/monkeyhc
	name = "monkey tail, colorable"
	icon_state = "chimptail_hc_s"
	do_colouration = 1

/datum/sprite_accessory/tail/special/nevrean
	name = "nevrean tail"
	icon_state = "nevreantail_s"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/tail/special/akulahc
	name = "akula tail, colorable"
	icon_state = "sharktail_hc_s"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/tail/special/fennechc
	name = "flatland zorren tail, colorable"
	icon_state = "fentail_hc_s"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/tail/special/foxhc
	name = "highlander zorren tail, colorable"
	icon_state = "foxtail_hc_s"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/tail/special/monkey
	name = "monkey tail"
	icon_state = "chimptail_s"

/datum/sprite_accessory/tail/special/nevreanhc
	name = "nevrean tail, colorable"
	icon_state = "nevreantail_hc_s"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/tail/special/sergal
	name = "sergal tail"
	icon_state = "sergtail_s"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/tail/special/sergalhc
	name = "sergal tail, colorable"
	icon_state = "sergtail_hc_s"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/tail/special/tajaran
	name = "tajaran tail"
	icon_state = "tajtail_s"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/tail/special/tajaranhc
	name = "tajaran tail, colorable"
	icon_state = "tajtail_hc_s"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/tail/special/tajaran_damaged
	name = "tajaran tail, damaged/short"
	icon_state = "tajtail_damaged_s"
	species_allowed = list(SPECIES_TAJ)
	color_blend_mode = ICON_ADD

/datum/sprite_accessory/tail/special/tajaran_stubby
	name = "tajaran tail, stubby"
	icon_state = "tajtail_stubby_s"
	species_allowed = list(SPECIES_TAJ)
	color_blend_mode = ICON_ADD


/datum/sprite_accessory/tail/special/teshtailfeathered
	name = "Teshari tail alt"
	icon_state = "teshtail_s"
	extra_overlay = "teshtail_feathers_s"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/tail/special/tesharitail_noplume
	name = "teshari tail, no plumage"
	icon_state = "teshtail_noplume_s"
	species_allowed = list(SPECIES_TESHARI)
	color_blend_mode = ICON_ADD

/datum/sprite_accessory/tail/special/tesharitail_noplume_feathered
	name = "teshari tail, no plumage w/feathers"
	icon_state = "teshtail_noplume_s"
	extra_overlay = "teshtail_noplume_feathers_s"
	species_allowed = list(SPECIES_TESHARI)
	color_blend_mode = ICON_ADD

/datum/sprite_accessory/tail/special/tesharitail_damaged
	name = "teshari tail, damaged"
	icon_state = "teshtail_damaged_s"
	species_allowed = list(SPECIES_TESHARI)
	color_blend_mode = ICON_ADD

/datum/sprite_accessory/tail/special/tesharitail_damaged_feathered
	name = "teshari tail, damaged w/feathers"
	icon_state = "teshtail_damaged_s"
	extra_overlay = "teshtail_damaged_feathers_s"
	species_allowed = list(SPECIES_TESHARI)
	color_blend_mode = ICON_ADD

/datum/sprite_accessory/tail/special/tesharitail_damaged_unbranded
	name = "teshari tail, damaged w/ unbranded prosthetic"
	icon_state = "teshtail_damaged_s"
	extra_overlay = "teshtail_damaged_prosthetic_unbranded_s"
	species_allowed = list(SPECIES_TESHARI)
	color_blend_mode = ICON_ADD

/datum/sprite_accessory/tail/special/tesharitail_damaged_unbranded_feathered
	name = "teshari tail, damaged w/feathers + unbranded prosthetic"
	icon_state = "teshtail_damaged_s"
	extra_overlay = "teshtail_damaged_feathers_s"
	extra_overlay2 = "teshtail_damaged_prosthetic_unbranded_s"
	species_allowed = list(SPECIES_TESHARI)
	color_blend_mode = ICON_ADD

/datum/sprite_accessory/tail/special/tesharitail_damaged_cenilimi
	name = "teshari tail, damaged w/ Cenilimi Cybernetics prosthetic"
	icon_state = "teshtail_damaged_s"
	extra_overlay = "teshtail_damaged_prosthetic_cenilimi_s"
	species_allowed = list(SPECIES_TESHARI)
	color_blend_mode = ICON_ADD

/datum/sprite_accessory/tail/special/tesharitail_damaged_cenilimi_feathered
	name = "teshari tail, damaged w/feathers + Cenilimi Cybernetics prosthetic"
	icon_state = "teshtail_damaged_s"
	extra_overlay = "teshtail_damaged_feathers_s"
	extra_overlay2 = "teshtail_damaged_prosthetic_cenilimi_s"
	species_allowed = list(SPECIES_TESHARI)
	color_blend_mode = ICON_ADD

/datum/sprite_accessory/tail/special/tesharitail_damaged_wood
	name = "teshari tail, damaged w/ wooden prosthetic"
	icon_state = "teshtail_damaged_s"
	extra_overlay = "teshtail_damaged_prosthetic_wood_s"
	species_allowed = list(SPECIES_TESHARI)
	color_blend_mode = ICON_ADD

/datum/sprite_accessory/tail/special/tesharitail_damaged_wood_feathered
	name = "teshari tail, damaged w/feathers + wooden prosthetic"
	icon_state = "teshtail_damaged_s"
	extra_overlay = "teshtail_damaged_feathers_s"
	extra_overlay2 = "teshtail_damaged_prosthetic_wood_s"
	species_allowed = list(SPECIES_TESHARI)
	color_blend_mode = ICON_ADD

/datum/sprite_accessory/tail/special/tesharitail_damaged_sifwood
	name = "teshari tail, damaged w/ Sivian wooden prosthetic"
	icon_state = "teshtail_damaged_s"
	extra_overlay = "teshtail_damaged_prosthetic_wood_sif_s"
	species_allowed = list(SPECIES_TESHARI)
	color_blend_mode = ICON_ADD

/datum/sprite_accessory/tail/special/tesharitail_damaged_sifwood_feathered
	name = "teshari tail, damaged w/feathers + Sivian wooden prosthetic"
	icon_state = "teshtail_damaged_s"
	extra_overlay = "teshtail_damaged_feathers_s"
	extra_overlay2 = "teshtail_damaged_prosthetic_wood_sif_s"
	species_allowed = list(SPECIES_TESHARI)
	color_blend_mode = ICON_ADD

/datum/sprite_accessory/tail/special/tesharitail_stubby
	name = "teshari tail, stubby"
	icon_state = "teshtail_stubby_s"
	species_allowed = list(SPECIES_TESHARI)
	color_blend_mode = ICON_ADD

/datum/sprite_accessory/tail/special/tesharitail_stubby_feathered
	name = "teshari tail, stubby w/feathers"
	icon_state = "teshtail_stubby_s"
	extra_overlay = "teshtail_stubby_feathers_s"
	species_allowed = list(SPECIES_TESHARI)
	color_blend_mode = ICON_ADD

/datum/sprite_accessory/tail/special/tesharitail_stubby_unbranded
	name = "teshari tail, stubby w/ unbranded prosthetic"
	icon_state = "teshtail_stubby_s"
	extra_overlay = "teshtail_stubby_prosthetic_unbranded_s"
	species_allowed = list(SPECIES_TESHARI)
	color_blend_mode = ICON_ADD

/datum/sprite_accessory/tail/special/tesharitail_stubby_unbranded_feathered
	name = "teshari tail, stubby w/ feathers + unbranded prosthetic"
	icon_state = "teshtail_stubby_s"
	extra_overlay = "teshtail_stubby_feathers_s"
	extra_overlay2 = "teshtail_stubby_prosthetic_unbranded_s"
	species_allowed = list(SPECIES_TESHARI)
	color_blend_mode = ICON_ADD

/datum/sprite_accessory/tail/special/tesharitail_stubby_cenilimi
	name = "teshari tail, stubby w/ Cenilimi Cybernetics prosthetic"
	icon_state = "teshtail_stubby_s"
	extra_overlay = "teshtail_stubby_prosthetic_cenilimi_s"
	species_allowed = list(SPECIES_TESHARI)
	color_blend_mode = ICON_ADD

/datum/sprite_accessory/tail/special/tesharitail_stubby_cenilimi_feathered
	name = "teshari tail, stubby w/ feathers + Cenilimi Cybernetics prosthetic"
	icon_state = "teshtail_stubby_s"
	extra_overlay = "teshtail_stubby_feathers_s"
	extra_overlay2 = "teshtail_stubby_prosthetic_cenilimi_s"
	species_allowed = list(SPECIES_TESHARI)
	color_blend_mode = ICON_ADD

/datum/sprite_accessory/tail/special/tesharitail_stubby_wood
	name = "teshari tail, stubby w/ wooden prosthetic"
	icon_state = "teshtail_stubby_s"
	extra_overlay = "teshtail_stubby_prosthetic_wood_s"
	species_allowed = list(SPECIES_TESHARI)
	color_blend_mode = ICON_ADD

/datum/sprite_accessory/tail/special/tesharitail_stubby_wood_feathered
	name = "teshari tail, stubby w/feathers + wooden prosthetic"
	icon_state = "teshtail_stubby_s"
	extra_overlay = "teshtail_stubby_feathers_s"
	extra_overlay2 = "teshtail_stubby_prosthetic_wood_s"
	species_allowed = list(SPECIES_TESHARI)
	color_blend_mode = ICON_ADD

/datum/sprite_accessory/tail/special/tesharitail_stubby_sifwood
	name = "teshari tail, stubby w/ Sivian wooden prosthetic"
	icon_state = "teshtail_stubby_s"
	extra_overlay = "teshtail_stubby_prosthetic_wood_sif_s"
	species_allowed = list(SPECIES_TESHARI)
	color_blend_mode = ICON_ADD

/datum/sprite_accessory/tail/special/tesharitail_stubby_sifwood_feathered
	name = "teshari tail, stubby w/feathers + Sivian wooden prosthetic"
	icon_state = "teshtail_stubby_s"
	extra_overlay = "teshtail_stubby_feathers_s"
	extra_overlay2 = "teshtail_stubby_prosthetic_wood_sif_s"
	species_allowed = list(SPECIES_TESHARI)
	color_blend_mode = ICON_ADD

/datum/sprite_accessory/tail/special/tesharitail_prosthetic_unbranded
	name = "teshari tail, unbranded prosthetic"
	icon_state = "teshtail_prosthetic_unbranded_s"
	species_allowed = list(SPECIES_TESHARI)
	do_colouration = FALSE

/datum/sprite_accessory/tail/special/tesharitail_prosthetic_cenilimi
	name = "teshari tail, Cenilimi Cybernetics prosthetic"
	icon_state = "teshtail_prosthetic_cenilimi_s"
	species_allowed = list(SPECIES_TESHARI)
	do_colouration = FALSE

/datum/sprite_accessory/tail/special/unathi
	name = "unathi tail"
	icon_state = "sogtail_s"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/tail/special/unathihc
	name = "unathi tail, colorable"
	icon_state = "sogtail_hc_s"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/tail/special/unathi_damaged
	name = "unathi tail, damaged"
	icon_state = "unathitail_damaged_s"
	species_allowed = list(SPECIES_UNATHI)
	color_blend_mode = ICON_ADD

/datum/sprite_accessory/tail/special/unathi_stubby
	name = "unathi tail, stubby"
	icon_state = "unathitail_stubby_s"
	species_allowed = list(SPECIES_UNATHI)
	color_blend_mode = ICON_ADD



/datum/sprite_accessory/tail/special/vulpan
	name = "vulpkanin, colorable"
	icon_state = "vulptail_s"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/tail/special/xenodrone
	name = "xenomorph drone tail"
	icon_state = "xenos_drone_tail_s"

/datum/sprite_accessory/tail/special/xenodronehc
	name = "xenomorph drone tail, colorable"
	icon_state = "xenos_drone_tail_hc_s"
	do_colouration = 1

/datum/sprite_accessory/tail/special/xenohunter
	name = "xenomorph hunter tail"
	icon_state = "xenos_hunter_tail_s"

/datum/sprite_accessory/tail/special/xenohunterhc
	name = "xenomorph hunter tail, colorable"
	icon_state = "xenos_hunter_tail_hc_s"
	do_colouration = 1

/datum/sprite_accessory/tail/special/xenoqueen
	name = "xenomorph queen tail"
	icon_state = "xenos_queen_tail_s"

/datum/sprite_accessory/tail/special/xenoqueenhc
	name = "xenomorph queen tail, colorable"
	icon_state = "xenos_queen_tail_hc_s"
	do_colouration = 1

/datum/sprite_accessory/tail/special/xenosentinel
	name = "xenomorph sentinel tail"
	icon_state = "xenos_sentinel_tail_s"

/datum/sprite_accessory/tail/special/xenosentinelhc
	name = "xenomorph sentinel tail, colorable"
	icon_state = "xenos_sentinel_tail_hc_s"
	do_colouration = 1



// Species-unique tails
/datum/sprite_accessory/tail/shadekin_short
	name = "Shadekin Short Tail, colorable"
	icon_state = "shadekin-short"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	apply_restrictions = TRUE
	species_allowed = list(SPECIES_SHADEKIN)

//Snowflake/donator Tails.
/datum/sprite_accessory/tail/aronai
	name = "aronai tail (Aronai)"
	icon_state = "aronai"
	ckeys_allowed = list("arokha")

/datum/sprite_accessory/tail/cabletail
    name = "cabletail"
    desc = "cabletail"
    icon_state = "cabletail"
    ckeys_allowed = list("tucker0666")

/datum/sprite_accessory/tail/featherfluff_tail
    name = "featherfluff_tail"
    desc = ""
    icon_state = "featherfluff_tail"
    ckeys_allowed = list("tucker0666")

/datum/sprite_accessory/tail/holly
	name = "tigress tail (Holly)"
	icon_state = "tigresstail"
	ckeys_allowed = list("hoodoo")

/datum/sprite_accessory/tail/miria_fluffdragon
	name = "fluffdragon tail (Miria Masters)"
	icon_state = "miria-fluffdragontail"
	ckeys_allowed = list("miriamasters")

/datum/sprite_accessory/tail/miria_kitsune
	name = "Black kitsune tails (Miria Masters)"
	icon_state = "miria-kitsunetail"
	ckeys_allowed = list("miriamasters")

/datum/sprite_accessory/tail/molenar_deathclaw
	name = "deathclaw bits (Molenar)"
	icon_state = "molenar-deathclaw"
	ckeys_allowed = list("molenar","silvertalismen","jertheace")

/datum/sprite_accessory/tail/molenar_kitsune
	name = "quintail kitsune tails (Molenar)"
	icon_state = "molenar-kitsune"
	ckeys_allowed = list("molenar")

/datum/sprite_accessory/tail/reika //Leaving this since it was too hard to split the wings from the tail.
	name = "fox tail (+ beewings) (Reika)"
	icon_state = "reika"
	ckeys_allowed = list("rikaru19xjenkins")

/datum/sprite_accessory/tail/rosey
	name = "tritail kitsune tails (Rosey)"
	icon_state = "rosey_three"
	ckeys_allowed = list("joey4298")

/datum/sprite_accessory/tail/rosey2
	name = "pentatail kitsune tails (Rosey)" //I predict seven tails next. ~CK
	icon_state = "rosey_five"
	ckeys_allowed = list("joey4298")

/datum/sprite_accessory/tail/runac
	name = "fennecsune tails (Runac)"
	icon_state = "runac"
	ckeys_allowed = list("rebcom1807")

/datum/sprite_accessory/tail/scree
	name = "green taj tail (Scree)"
	icon_state = "scree"
	ckeys_allowed = list("scree")
