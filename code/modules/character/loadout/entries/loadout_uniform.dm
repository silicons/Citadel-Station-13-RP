// Uniform slot
/datum/prototype/character_loadout_entry/uniform/
	name = "Blazer - Blue"
	path = /obj/item/clothing/under/blazer
	slot = SLOT_ID_UNIFORM
	category = LOADOUT_CATEGORY_UNIFORMS

/datum/prototype/character_loadout_entry/uniform/blazer_skirt
	name = "Blazer - Skirt "
	path = /obj/item/clothing/under/blazer/skirt

/datum/prototype/character_loadout_entry/uniform/cheongsam
	name = "Cheongsam Selection"
	display_desc = "Various color variations of an old earth dress style. They are pretty close fitting around the waist."

/datum/prototype/character_loadout_entry/uniform/cheongsam/New()
	..()
	var/list/cheongsams = list()
	for(var/cheongsam in typesof(/obj/item/clothing/under/cheongsam))
		var/obj/item/clothing/under/cheongsam/cheongsam_type = cheongsam
		cheongsams[initial(cheongsam_type.name)] = cheongsam_type
	tweaks += new/datum/loadout_tweak/path(tim_sort(cheongsams, GLOBAL_PROC_REF(cmp_text_asc)))

/datum/prototype/character_loadout_entry/uniform/cheongsam_male
	name = "Cheongsam (Male) - Black"
	path = /obj/item/clothing/under/cheong

/datum/prototype/character_loadout_entry/uniform/cheongsam_male/white
	name = "Cheongsam (Male) - White"
	path = /obj/item/clothing/under/cheong/white

/datum/prototype/character_loadout_entry/uniform/cheongsam_male/red
	name = "Cheongsam (Male) - Red"
	path = /obj/item/clothing/under/cheong/red

/datum/prototype/character_loadout_entry/uniform/qipao
	name = "Qipao"
	path = /obj/item/clothing/under/qipao

/datum/prototype/character_loadout_entry/uniform/qipao/white
	name = "Qipao - White"
	path = /obj/item/clothing/under/qipao/white

/datum/prototype/character_loadout_entry/uniform/qipao/red
	name = "Qipao - Red"
	path = /obj/item/clothing/under/qipao/red

/datum/prototype/character_loadout_entry/uniform/qipao/sleeveless
	name = "Qipao - Sleeveless Black"
	path = /obj/item/clothing/under/sleeveless_qipao

/datum/prototype/character_loadout_entry/uniform/croptop
	name = "Croptop Selection"
	display_desc = "Light shirts which shows the midsection of the wearer."

/datum/prototype/character_loadout_entry/uniform/croptop/New()
	..()
	var/list/croptops = list()
	for(var/croptop in typesof(/obj/item/clothing/under/croptop))
		var/obj/item/clothing/under/croptop/croptop_type = croptop
		croptops[initial(croptop_type.name)] = croptop_type
	tweaks += new/datum/loadout_tweak/path(tim_sort(croptops, GLOBAL_PROC_REF(cmp_text_asc)))

/datum/prototype/character_loadout_entry/uniform/kilt
	name = "Kilt"
	path = /obj/item/clothing/under/kilt

/datum/prototype/character_loadout_entry/uniform/cuttop
	name = "Cut Top - Grey"
	path = /obj/item/clothing/under/cuttop

/datum/prototype/character_loadout_entry/uniform/cuttop/red
	name = "Cut Top - Red"
	path = /obj/item/clothing/under/cuttop/red

/datum/prototype/character_loadout_entry/uniform/jumpsuit
	name = "Jumpclothes Selection"
	path = /obj/item/clothing/under/color/grey

/datum/prototype/character_loadout_entry/uniform/jumpsuit/New()
	..()
	var/list/jumpclothes = list()
	for(var/jump in typesof(/obj/item/clothing/under/color))
		var/obj/item/clothing/under/color/jumps = jump
		jumpclothes[initial(jumps.name)] = jumps
	tweaks += new/datum/loadout_tweak/path(tim_sort(jumpclothes, GLOBAL_PROC_REF(cmp_text_asc)))

/datum/prototype/character_loadout_entry/uniform/blueshortskirt
	name = "Short Skirt"
	path = /obj/item/clothing/under/blueshortskirt

/datum/prototype/character_loadout_entry/uniform/skirt
	name = "Skirts Selection"
	path = /obj/item/clothing/under/skirt

/datum/prototype/character_loadout_entry/uniform/skirt/New()
	..()
	var/list/skirts = list()
	for(var/skirt in (typesof(/obj/item/clothing/under/skirt)))
		var/obj/item/clothing/under/skirt/skirt_type = skirt
		skirts[initial(skirt_type.name)] = skirt_type
	tweaks += new/datum/loadout_tweak/path(tim_sort(skirts, GLOBAL_PROC_REF(cmp_text_asc)))

/datum/prototype/character_loadout_entry/uniform/pants
	name = "Pants Selection"
	path = /obj/item/clothing/under/pants/white

/datum/prototype/character_loadout_entry/uniform/pants/New()
	..()
	var/list/pants = list()
	for(var/pant in typesof(/obj/item/clothing/under/pants))
		var/obj/item/clothing/under/pants/pant_type = pant
		pants[initial(pant_type.name)] = pant_type
	tweaks += new/datum/loadout_tweak/path(tim_sort(pants, GLOBAL_PROC_REF(cmp_text_asc)))

/datum/prototype/character_loadout_entry/uniform/shorts
	name = "Shorts Selection"
	path = /obj/item/clothing/under/shorts/jeans

/datum/prototype/character_loadout_entry/uniform/shorts/New()
	..()
	var/list/shorts = list()
	for(var/short in typesof(/obj/item/clothing/under/shorts))
		var/obj/item/clothing/under/pants/short_type = short
		shorts[initial(short_type.name)] = short_type
	tweaks += new/datum/loadout_tweak/path(tim_sort(shorts, GLOBAL_PROC_REF(cmp_text_asc)))

