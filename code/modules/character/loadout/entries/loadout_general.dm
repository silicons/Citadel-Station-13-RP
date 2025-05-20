/datum/prototype/character_loadout_entry/cane
	name = "Cane"
	path = /obj/item/cane
	slot = SLOT_ID_HANDS

/datum/prototype/character_loadout_entry/cane/white
	name = "Cane - White"
	path = /obj/item/cane/whitecane

/datum/prototype/character_loadout_entry/cane/whitecollapsible
	name = "Cane - White telescopic"
	path = /obj/item/cane/whitecane/collapsible

/datum/prototype/character_loadout_entry/cane/crutch
	name = "Crutch"
	path = /obj/item/cane/crutch

/datum/prototype/character_loadout_entry/dice
	name = "Dice Pack"
	path = /obj/item/storage/pill_bottle/dice

/datum/prototype/character_loadout_entry/dice/nerd
	name = "Dice Pack - Gaming"
	path = /obj/item/storage/pill_bottle/dice_nerd

/datum/prototype/character_loadout_entry/dice/cup
	name = "Dice Cup and Dice"
	path = /obj/item/storage/dicecup/loaded

/datum/prototype/character_loadout_entry/cards
	name = "Deck of Cards"
	path = /obj/item/deck/cards

/datum/prototype/character_loadout_entry/unus
	name = "Deck of Unus Cards"
	path = /obj/item/deck/unus

/datum/prototype/character_loadout_entry/tarot
	name = "Deck of Tarot Cards"
	path = /obj/item/deck/tarot

/datum/prototype/character_loadout_entry/holder
	name = "Card Holder"
	path = /obj/item/deck/holder

/datum/prototype/character_loadout_entry/cardemon_pack
	name = "Cardemon Booster Pack"
	path = /obj/item/pack/cardemon

/datum/prototype/character_loadout_entry/spaceball_pack
	name = "Spaceball Booster Pack"
	path = /obj/item/pack/spaceball

/datum/prototype/character_loadout_entry/plushie
	name = "Plushie Selection"
	path = /obj/item/toy/plushie

/datum/prototype/character_loadout_entry/plushie/New()
	..()
	var/list/plushies = list()
	for(var/plushie in subtypesof(/obj/item/toy/plushie/) - list(/obj/item/toy/plushie/therapy, /obj/item/toy/plushie/snowflake))
		var/obj/item/toy/plushie/plushie_type = plushie
		var/entry_name = initial(plushie_type.name)
		var/obj/item/toy/plushie/snowflake/snowflake = plushie
		if(ispath(snowflake, /obj/item/toy/plushie/snowflake))
			entry_name = "[entry_name] - ([initial(snowflake.player_name)])"
		plushies[entry_name] = plushie_type
	tweaks += new/datum/loadout_tweak/path(tim_sort(plushies, GLOBAL_PROC_REF(cmp_text_asc)))

/datum/prototype/character_loadout_entry/flask
	name = "Flask"
	path = /obj/item/reagent_containers/food/drinks/flask/barflask

/datum/prototype/character_loadout_entry/flask/New()
	..()
	tweaks += new/datum/loadout_tweak/reagents(lunchables_ethanol_reagents())

/datum/prototype/character_loadout_entry/vacflask
	name = "Flask - Vacuum"
	path = /obj/item/reagent_containers/food/drinks/flask/vacuumflask

/datum/prototype/character_loadout_entry/vacflask/New()
	..()
	tweaks += new/datum/loadout_tweak/reagents(lunchables_drink_reagents())

/datum/prototype/character_loadout_entry/lunchbox
	name = "Lunchbox"
	display_desc = "A little lunchbox."
	cost = 2
	path = /obj/item/storage/toolbox/lunchbox

/datum/prototype/character_loadout_entry/lunchbox/New()
	..()
	var/list/lunchboxes = list()
	for(var/lunchbox_type in typesof(/obj/item/storage/toolbox/lunchbox))
		var/obj/item/storage/toolbox/lunchbox/lunchbox = lunchbox_type
		if(!initial(lunchbox.filled))
			lunchboxes[initial(lunchbox.name)] = lunchbox_type
	tweaks += new/datum/loadout_tweak/path(tim_sort(lunchboxes, GLOBAL_PROC_REF(cmp_text_asc)))
	tweaks += new/datum/loadout_tweak/contents(lunchables_lunches(), lunchables_snacks(), lunchables_drinks())

/datum/prototype/character_loadout_entry/towel
	name = "Towel"
	path = /obj/item/towel

/datum/prototype/character_loadout_entry/cahwhite
	name = "Cards Against The Galaxy - White Deck"
	path = /obj/item/deck/cah
	display_desc = "The ever-popular Cards Against The Galaxy word game. Warning: may include traces of broken fourth wall. This is the white deck."

/datum/prototype/character_loadout_entry/cahblack
	name = "Cards Against The Galaxy - Black Deck"
	path = /obj/item/deck/cah/black
	display_desc = "The ever-popular Cards Against The Galaxy word game. Warning: may include traces of broken fourth wall. This is the black deck."

/datum/prototype/character_loadout_entry/tennis_ball
	name = "Tennis Ball Selection"
	path = /obj/item/toy/tennis

/datum/prototype/character_loadout_entry/tennis_ball/New()
	..()
	var/list/tennis_balls = list()
	for(var/tball in typesof(/obj/item/toy/tennis) - typesof(/obj/item/toy/tennis/rainbow))
		var/obj/item/toy/tennis/ball_type = tball
		tennis_balls[initial(ball_type.name)] = ball_type
	tweaks += new/datum/loadout_tweak/path(tim_sort(tennis_balls, GLOBAL_PROC_REF(cmp_text_asc)))

/datum/prototype/character_loadout_entry/swimsuitcaps
	name = "Swimsuit Capsule Selection"
	path = /obj/item/storage/box/fluff/swimsuit

/datum/prototype/character_loadout_entry/swimsuitcaps/New()
	..()
	var/list/swimsuits = list()
	for(var/swimsuit in typesof(/obj/item/storage/box/fluff/swimsuit))
		var/obj/item/storage/box/fluff/swimsuit/swimsuit_type = swimsuit
		swimsuits[initial(swimsuit_type.name)] = swimsuit_type
	tweaks += new/datum/loadout_tweak/path(tim_sort(swimsuits, GLOBAL_PROC_REF(cmp_text_asc)))

/datum/prototype/character_loadout_entry/customizable_permit
	name = "Customizable Permit"
	display_desc = "A customizable permit you can use for... just about anything! Be sure to customize the name and description. It is meant to represent generic driver's or pilot's licenses, and similar fluff items. It includes an irremovable disclaimer and may be freely confiscated or revoked at the discretion of Security and/or Command if you attempt to abuse it!"
	path = /obj/item/card_fluff

/datum/prototype/character_loadout_entry/leash
	name = "Normal Leash"
	path = /obj/item/leash
	display_desc = "A simple tether that can easily be hooked onto a collar. Usually used to keep pets nearby."
