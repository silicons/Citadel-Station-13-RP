
/obj/item/radio/headset/syndicate
	origin_tech = list(TECH_ILLEGAL = 3)
	ks1type = /obj/item/encryptionkey/syndicate

/obj/item/radio/headset/syndicate/alt
	icon_state = "syndie_headset"
	item_state = "headset"
	ks1type = /obj/item/encryptionkey/syndicate

/obj/item/radio/headset/raider
	icon_state = "pirate_headset"
	adhoc_fallback = TRUE
	ks2type = /obj/item/encryptionkey/raider

/obj/item/radio/headset/raider/Initialize(mapload)
	. = ..()
	set_frequency(FREQ_RAIDER)

/obj/item/radio/headset/trader
	name = "trade headset"
	adhoc_fallback = TRUE
	ks1type = /obj/item/encryptionkey/trader

/obj/item/radio/headset/trader/Initialize(mapload)
	. = ..()
	set_frequency(FREQ_TRADER)

/obj/item/radio/headset/binary
	ks1type = /obj/item/encryptionkey/binary

/obj/item/radio/headset/trader/outsider
	name = "Traveler headset"
	desc = "While being a normal headset, it was upgraded with a shortwave frenquency... Altho the upgrade was done with just duck taping circuits of a shortwave radio to the headset"
	adhoc_fallback = TRUE

/obj/item/radio/headset/headset_sec
	name = "security radio headset"
	desc = "This is used by your elite security force."
	icon_state = "sec_headset"
	ks2type = /obj/item/encryptionkey/headset_sec

/obj/item/radio/headset/headset_sec/alt
	name = "security bowman headset"
	desc = "This is used by your elite security force."
	icon_state = "sec_headset_alt"
	ear_protection = 2
	ks2type = /obj/item/encryptionkey/headset_sec

/obj/item/radio/headset/headset_eng
	name = "engineering radio headset"
	desc = "When the engineers wish to chat like girls."
	icon_state = "eng_headset"
	ks2type = /obj/item/encryptionkey/headset_eng

/obj/item/radio/headset/headset_eng/alt
	name = "engineering bowman headset"
	desc = "When the engineers wish to chat like girls."
	icon_state = "eng_headset_alt"
	ks2type = /obj/item/encryptionkey/headset_eng

/obj/item/radio/headset/headset_rob
	name = "robotics radio headset"
	desc = "Made specifically for the roboticists who cannot decide between departments."
	icon_state = "rob_headset"
	ks2type = /obj/item/encryptionkey/headset_rob

/obj/item/radio/headset/headset_med
	name = "medical radio headset"
	desc = "A headset for the trained staff of the medbay."
	icon_state = "med_headset"
	ks2type = /obj/item/encryptionkey/headset_med

/obj/item/radio/headset/headset_med/alt
	name = "medical bowman headset"
	desc = "A headset for the trained staff of the medbay."
	icon_state = "med_headset_alt"
	ks2type = /obj/item/encryptionkey/headset_med

/obj/item/radio/headset/headset_sci
	name = "science radio headset"
	desc = "A sciency headset. Like usual."
	icon_state = "com_headset"
	ks2type = /obj/item/encryptionkey/headset_sci

/obj/item/radio/headset/headset_medsci
	name = "medical research radio headset"
	desc = "A headset that is a result of the mating between medical and science."
	icon_state = "med_headset"
	ks2type = /obj/item/encryptionkey/headset_medsci

/obj/item/radio/headset/headset_com
	name = "command radio headset"
	desc = "A headset with a commanding channel."
	icon_state = "com_headset"
	ks2type = /obj/item/encryptionkey/headset_com

/obj/item/radio/headset/headset_adj //Citadel Add: Secretary headset with service and command.
	name = "secretary radio headset"
	desc = "A headset for those who serve command."
	icon_state = "com_headset"
	ks2type = /obj/item/encryptionkey/headset_adj