/datum/prototype/character_loadout_entry/uniform/suit/lawyer
	name = "Suit One-Piece Selection"
	path = /obj/item/clothing/under/lawyer

/datum/prototype/character_loadout_entry/uniform/suit/lawyer/New()
	..()
	var/list/lsuits = list()
	for(var/lsuit in typesof(/obj/item/clothing/under/lawyer))
		var/obj/item/clothing/suit/lsuit_type = lsuit
		lsuits[initial(lsuit_type.name)] = lsuit_type
	tweaks += new/datum/loadout_tweak/path(tim_sort(lsuits, GLOBAL_PROC_REF(cmp_text_asc)))

/datum/prototype/character_loadout_entry/uniform/suit/suit_jacket
	name = "Suit Modular Selection"
	path = /obj/item/clothing/under/suit_jacket

/datum/prototype/character_loadout_entry/uniform/suit/suit_jacket/New()
	..()
	var/list/msuits = list()
	for(var/msuit in typesof(/obj/item/clothing/under/suit_jacket))
		var/obj/item/clothing/suit/msuit_type = msuit
		msuits[initial(msuit_type.name)] = msuit_type
	tweaks += new/datum/loadout_tweak/path(tim_sort(msuits, GLOBAL_PROC_REF(cmp_text_asc)))

/datum/prototype/character_loadout_entry/uniform/suit/amish
	name = "Suit - Amish"
	path = /obj/item/clothing/under/sl_suit

/datum/prototype/character_loadout_entry/uniform/suit/gentle
	name = "Suit - Gentlemen"
	path = /obj/item/clothing/under/gentlesuit

/datum/prototype/character_loadout_entry/uniform/suit/gentleskirt
	name = "Suit - Lady"
	path = /obj/item/clothing/under/gentlesuit/skirt

/datum/prototype/character_loadout_entry/uniform/suit/white
	name = "Suit - White"
	path = /obj/item/clothing/under/scratch

/datum/prototype/character_loadout_entry/uniform/suit/whiteskirt
	name = "Suit - White Skirt"
	path = /obj/item/clothing/under/scratch/skirt

/datum/prototype/character_loadout_entry/uniform/scrub
	name = "Scrubs Selection"
	path = /obj/item/clothing/under/rank/medical/scrubs

/datum/prototype/character_loadout_entry/uniform/scrub/New()
	..()
	var/list/scrubs = list()
	for(var/scrub in typesof(/obj/item/clothing/under/rank/medical/scrubs))
		var/obj/item/clothing/under/rank/medical/scrubs/scrub_type = scrub
		scrubs[initial(scrub_type.name)] = scrub_type
	tweaks += new/datum/loadout_tweak/path(tim_sort(scrubs, GLOBAL_PROC_REF(cmp_text_asc)))

/datum/prototype/character_loadout_entry/uniform/scrub_fem
	name = "Scrubs Selection - Female"
	path = /obj/item/clothing/under/rank/medical/scrubs_fem

/datum/prototype/character_loadout_entry/uniform/scrub_fem/New()
	..()
	var/list/scrubs_fem = list()
	for(var/scrub_fem in typesof(/obj/item/clothing/under/rank/medical/scrubs_fem))
		var/obj/item/clothing/under/rank/medical/scrubs_fem/scrub_type = scrub_fem
		scrubs_fem[initial(scrub_type.name)] = scrub_type
	tweaks += new/datum/loadout_tweak/path(tim_sort(scrubs_fem, GLOBAL_PROC_REF(cmp_text_asc)))

/datum/prototype/character_loadout_entry/uniform/oldwoman
	name = "Old Woman Attire"
	path = /obj/item/clothing/under/oldwoman

/datum/prototype/character_loadout_entry/uniform/sundress
	name = "Sundress"
	path = /obj/item/clothing/under/sundress

/datum/prototype/character_loadout_entry/uniform/sundress/white
	name = "Sundress - White"
	path = /obj/item/clothing/under/sundress_white

/datum/prototype/character_loadout_entry/uniform/turtlebaggy_selection
	name = "Baggy Turtleneck Selection"
	path = /obj/item/clothing/under/turtlebaggy

/datum/prototype/character_loadout_entry/uniform/turtlebaggy_selection/New()
	..()
	var/list/turtlebaggy_selection = list()
	for(var/turtlebaggy in typesof(/obj/item/clothing/under/turtlebaggy))
		var/obj/item/clothing/under/turtlebaggy_type = turtlebaggy
		turtlebaggy_selection[initial(turtlebaggy_type.name)] = turtlebaggy_type
	tweaks += new/datum/loadout_tweak/path(tim_sort(turtlebaggy_selection, GLOBAL_PROC_REF(cmp_text_asc)))

/datum/prototype/character_loadout_entry/uniform/pentagramdress
	name = "Pentagram Dress"
	path = /obj/item/clothing/under/pentagramdress

/datum/prototype/character_loadout_entry/uniform/dress_fire
	name = "Flame Dress"
	path = /obj/item/clothing/under/dress/dress_fire

/datum/prototype/character_loadout_entry/uniform/whitedress
	name = "White Wedding Dress"
	path = /obj/item/clothing/under/dress/white

/datum/prototype/character_loadout_entry/uniform/longdress
	name = "Long Dress"
	path = /obj/item/clothing/under/dress/white2

/datum/prototype/character_loadout_entry/uniform/shortplaindress
	name = "Plain Dress"
	path = /obj/item/clothing/under/dress/white3

/datum/prototype/character_loadout_entry/uniform/longwidedress
	name = "Long Wide Dress"
	path = /obj/item/clothing/under/dress/white4

/datum/prototype/character_loadout_entry/uniform/reddress
	name = "Red Dress - Belted"
	path = /obj/item/clothing/under/dress/darkred

