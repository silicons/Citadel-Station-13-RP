// Gloves
/datum/prototype/character_loadout_entry/gloves
	name = "Gloves - Black"
	path = /obj/item/clothing/gloves/black
	slot = SLOT_ID_GLOVES
	category = LOADOUT_CATEGORY_GLOVES

/datum/prototype/character_loadout_entry/gloves/blue
	name = "Gloves - Blue"
	path = /obj/item/clothing/gloves/blue

/datum/prototype/character_loadout_entry/gloves/brown
	name = "Gloves - Brown"
	path = /obj/item/clothing/gloves/brown

/datum/prototype/character_loadout_entry/gloves/light_brown
	name = "Gloves - Light-Brown"
	path = /obj/item/clothing/gloves/light_brown

/datum/prototype/character_loadout_entry/gloves/green
	name = "Gloves - Green"
	path = /obj/item/clothing/gloves/green

/datum/prototype/character_loadout_entry/gloves/grey
	name = "Gloves - Grey"
	path = /obj/item/clothing/gloves/grey

/datum/prototype/character_loadout_entry/gloves/latex
	name = "Gloves - Latex"
	path = /obj/item/clothing/gloves/sterile/latex

/datum/prototype/character_loadout_entry/gloves/nitrile
	name = "Gloves - Nitrile"
	path = /obj/item/clothing/gloves/sterile/nitrile

/datum/prototype/character_loadout_entry/gloves/orange
	name = "Gloves - Orange"
	path = /obj/item/clothing/gloves/orange

/datum/prototype/character_loadout_entry/gloves/purple
	name = "Gloves - Purple"
	path = /obj/item/clothing/gloves/purple

/datum/prototype/character_loadout_entry/gloves/rainbow
	name = "Gloves - Rainbow"
	path = /obj/item/clothing/gloves/rainbow

/datum/prototype/character_loadout_entry/gloves/red
	name = "Gloves - Red"
	path = /obj/item/clothing/gloves/red

/datum/prototype/character_loadout_entry/gloves/white
	name = "Gloves - White"
	path = /obj/item/clothing/gloves/white

/datum/prototype/character_loadout_entry/gloves/evening
	name = "Evening Gloves"
	path = /obj/item/clothing/gloves/evening

/datum/prototype/character_loadout_entry/gloves/duty
	name = "Gloves - Work"
	path = /obj/item/clothing/gloves/duty
	cost = 3

/datum/prototype/character_loadout_entry/gloves/forensic
	name = "Detective Gloves - Forensic"
	path = /obj/item/clothing/gloves/forensic
	allowed_roles = list("Detective")

/datum/prototype/character_loadout_entry/gloves/fingerless
	name = "Gloves - Fingerless"
	path = /obj/item/clothing/gloves/fingerless

/datum/prototype/character_loadout_entry/gloves/ring
	name = "Ring Selection"
	display_desc = "Choose from a number of rings."
	path = /obj/item/clothing/gloves/ring
	cost = 1

/datum/prototype/character_loadout_entry/gloves/ring/New()
	..()
	var/ringtype = list()
	ringtype["CTI Ring"] = /obj/item/clothing/gloves/ring/cti
	ringtype["Mariner University Ring"] = /obj/item/clothing/gloves/ring/mariner
	ringtype["Engagement Ring"] = /obj/item/clothing/gloves/ring/engagement
	ringtype["Signet Ring"] = /obj/item/clothing/gloves/ring/seal/signet
	ringtype["Masonic Ring"] = /obj/item/clothing/gloves/ring/seal/mason
	ringtype["Ring - Steel"] = /obj/item/clothing/gloves/ring/material/steel
	ringtype["Ring - Iron"] = /obj/item/clothing/gloves/ring/material/iron
	ringtype["Ring - Silver"] = /obj/item/clothing/gloves/ring/material/silver
	ringtype["Ring - Gold"] = /obj/item/clothing/gloves/ring/material/gold
	ringtype["Ring - Platinum"] = /obj/item/clothing/gloves/ring/material/platinum
	ringtype["Ring - Glass"] = /obj/item/clothing/gloves/ring/material/glass
	ringtype["Ring - Wood"] = /obj/item/clothing/gloves/ring/material/wood
	ringtype["Ring - Plastic"] = /obj/item/clothing/gloves/ring/material/plastic
	ringtype["Ring - Uranium"] = /obj/item/clothing/gloves/ring/material/uranium
	ringtype["Ring - Osmium"] = /obj/item/clothing/gloves/ring/material/osmium
	ringtype["Ring - Mhydrogen"] = /obj/item/clothing/gloves/ring/material/mhydrogen
	ringtype["Ring - Custom"] = /obj/item/clothing/gloves/ring/custom
	tweaks += new/datum/loadout_tweak/path(ringtype)


/datum/prototype/character_loadout_entry/gloves/circuitry
	name = "Gloves - Circuitry"
	path = /obj/item/clothing/gloves/circuitry

/datum/prototype/character_loadout_entry/gloves/goldring
	name = "Wedding Ring - Gold"
	path = /obj/item/clothing/gloves/ring/wedding

/datum/prototype/character_loadout_entry/gloves/silverring
	name = "Wedding Ring - Silver"
	path = /obj/item/clothing/gloves/ring/wedding/silver

/datum/prototype/character_loadout_entry/gloves/colored
	name = "Gloves - Colorable"
	path = /obj/item/clothing/gloves/color


/datum/prototype/character_loadout_entry/gloves/latex/colorable
	name = "Gloves - Latex - Colorable"
	path = /obj/item/clothing/gloves/sterile/latex

/datum/prototype/character_loadout_entry/gloves/siren
	name = "Gloves - Siren"
	path = /obj/item/clothing/gloves/fluff/siren

/datum/prototype/character_loadout_entry/gloves/bountyskin
	name = "Bounty Hunters Gloves"
	path = /obj/item/clothing/gloves/bountyskin

/datum/prototype/character_loadout_entry/gloves/hasie
	name = "Hasie Fingerless Gloves"
	path = /obj/item/clothing/gloves/hasie

/datum/prototype/character_loadout_entry/gloves/utility_fur_gloves
	name = "Utility Fur Gloves"
	path = /obj/item/clothing/gloves/utility_fur_gloves

/datum/prototype/character_loadout_entry/gloves/armsock_alt
	name = "Fingerless Sleeves (Simple)"
	path = /obj/item/clothing/gloves/armsocks

/datum/prototype/character_loadout_entry/gloves/ante_gloves
	name = "Antediluvian Gloves"
	path = /obj/item/clothing/gloves/ante_gloves