/obj/item/radio/headset/headset_com/alt
	name = "command bowman headset"
	desc = "A headset with a commanding channel."
	icon_state = "com_headset_alt"
	ear_protection = 2
	ks2type = /obj/item/encryptionkey/headset_com


/obj/item/radio/headset/heads/captain
	name = "Facility Director's headset"
	desc = "The headset of the boss."
	icon_state = "com_headset"
	ks2type = /obj/item/encryptionkey/heads/captain

/obj/item/radio/headset/heads/captain/alt
	name = "Facility Director's bowman headset"
	desc = "The headset of the boss."
	icon_state = "com_headset_alt"
	ear_protection = 2
	ks2type = /obj/item/encryptionkey/heads/captain

/obj/item/radio/headset/heads/captain/sfr
	name = "SFR headset"
	desc = "A headset belonging to a Sif Free Radio DJ. SFR, best tunes in the wilderness."
	icon_state = "com_headset_alt"
	ks2type = /obj/item/encryptionkey/heads/captain

/obj/item/radio/headset/heads/ai_integrated //No need to care about icons, it should be hidden inside the AI anyway.
	name = "\improper AI subspace transceiver"
	desc = "Integrated AI radio transceiver."
	icon = 'icons/obj/robot_component.dmi'
	icon_state = "radio"
	item_state = "headset"
	ks2type = /obj/item/encryptionkey/heads/ai_integrated
	var/myAi = null    // Atlantis: Reference back to the AI which has this radio.
	var/disabledAi = 0 // Atlantis: Used to manually disable AI's integrated radio via intellicard menu.

/obj/item/radio/headset/heads/ai_integrated/receive_range(freq, level)
	if (disabledAi)
		return -1 //Transciever Disabled.
	return ..(freq, level, 1)

/obj/item/radio/headset/heads/rd
	name = "research director's headset"
	desc = "Headset of the researching God."
	icon_state = "com_headset"
	ks2type = /obj/item/encryptionkey/heads/rd

/obj/item/radio/headset/heads/rd/alt
	name = "research director's bowman headset"
	desc = "Headset of the researching God."
	icon_state = "com_headset_alt"
	ear_protection = 1
	ks2type = /obj/item/encryptionkey/heads/rd

/obj/item/radio/headset/heads/hos
	name = "head of security's headset"
	desc = "The headset of the man who protects your worthless lifes."
	icon_state = "com_headset"
	ks2type = /obj/item/encryptionkey/heads/hos

/obj/item/radio/headset/heads/hos/alt
	name = "head of security's bowman headset"
	desc = "The headset of the man who protects your worthless lifes."
	icon_state = "com_headset_alt"
	ear_protection = 2
	ks2type = /obj/item/encryptionkey/heads/hos

/obj/item/radio/headset/heads/blueshield
	name = "blueshield's headset"
	desc = "The headset of the person who protects command's valuable lives."
	icon_state = "com_headset"
	ks2type = /obj/item/encryptionkey/heads/hos

/obj/item/radio/headset/heads/blueshield/alt
	name = "blueshield's bowman headset"
	desc = "The headset of the person who protects command's valuable lives."
	icon_state = "com_headset_alt"
	ear_protection = 2
	ks2type = /obj/item/encryptionkey/heads/hos

/obj/item/radio/headset/heads/ce
	name = "chief engineer's headset"
	desc = "The headset of the guy who is in charge of morons"
	icon_state = "com_headset"
	ks2type = /obj/item/encryptionkey/heads/ce

/obj/item/radio/headset/heads/ce/alt
	name = "chief engineer's bowman headset"
	desc = "The headset of the guy who is in charge of morons"
	icon_state = "com_headset_alt"
	ear_protection = 2
	ks2type = /obj/item/encryptionkey/heads/ce

/obj/item/radio/headset/heads/cmo
	name = "chief medical officer's headset"
	desc = "The headset of the highly trained medical chief."
	icon_state = "com_headset"
	ks2type = /obj/item/encryptionkey/heads/cmo