/datum/prototype/character_loadout_entry/uniform/wedding
	name = "Wedding Dress Selection"
	path = /obj/item/clothing/under/wedding

/datum/prototype/character_loadout_entry/uniform/wedding/New()
	..()
	var/list/weddings = list()
	for(var/wedding in typesof(/obj/item/clothing/under/wedding))
		var/obj/item/clothing/under/wedding/wedding_type = wedding
		weddings[initial(wedding_type.name)] = wedding_type
	tweaks += new/datum/loadout_tweak/path(tim_sort(weddings, GLOBAL_PROC_REF(cmp_text_asc)))


/datum/prototype/character_loadout_entry/uniform/suit/reallyblack
	name = "Executive Suit"
	path = /obj/item/clothing/under/suit_jacket/really_black

/datum/prototype/character_loadout_entry/uniform/skirts
	name = "Executive Skirt"
	path = /obj/item/clothing/under/suit_jacket/female/skirt

/datum/prototype/character_loadout_entry/uniform/dresses
	name = "Sailor Dress"
	path = /obj/item/clothing/under/dress/sailordress

/datum/prototype/character_loadout_entry/uniform/dresses/eveninggown
	name = "Red Evening Gown"
	path = /obj/item/clothing/under/dress/redeveninggown

/datum/prototype/character_loadout_entry/uniform/dresses/maid
	name = "Maid Uniform Selection"
	path = /obj/item/clothing/under/dress/maid

/datum/prototype/character_loadout_entry/uniform/dresses/maid/New()
	..()
	var/list/maids = list()
	for(var/maid in typesof(/obj/item/clothing/under/dress/maid))
		var/obj/item/clothing/under/dress/maid/maid_type = maid
		maids[initial(maid_type.name)] = maid_type
	tweaks += new/datum/loadout_tweak/path(tim_sort(maids, GLOBAL_PROC_REF(cmp_text_asc)))

/datum/prototype/character_loadout_entry/uniform/utility
	name = "Utility - Black"
	path = /obj/item/clothing/under/utility

/datum/prototype/character_loadout_entry/uniform/utility/blue
	name = "Utility - Blue"
	path = /obj/item/clothing/under/utility/blue

/datum/prototype/character_loadout_entry/uniform/utility/grey
	name = "Utility - Grey"
	path = /obj/item/clothing/under/utility/grey

/datum/prototype/character_loadout_entry/uniform/sweater
	name = "Sweater - Grey"
	path = /obj/item/clothing/under/rank/psych/turtleneck/sweater

/datum/prototype/character_loadout_entry/uniform/brandjumpsuit_selection
	name = "Branded Jumpsuit Selection"
	path = /obj/item/clothing/under/brandjumpsuit/aether

/datum/prototype/character_loadout_entry/uniform/brandjumpsuit_selection/New()
	..()
	var/list/brandjumpsuit_selection = list()
	for(var/brandjumpsuit in typesof(/obj/item/clothing/under/brandjumpsuit))
		var/obj/item/clothing/under/brandjumpsuit_type = brandjumpsuit
		brandjumpsuit_selection[initial(brandjumpsuit_type.name)] = brandjumpsuit_type
	tweaks += new/datum/loadout_tweak/path(tim_sort(brandjumpsuit_selection, GLOBAL_PROC_REF(cmp_text_asc)))

/datum/prototype/character_loadout_entry/uniform/onestar
	name = "One Star Jumpsuit"
	path = /obj/item/clothing/under/onestar

/datum/prototype/character_loadout_entry/uniform/yogapants
	name = "Yoga Pants"
	path = /obj/item/clothing/under/pants/yogapants

/datum/prototype/character_loadout_entry/uniform/black_corset
	name = "Black Corset"
	path = /obj/item/clothing/under/dress/black_corset

/datum/prototype/character_loadout_entry/uniform/flower_dress
	name = "Flower Dress"
	path = /obj/item/clothing/under/dress/flower_dress

/datum/prototype/character_loadout_entry/uniform/red_swept_dress
	name = "Red Swept Dress"
	path = /obj/item/clothing/under/dress/red_swept_dress

/datum/prototype/character_loadout_entry/uniform/bathrobe
	name = "Bathrobe"
	path = /obj/item/clothing/under/bathrobe

/datum/prototype/character_loadout_entry/uniform/flamenco
	name = "Flamenco Dress"
	path = /obj/item/clothing/under/dress/flamenco

/datum/prototype/character_loadout_entry/uniform/westernbustle
	name = "Western Bustle"
	path = /obj/item/clothing/under/dress/westernbustle

/datum/prototype/character_loadout_entry/uniform/circuitry
	name = "Jumpsuit - Circuitry"
	path = /obj/item/clothing/under/circuitry

/datum/prototype/character_loadout_entry/uniform/sysguard
	name = "Uniform - Crew"
	path = /obj/item/clothing/under/oricon/utility/sysguard/crew

/datum/prototype/character_loadout_entry/uniform/marine/green
	name = "Uniform - Green Fatigues"
	path = /obj/item/clothing/under/oricon/utility/marine/green

/datum/prototype/character_loadout_entry/uniform/marine/tan
	name = "Uniform - Tan Fatigues"
	path = /obj/item/clothing/under/oricon/utility/marine/tan

/datum/prototype/character_loadout_entry/uniform/overalls
	name = "Overalls"
	path = /obj/item/clothing/under/overalls

/datum/prototype/character_loadout_entry/uniform/overalls_fem
	name = "Overalls - Female"
	path = /obj/item/clothing/under/overalls_fem

/datum/prototype/character_loadout_entry/uniform/sleekoverall
	name = "Overalls - Sleek"
	path = /obj/item/clothing/under/overalls/sleek

/datum/prototype/character_loadout_entry/uniform/sleekoverall_fem
	name = "Overalls - Sleek - Female"
	path = /obj/item/clothing/under/overalls/sleek_fem

/datum/prototype/character_loadout_entry/uniform/sarired
	name = "Sari - Red"
	path = /obj/item/clothing/under/dress/sari

/datum/prototype/character_loadout_entry/uniform/sarigreen
	name = "Sari - Green"
	path = /obj/item/clothing/under/dress/sari/green

/datum/prototype/character_loadout_entry/uniform/kamishimo
	name = "Kamishimo"
	path = /obj/item/clothing/under/kamishimo

/datum/prototype/character_loadout_entry/uniform/kimono
	name = "Kimono - Plain"
	path = /obj/item/clothing/under/kimono

/datum/prototype/character_loadout_entry/uniform/kimono_black
	name = "Kimono - Black"
	path = /obj/item/clothing/under/kimono_black

/datum/prototype/character_loadout_entry/uniform/kimono_sakura
	name = "Kimono - Sakura"
	path = /obj/item/clothing/under/kimono_sakura

/datum/prototype/character_loadout_entry/uniform/kimono_fancy
	name = "Kimono - Festival"
	path = /obj/item/clothing/under/kimono_fancy

/datum/prototype/character_loadout_entry/uniform/kimono_selection
	name = "Kimono Selection"
	display_desc = "Colorful variants of the basic kimono. Stylish and comfy!"

/datum/prototype/character_loadout_entry/uniform/kimono_selection/New()
	..()
	var/list/kimonos = list()
	for(var/kimono in typesof(/obj/item/clothing/under/kimono))
		var/obj/item/clothing/under/kimono/kimono_type = kimono
		kimonos[initial(kimono_type.name)] = kimono_type
	tweaks += new/datum/loadout_tweak/path(tim_sort(kimonos, GLOBAL_PROC_REF(cmp_text_asc)))

/datum/prototype/character_loadout_entry/uniform/pyjamas_red
	name = "Pyjamas - Red"
	path = /obj/item/clothing/under/redpyjamas

/datum/prototype/character_loadout_entry/uniform/pyjamas_blue
	name = "Pyjamas - Blue"
	path = /obj/item/clothing/under/bluepyjamas

/datum/prototype/character_loadout_entry/uniform/pyjamas_red_fem
	name = "Pyjamas - Red - Female"
	path = /obj/item/clothing/under/redpyjamas_fem

/datum/prototype/character_loadout_entry/uniform/pyjamas_blue_fem
	name = "Pyjamas - Blue - Female"
	path = /obj/item/clothing/under/bluepyjamas_fem

/datum/prototype/character_loadout_entry/uniform/wrappedcoat
	name = "Modern Wrapped Coat"
	path = /obj/item/clothing/under/moderncoat

/datum/prototype/character_loadout_entry/uniform/ascetic
	name = "Plain Ascetic Garb"
	path = /obj/item/clothing/under/ascetic

/datum/prototype/character_loadout_entry/uniform/ascetic_fem
	name = "Plain Ascetic Garb - Female"
	path = /obj/item/clothing/under/ascetic_fem

/datum/prototype/character_loadout_entry/uniform/pleated
	name = "Pleated Skirt"
	path = /obj/item/clothing/under/skirt/pleated

/datum/prototype/character_loadout_entry/uniform/lilacdress
	name = "Lilac Dress"
	path = /obj/item/clothing/under/dress/lilacdress

/datum/prototype/character_loadout_entry/uniform/stripeddress
	name = "Striped Dress"
	path = /obj/item/clothing/under/dress/stripeddress

/datum/prototype/character_loadout_entry/uniform/festivedress
	name = "Festive Dress"
	path = /obj/item/clothing/under/festivedress

/datum/prototype/character_loadout_entry/uniform/haltertop
	name = "Halter Top"
	path = /obj/item/clothing/under/haltertop

/datum/prototype/character_loadout_entry/uniform/littleblackdress
	name = "Little Black Dress"
	path = /obj/item/clothing/under/littleblackdress

/datum/prototype/character_loadout_entry/uniform/dutchsuit
	name = "Western Suit"
	path = /obj/item/clothing/under/dutchuniform

/datum/prototype/character_loadout_entry/uniform/victorianredshirt
	name = "Red Shirted Victorian Suit"
	path = /obj/item/clothing/under/victorianblred

/datum/prototype/character_loadout_entry/uniform/victorianredshirt/female
	name = "Red Shirted Victorian Suit - Female"
	path = /obj/item/clothing/under/fem_victorianblred

/datum/prototype/character_loadout_entry/uniform/victorianredvest
	name = "Red Vested Victorian Suit"
	path = /obj/item/clothing/under/victorianredvest

/datum/prototype/character_loadout_entry/uniform/victorianredvest/female
	name = "Red Vested Victorian Suit - Female"
	path = /obj/item/clothing/under/fem_victorianredvest

/datum/prototype/character_loadout_entry/uniform/victoriansuit
	name = "Victorian Suit"
	path = /obj/item/clothing/under/victorianvest

/datum/prototype/character_loadout_entry/uniform/victoriansuit/female
	name = "Victorian Suit - Female"
	path = /obj/item/clothing/under/fem_victorianvest

/datum/prototype/character_loadout_entry/uniform/victorianbluesuit
	name = "Blue Shirted Victorian Suit"
	path = /obj/item/clothing/under/victorianlightfire

/datum/prototype/character_loadout_entry/uniform/victorianbluesuit/female
	name = "Blue Shirted Victorian Suit - Female"
	path = /obj/item/clothing/under/fem_victorianlightfire

/datum/prototype/character_loadout_entry/uniform/victorianreddress
	name = "Victorian Red Dress"
	path = /obj/item/clothing/under/victorianreddress

/datum/prototype/character_loadout_entry/uniform/victorianblackdress
	name = "Victorian Black Dress"
	path = /obj/item/clothing/under/victorianblackdress