/obj/item/radio/headset/heads/cmo/alt
	name = "chief medical officer's bowman headset"
	desc = "The headset of the highly trained medical chief."
	icon_state = "com_headset_alt"
	ear_protection = 2
	ks2type = /obj/item/encryptionkey/heads/cmo

/obj/item/radio/headset/heads/hop
	name = "head of personnel's headset"
	desc = "The headset of the guy who will one day be Facility Director."
	icon_state = "com_headset"
	ks2type = /obj/item/encryptionkey/heads/hop

/obj/item/radio/headset/heads/hop/alt
	name = "head of personnel's bowman headset"
	desc = "The headset of the guy who will one day be Facility Director."
	icon_state = "com_headset_alt"
	ear_protection = 2
	ks2type = /obj/item/encryptionkey/heads/hop

/obj/item/radio/headset/headset_mine
	name = "mining radio headset"
	desc = "Headset used by miners. Has inbuilt short-band radio for when comms are down."
	icon_state = "mine_headset"
	adhoc_fallback = TRUE
	ks2type = /obj/item/encryptionkey/headset_cargo

/obj/item/radio/headset/headset_cargo
	name = "supply radio headset"
	desc = "A headset used by the QM and his slaves."
	icon_state = "cargo_headset"
	ks2type = /obj/item/encryptionkey/headset_cargo

/obj/item/radio/headset/headset_cargo/alt
	name = "supply bowman headset"
	desc = "A bowman headset used by the QM and his slaves."
	icon_state = "cargo_headset_alt"
	ks2type = /obj/item/encryptionkey/headset_cargo

/obj/item/radio/headset/headset_service
	name = "service radio headset"
	desc = "Headset used by the service staff, tasked with keeping the station full, happy and clean."
	icon_state = "srv_headset"
	ks2type = /obj/item/encryptionkey/headset_service

/obj/item/radio/headset/ert
	name = "emergency response team radio headset"
	desc = "The headset of the boss's boss."
	icon_state = "com_headset"
	centcom = 1
//	freerange = 1
	ks2type = /obj/item/encryptionkey/ert

/obj/item/radio/headset/ert/alt
	name = "emergency response team bowman headset"
	desc = "The headset of the boss's boss."
	icon_state = "com_headset_alt"
	ear_protection = 2
//	freerange = 1
	ks2type = /obj/item/encryptionkey/ert

/obj/item/radio/headset/omni		//Only for the admin intercoms
	ks2type = /obj/item/encryptionkey/omni

/obj/item/radio/headset/ia
	name = "internal affair's headset"
	desc = "The headset of your worst enemy."
	icon_state = "com_headset"
	ks2type = /obj/item/encryptionkey/heads/hos

/obj/item/radio/headset/mmi_radio
	name = "brain-integrated radio"
	desc = "MMIs and synthetic brains are often equipped with these."
	icon = 'icons/obj/robot_component.dmi'
	icon_state = "radio"
	item_state = "headset"
	var/mmiowner = null
	var/radio_enabled = 1

/obj/item/radio/headset/mmi_radio/receive_range(freq, level)
	if (!radio_enabled || istype(src.loc.loc, /mob/living/silicon) || istype(src.loc.loc, /obj/item/organ/internal))
		return -1 //Transciever Disabled.
	return ..(freq, level, 1)

//Headset _vr port
/obj/item/radio/headset/centcom
	name = "centcom radio headset"
	desc = "The headset of the boss's boss."
	icon_state = "cent_headset"
	item_state = "headset"
	centcom = 1
	ks2type = /obj/item/encryptionkey/ert

/obj/item/radio/headset/centcom/alt
	name = "centcom bowman headset"
	icon_state = "com_headset_alt"
	ear_protection = 1

/obj/item/radio/headset/nanotrasen
	name = "\improper NT radio headset"
	desc = "The headset of a Nanotrasen corporate employee."
	icon_state = "nt_headset"
	centcom = 1
	ks2type = /obj/item/encryptionkey/ert