/datum/prototype/character_loadout_entry/uniform/fiendsuit
	name = "Fiendish Suit"
	path = /obj/item/clothing/under/fiendsuit

/datum/prototype/character_loadout_entry/uniform/fienddress
	name = "Fiendish Dress"
	path = /obj/item/clothing/under/fienddress

/datum/prototype/character_loadout_entry/uniform/leotard
	name = "Black Leotard"
	path = /obj/item/clothing/under/leotard

/datum/prototype/character_loadout_entry/uniform/leotardcolor
	name = "Colored Leotard"
	path = /obj/item/clothing/under/leotardcolor

/datum/prototype/character_loadout_entry/uniform/leotardwindow
	name = "Window Leotard"
	path = /obj/item/clothing/under/leotardwindow

/datum/prototype/character_loadout_entry/uniform/bunnysuit_f
	name = "Bunny Leotard - Female"
	path = /obj/item/clothing/under/bunnysuit_f

/datum/prototype/character_loadout_entry/uniform/bunnysuit_m
	name = "Bunny Leotard - Male"
	path = /obj/item/clothing/under/bunnysuit_m

/datum/prototype/character_loadout_entry/uniform/tabard_w
	name = "White Tabard-Dress"
	path = /obj/item/clothing/under/tabard_w

/datum/prototype/character_loadout_entry/uniform/tabard_b
	name = "Black Tabard-Dress"
	path = /obj/item/clothing/under/tabard_b

/datum/prototype/character_loadout_entry/uniform/verglasdress
	name = "Verglas Dress"
	path = /obj/item/clothing/under/verglasdress

/datum/prototype/character_loadout_entry/uniform/fashionminiskirt
	name = "Fashionable Miniskirt"
	path = /obj/item/clothing/under/fashionminiskirt

/datum/prototype/character_loadout_entry/uniform/bodysuit
	name = "Standard Bodysuit"
	path = /obj/item/clothing/under/bodysuit

/datum/prototype/character_loadout_entry/uniform/bodysuit_fem
	name = "Standard Bodysuit - Female"
	path = /obj/item/clothing/under/bodysuit_fem

/datum/prototype/character_loadout_entry/uniform/bodysuiteva
	name = "EVA Bodysuit"
	path = /obj/item/clothing/under/bodysuit/bodysuiteva

/datum/prototype/character_loadout_entry/uniform/bodysuiteva_fem
	name = "EVA Bodysuit - Female"
	path = /obj/item/clothing/under/bodysuit/bodysuiteva_fem

/datum/prototype/character_loadout_entry/uniform/replika_selection
	name = "Replikant Bodysuit Selection"
	display_desc = "Several variants of bodysuit designed for Second Generation Biosynthetics."
	path = /obj/item/clothing/under/replika

/datum/prototype/character_loadout_entry/uniform/replika_selection/New()
	..()
	var/list/replika_selection = list()
	for(var/replika in typesof(/obj/item/clothing/under/replika))
		var/obj/item/clothing/under/replika/replika_type = replika
		replika_selection[initial(replika_type.name)] = replika_type
	tweaks += new/datum/loadout_tweak/path(tim_sort(replika_selection, GLOBAL_PROC_REF(cmp_text_asc)))

/datum/prototype/character_loadout_entry/uniform/gestalt_selection
	name = "Sleek Uniform Selection"
	display_desc = "Multiple variants of single-stripe pattern uniforms. Best worn under their accompanying jacket."
	path = /obj/item/clothing/under/gestalt

/datum/prototype/character_loadout_entry/uniform/gestalt_selection/New()
	..()
	var/list/gestalt_selection = list()
	for(var/gestalt in typesof(/obj/item/clothing/under/gestalt))
		var/obj/item/clothing/under/gestalt/gestalt_type = gestalt
		gestalt_selection[initial(gestalt_type.name)] = gestalt_type
	tweaks += new/datum/loadout_tweak/path(tim_sort(gestalt_selection, GLOBAL_PROC_REF(cmp_text_asc)))

/datum/prototype/character_loadout_entry/uniform/future_fashion_selection
	name = "Futuristic Striped Jumpsuit Selection"
	path = /obj/item/clothing/under/future_fashion

/datum/prototype/character_loadout_entry/uniform/future_fashion_selection/New()
	..()
	var/list/future_fashion_selection = list()
	for(var/future_fashion in typesof(/obj/item/clothing/under/future_fashion))
		var/obj/item/clothing/under/future_fashion/future_fashion_type = future_fashion
		future_fashion_selection[initial(future_fashion_type.name)] = future_fashion_type
	tweaks += new/datum/loadout_tweak/path(tim_sort(future_fashion_selection, GLOBAL_PROC_REF(cmp_text_asc)))

/datum/prototype/character_loadout_entry/uniform/suit/permit
	name = "Nudity Permit"
	path = /obj/item/clothing/under/permit


/*
Swimsuits
*/

/datum/prototype/character_loadout_entry/uniform/swimsuits
	name = "Swimsuit Selection"
	path = /obj/item/clothing/under/swimsuit

/datum/prototype/character_loadout_entry/uniform/swimsuits/New()
	..()
	var/list/swimsuits = list()
	for(var/swimsuit in typesof(/obj/item/clothing/under/swimsuit))
		var/obj/item/clothing/under/swimsuit/swimsuit_type = swimsuit
		swimsuits[initial(swimsuit_type.name)] = swimsuit_type
	tweaks += new/datum/loadout_tweak/path(tim_sort(swimsuits, GLOBAL_PROC_REF(cmp_text_asc)))

/datum/prototype/character_loadout_entry/uniform/suit/gnshorts
	name = "GN Shorts"
	path = /obj/item/clothing/under/fluff/gnshorts

// Latex maid dress
/datum/prototype/character_loadout_entry/uniform/latexmaid
	name = "Latex Maid Dress"
	path = /obj/item/clothing/under/fluff/latexmaid

//Tron Siren outfit
/datum/prototype/character_loadout_entry/uniform/siren
	name = "Jumpsuit - Siren"
	path = /obj/item/clothing/under/fluff/siren

/datum/prototype/character_loadout_entry/uniform/suit/v_nanovest
	name = "Varmacorp Nanovest"
	path = /obj/item/clothing/under/fluff/v_nanovest

/datum/prototype/character_loadout_entry/uniform/greyskirt_female
	name = "Grey Skirt"
	path = /obj/item/clothing/under/greyskirt_female

/datum/prototype/character_loadout_entry/uniform/highwayman_clothes
	name = "Highwayman Outfit"
	path = /obj/item/clothing/under/highwayman_clothes

/datum/prototype/character_loadout_entry/uniform/highwayman_clothes_fem
	name = "Highwayman Outfit - Female"
	path = /obj/item/clothing/under/highwayman_clothes_fem

/datum/prototype/character_loadout_entry/uniform/businessskirt
	name = "Business Skirt"
	path = /obj/item/clothing/under/businessskirt_female

/datum/prototype/character_loadout_entry/uniform/simpledress
	name = "Simple Dress"
	path = /obj/item/clothing/under/simpledress

/datum/prototype/character_loadout_entry/uniform/formalredcoat
	name = "Formal Coat - Red"
	path = /obj/item/clothing/under/redcoatformal

/datum/prototype/character_loadout_entry/uniform/vice
	name = "Vice Officers Jumpsuit"
	path = /obj/item/clothing/under/rank/vice

/datum/prototype/character_loadout_entry/uniform/saare
	name = "SAARE Uniform"
	path = /obj/item/clothing/under/saare

/datum/prototype/character_loadout_entry/uniform/saare_fem
	name = "SAARE Uniform - Female"
	path = /obj/item/clothing/under/saare_fem

/datum/prototype/character_loadout_entry/uniform/hawaiianpink
	name = "Suit - Pink Hawaiian"
	path = /obj/item/clothing/under/hawaiian

/datum/prototype/character_loadout_entry/uniform/geisha
	name = "Geisha Outfit"
	path = /obj/item/clothing/under/geisha

/datum/prototype/character_loadout_entry/uniform/blueshift
	name = "Suit - Light Blue"
	path = /obj/item/clothing/under/blueshift

/datum/prototype/character_loadout_entry/uniform/office_worker
	name = "Suit - Office Worker"
	path = /obj/item/clothing/under/office_worker

/datum/prototype/character_loadout_entry/uniform/tracksuit_blue
	name = "Tracksuit - Blue"
	path = /obj/item/clothing/under/tracksuit_blue

/datum/prototype/character_loadout_entry/uniform/tribal_tunic
	name = "Tunic - Simple"
	path = /obj/item/clothing/under/tribal_tunic

/datum/prototype/character_loadout_entry/uniform/tribal_tunic_fem
	name = "Tunic - Simple - Female"
	path = /obj/item/clothing/under/tribal_tunic_fem

/datum/prototype/character_loadout_entry/uniform/druidic_gown
	name = "Tunic - Flowered"
	path = /obj/item/clothing/under/druidic_gown

/datum/prototype/character_loadout_entry/uniform/druidic_gown_fem
	name = "Tunic - Flowered - Female"
	path = /obj/item/clothing/under/druidic_gown_fem

/datum/prototype/character_loadout_entry/uniform/acolyte_hunter
	name = "Acolytes garbs"
	path = /obj/item/clothing/under/acolyte_hunter

/datum/prototype/character_loadout_entry/uniform/acolyte_hunter_fem
	name = "Acolytes garbs - Female"
	path = /obj/item/clothing/under/acolyte_hunter_fem

/datum/prototype/character_loadout_entry/uniform/shamanblue
	name = "Blue Shaman Garbs"
	path = /obj/item/clothing/under/shamanblue

/datum/prototype/character_loadout_entry/uniform/shamanblue_fem
	name = "Blue Shaman Garbs - Female"
	path = /obj/item/clothing/under/shamanblue_fem

/datum/prototype/character_loadout_entry/uniform/shamanred
	name = "Red Shaman Garbs"
	path = /obj/item/clothing/under/shamanred

/datum/prototype/character_loadout_entry/uniform/shamanred_fem
	name = "Red Shaman Garbs - Female"
	path = /obj/item/clothing/under/shamanred_fem

/datum/prototype/character_loadout_entry/uniform/hunter
	name = "Rugged Loincloth"
	path = /obj/item/clothing/under/hunter

/datum/prototype/character_loadout_entry/uniform/hunter_fem
	name = "Rugged Loincloth - Female"
	path = /obj/item/clothing/under/hunter_fem

/datum/prototype/character_loadout_entry/uniform/gatherer
	name = "Loincloth"
	path = /obj/item/clothing/under/gatherer

/datum/prototype/character_loadout_entry/uniform/gatherer_fem
	name = "Loincloth - Female"
	path = /obj/item/clothing/under/gatherer_fem

/datum/prototype/character_loadout_entry/uniform/laconic
	name = "Laconic Field Suit"
	path = /obj/item/clothing/under/laconic

/datum/prototype/character_loadout_entry/uniform/bountyskin
	name = "Bounty Hunters Skinsuit"
	path = /obj/item/clothing/under/bountyskin

/datum/prototype/character_loadout_entry/uniform/navy_jumpsuit
	name = "Navy Gray Jumpsuit"
	path = /obj/item/clothing/under/navy_gray

/datum/prototype/character_loadout_entry/uniform/gray_smooth
	name = "Gray Smooth Jumpsuit"
	path = /obj/item/clothing/under/smooth_gray

/datum/prototype/character_loadout_entry/uniform/chiming_dress
	name = "Chiming Dress"
	path = /obj/item/clothing/under/chiming_dress