/obj/item/radio/headset/mob_headset	//Adminbus headset for simplemob shenanigans.
	name = "nonhuman radio implant"
	desc = "An updated, modular intercom that requires no hands to operate. Takes encryption keys"

/obj/item/radio/headset/mob_headset/receive_range(freq, level)
		return ..(freq, level)


/obj/item/radio/headset/mob_headset/nano_ui_interact(mob/user, ui_key = "main", var/datum/nanoui/ui = null, var/force_open = 1, var/state = interactive_state)
	ui = new(user, src, ui_key, "radio_basic.tmpl", "[name]", 400, 430, state = interactive_state)
	..()

/obj/item/radio/headset/mob_headset/afterattack(atom/target, mob/user, clickchain_flags, list/params)
	if(!(clickchain_flags & CLICKCHAIN_HAS_PROXIMITY))
		return
	if(istype(target,/mob/living/simple_mob))
		var/mob/living/simple_mob/M = target
		if(!M.mob_radio)
			forceMove(M)
			M.mob_radio = src
			return
		if(M.mob_radio)
			M.mob_radio.forceMove(M.loc)
			M.mob_radio = null
			return
	..()

//Headsets from the Southern Cross files.
/obj/item/radio/headset/pilot
	name = "pilot's headset"
	desc = "A headset used by pilots, has access to supply and explorer channels."
	icon_state = "pilot_headset"
	adhoc_fallback = TRUE
	ks2type = /obj/item/encryptionkey/pilot

/obj/item/radio/headset/pilot/alt
	name = "pilot's bowman headset"
	desc = "A bowman headset used by pilots, has access to supply and explorer channels."
	icon_state = "pilot_headset_alt"

/obj/item/radio/headset/explorer
	name = "explorer's headset"
	desc = "Headset used by explorers for exploring. Access to the explorer channel."
	icon_state = "exp_headset"
	adhoc_fallback = TRUE
	ks2type = /obj/item/encryptionkey/explorer

/obj/item/radio/headset/explorer/alt
	name = "explorer's bowman headset"
	desc = "Bowman headset used by explorers for exploring. Access to the explorer channel."
	icon_state = "exp_headset_alt"

/obj/item/radio/headset/sar
	name = "sar radio headset"
	desc = "A headset for search and rescue."
	icon_state = "sar_headset"
	adhoc_fallback = TRUE
	ks2type = /obj/item/encryptionkey/sar

/obj/item/radio/headset/sar/alt
	name = "sar radio bowman headset"
	desc = "A bowman headset for search and rescue."
	icon_state = "sar_headset_alt"

/obj/item/radio/headset/pathfinder
	name = "pathfinder's headset"
	desc = "Headset used by Pathfinders for coordinating and executing expeditions."
	icon_state = "exp_headset_path"
	adhoc_fallback = TRUE
	ks2type = /obj/item/encryptionkey/pathfinder

/obj/item/radio/headset/pathfinder/alt
	name = "pathfinder's bowman headset"
	desc = "Headset used by Pathfinders for coordinating and executing expeditions."
	icon_state = "exp_headset_path_alt"
	//ear_protection = 1 removed because fuck you

//Headset SC _vr files
/obj/item/radio/headset/volunteer
	name = "volunteer's headset"
	desc = "A headset used by volunteers to expedition teams, has access to the exploration channel."
	icon_state = "pilot_headset"
	adhoc_fallback = TRUE
	ks2type = /obj/item/encryptionkey/pilot

/obj/item/radio/headset/talon
	name = "talon headset"
	desc = "A headset for communication between the crew of the ITV Talon."
	adhoc_fallback = TRUE
	icon_state = "pilot_headset"
	ks2type = /obj/item/encryptionkey/talon

/obj/item/radio/headset/sdf
	name = "sdf headset"
	desc = "A headset for communication for the SDF."
	adhoc_fallback = TRUE
	icon_state = "pilot_headset"
	ks2type = /obj/item/encryptionkey/sdf