/datum/prototype/character_loadout_entry/uniform/waiter
	name = "Waiters Outfit"
	path = /obj/item/clothing/under/waiter

/datum/prototype/character_loadout_entry/uniform/waiter_fem
	name = "Waiters Outfit - Female"
	path = /obj/item/clothing/under/waiter_fem

/datum/prototype/character_loadout_entry/uniform/assistantformal
	name = "Assistants Formal Uniform"
	path = /obj/item/clothing/under/assistantformal

/datum/prototype/character_loadout_entry/uniform/assistantformal_fem
	name = "Assistants Formal Uniform - Female"
	path = /obj/item/clothing/under/assistantformal_fem

/datum/prototype/character_loadout_entry/uniform/cropdress
	name = "Cropped Dress"
	path = /obj/item/clothing/under/dress/cropdress

/datum/prototype/character_loadout_entry/uniform/twistdress
	name = "Twisted Dress"
	path = /obj/item/clothing/under/dress/twistdress

/datum/prototype/character_loadout_entry/uniform/antediluvian
	name = "Antediluvian Corset"
	path = /obj/item/clothing/under/antediluvian

/datum/prototype/character_loadout_entry/uniform/antediluvian_dress
	name = "Antediluvian Dress"
	path = /obj/item/clothing/under/antediluvian/dress


/datum/prototype/character_loadout_entry/uniform/antediluvian_wraps
	name = "Antediluvian Wraps"
	path = /obj/item/clothing/under/antediluvian/dress/aziru

/datum/prototype/character_loadout_entry/uniform/antediluvian_boobflap
	name = "Antediluvian Chest Flaps"
	path = /obj/item/clothing/under/antediluvian/dress/ante_boobflap

/datum/prototype/character_loadout_entry/accessory/antediluvian_gloves_alt
	name = "Antediluvian Bracers Alternate"
	path = /obj/item/clothing/accessory/antediluvian_gloves/alt

/datum/prototype/character_loadout_entry/accessory/antediluvian_socks
	name = "Antediluvian Legguards"
	path = /obj/item/clothing/accessory/antediluvian_socks

/datum/prototype/character_loadout_entry/accessory/antediluvian_stirrups
	name = "Antediluvian Stirrups"
	path = /obj/item/clothing/accessory/antediluvian_stirrups

/datum/prototype/character_loadout_entry/accessory/antediluvian_sideskirt
	name = "Antediluvian Sideskirt"
	path = /obj/item/clothing/accessory/antediluvian_sideskirt

/datum/prototype/character_loadout_entry/accessory/antediluvian_necklace
	name = "Antediluvian Necklace"
	path = /obj/item/clothing/accessory/antediluvian_necklace

/datum/prototype/character_loadout_entry/accessory/antediluvian_flaps
	name = "Antediluvian Flaps"
	path = /obj/item/clothing/accessory/antediluvian_flaps

/datum/prototype/character_loadout_entry/uniform/hasie
	name = "Hasie Designer Skirt/Vest"
	path = /obj/item/clothing/under/hasie

/datum/prototype/character_loadout_entry/uniform/utility_fur_pants
	name = "Utility Fur Pants"
	path = /obj/item/clothing/under/utility_fur_pants

/datum/prototype/character_loadout_entry/uniform/sitri
	name = "Sitri Striped Sweater"
	path = /obj/item/clothing/under/sitri

/datum/prototype/character_loadout_entry/uniform/halfmoon
	name = "Half Moon Outfit"
	path = /obj/item/clothing/under/half_moon

/datum/prototype/character_loadout_entry/uniform/toga
	name = "Toga"
	path = /obj/item/clothing/under/toga

/datum/prototype/character_loadout_entry/uniform/countess
	name = "Countess Dress"
	path = /obj/item/clothing/under/countess

/datum/prototype/character_loadout_entry/uniform/baroness
	name = "Baroness Dress"
	path = /obj/item/clothing/under/baroness

/datum/prototype/character_loadout_entry/uniform/yoko
	name = "Scavenging Sniper Set"
	path = /obj/item/clothing/under/yoko

/datum/prototype/character_loadout_entry/uniform/kamina
	name = "Spiral Hero Outfit"
	path = /obj/item/clothing/under/kamina

/datum/prototype/character_loadout_entry/uniform/tape
	name = "Body Tape Wrapping"
	path = /obj/item/clothing/under/tape

/datum/prototype/character_loadout_entry/uniform/revealing
	name = "Revealing Cocktail Dress"
	path = /obj/item/clothing/under/revealing

/datum/prototype/character_loadout_entry/uniform/belial
	name = "Belial Striped Shirt and Shorts"
	path = /obj/item/clothing/under/belial

/datum/prototype/character_loadout_entry/uniform/lilin
	name = "Lilin Sash Dress"
	path = /obj/item/clothing/under/lilin

/datum/prototype/character_loadout_entry/uniform/asmodai
	name = "Asmodai Laced Blouse"
	path = /obj/item/clothing/under/asmodai

/datum/prototype/character_loadout_entry/uniform/blackshortsripped
	name = "Ripped Black Shorts"
	path = /obj/item/clothing/under/blackshortsripped

/datum/prototype/character_loadout_entry/uniform/summerdress_selection
	name = "Summer Dress Selection"
	path = /obj/item/clothing/under/dress/summer

/datum/prototype/character_loadout_entry/uniform/summerdress_selection/New()
	..()
	var/list/summerdress_selection = list()
	for(var/summerdress in typesof(/obj/item/clothing/under/dress/summer))
		var/obj/item/clothing/under/summerdress_type = summerdress
		summerdress_selection[initial(summerdress_type.name)] = summerdress_type
	tweaks += new/datum/loadout_tweak/path(tim_sort(summerdress_selection, GLOBAL_PROC_REF(cmp_text_asc)))

/datum/prototype/character_loadout_entry/uniform/skinsuit_selection
	name = "Skinsuit Selection - Male"
	path = /obj/item/clothing/under/skinsuit

/datum/prototype/character_loadout_entry/uniform/skinsuit_selection/New()
	..()
	var/list/skinsuit_selection = list()
	for(var/skinsuit in typesof(/obj/item/clothing/under/skinsuit))
		var/obj/item/clothing/under/skinsuit_type = skinsuit
		skinsuit_selection[initial(skinsuit_type.name)] = skinsuit_type
	tweaks += new/datum/loadout_tweak/path(tim_sort(skinsuit_selection, GLOBAL_PROC_REF(cmp_text_asc)))

/datum/prototype/character_loadout_entry/uniform/skinsuitfem_selection
	name = "Skinsuit Selection - Female"
	path = /obj/item/clothing/under/skinsuit_fem

/datum/prototype/character_loadout_entry/uniform/skinsuitfem_selection/New()
	..()
	var/list/skinsuitfem_selection = list()
	for(var/skinsuitfem in typesof(/obj/item/clothing/under/skinsuit_fem))
		var/obj/item/clothing/under/skinsuitfem_type = skinsuitfem
		skinsuitfem_selection[initial(skinsuitfem_type.name)] = skinsuitfem_type
	tweaks += new/datum/loadout_tweak/path(tim_sort(skinsuitfem_selection, GLOBAL_PROC_REF(cmp_text_asc)))

/datum/prototype/character_loadout_entry/uniform/altbodysuit_selection
	name = "Alternate Bodysuit Selection - Male"
	path = /obj/item/clothing/under/bodysuit/alt

/datum/prototype/character_loadout_entry/uniform/altbodysuit_selection/New()
	..()
	var/list/altbodysuit_selection = list()
	for(var/altbodysuit in typesof(/obj/item/clothing/under/bodysuit/alt))
		var/obj/item/clothing/under/altbodysuit_type = altbodysuit
		altbodysuit_selection[initial(altbodysuit_type.name)] = altbodysuit_type
	tweaks += new/datum/loadout_tweak/path(tim_sort(altbodysuit_selection, GLOBAL_PROC_REF(cmp_text_asc)))

/datum/prototype/character_loadout_entry/uniform/altbodysuitfem_selection
	name = "Alternate Bodysuit Selection - Female"
	path = /obj/item/clothing/under/bodysuit/alt_fem

/datum/prototype/character_loadout_entry/uniform/altbodysuitfem_selection/New()
	..()
	var/list/altbodysuitfem_selection = list()
	for(var/altbodysuitfem in typesof(/obj/item/clothing/under/bodysuit/alt_fem))
		var/obj/item/clothing/under/altbodysuitfem_type = altbodysuitfem
		altbodysuitfem_selection[initial(altbodysuitfem_type.name)] = altbodysuitfem_type
	tweaks += new/datum/loadout_tweak/path(tim_sort(altbodysuitfem_selection, GLOBAL_PROC_REF(cmp_text_asc)))

/datum/prototype/character_loadout_entry/uniform/skinsuit_striped
	name = "Skinsuit Striped"
	path = /obj/item/clothing/under/skinsuit_striped

/datum/prototype/character_loadout_entry/uniform/ballet
	name = "Antheia Tutu"
	path = /obj/item/clothing/under/ballet

/datum/prototype/character_loadout_entry/uniform/tourist
	name = "Tourist Liesurewear"
	path = /obj/item/clothing/under/tourist

//Tajaran wears

/datum/prototype/character_loadout_entry/uniform/tajaran/summercloths_selection
	name = "Adhomian summerwear"
	path = /obj/item/clothing/under/tajaran/summer

/datum/prototype/character_loadout_entry/uniform/tajaran/summercloths_selection/New()
	..()
	var/list/summercloths_selection = list()
	for(var/summercloths in (typesof(/obj/item/clothing/under/tajaran/summer)))
		var/obj/item/clothing/under/summercloths_type = summercloths
		summercloths_selection[initial(summercloths_type.name)] = summercloths_type
	tweaks += new/datum/loadout_tweak/path(tim_sort(summercloths_selection, GLOBAL_PROC_REF(cmp_text_asc)))

/datum/prototype/character_loadout_entry/uniform/tajaran/tajara_dress_selection
	name = "Adhomian dresses selection"
	display_desc = "A selection of tajaran native dresses."
	path = /obj/item/clothing/under/dress/tajaran

/datum/prototype/character_loadout_entry/uniform/tajaran/tajara_dress_selection/New()
	..()
	var/list/tajara_dress_selection = list()
	for(var/tajara_dress in (typesof(/obj/item/clothing/under/dress/tajaran)))
		var/obj/item/clothing/under/dress/tajaran/tajara_dress_type = tajara_dress
		tajara_dress_selection[initial(tajara_dress_type.name)] = tajara_dress_type
	tweaks += new/datum/loadout_tweak/path(tim_sort(tajara_dress_selection, GLOBAL_PROC_REF(cmp_text_asc)))

/datum/prototype/character_loadout_entry/uniform/tajaran/laborer
	name = "Generic Adhomian laborer clothes"
	path = /obj/item/clothing/under/tajaran

/datum/prototype/character_loadout_entry/uniform/tajaran/machinist
	name = "Adhomian machinist uniform"
	path = /obj/item/clothing/under/tajaran/mechanic

/datum/prototype/character_loadout_entry/uniform/tajaran/raakti_shariim
	name = "Raakti shariim uniform"
	path = /obj/item/clothing/under/tajaran/raakti_shariim

/datum/prototype/character_loadout_entry/uniform/tajaran/dpra
	name = "DPRA laborer clothes"
	path = /obj/item/clothing/under/tajaran/dpra

/datum/prototype/character_loadout_entry/uniform/tajaran/dpra/alt
	name = "DPRA laborer clothes, alternate"
	path = /obj/item/clothing/under/tajaran/dpra/alt
