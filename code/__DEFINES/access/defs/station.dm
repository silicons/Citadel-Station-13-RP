#warn audit ids, there's dupes. also, namespaces.

//? General

#define ACCESS_GENERAL_CHAPEL 22
STANDARD_ACCESS_DATUM("chapel", ACCESS_GENERAL_CHAPEL, station/general/chapel, "Chapel Office")

#define ACCESS_GENERAL_BAR 25
STANDARD_ACCESS_DATUM("bar", ACCESS_GENERAL_BAR, station/general/bar, "Bar")

#define ACCESS_GENERAL_JANITOR 26
STANDARD_ACCESS_DATUM("janitor", ACCESS_GENERAL_JANITOR, station/general/janitor, "Custodial Closet")

#define ACCESS_GENERAL_CREMATOR 27
STANDARD_ACCESS_DATUM("cremator", ACCESS_GENERAL_CREMATOR, station/general/crematorium, "Crematorium")

#define ACCESS_GENERAL_KITCHEN 28
STANDARD_ACCESS_DATUM("kitchen", ACCESS_GENERAL_KITCHEN, station/general/kitchen, "Kitchen")

#define ACCESS_GENERAL_BOTANY 35
STANDARD_ACCESS_DATUM("botany", ACCESS_GENERAL_BOTANY, station/general/hydroponics, "Hydroponics")

#define ACCESS_GENERAL_LIBRARY 37
STANDARD_ACCESS_DATUM("library", ACCESS_GENERAL_LIBRARY, station/general/library, "Library")

#define ACCESS_GENERAL_EXPLORER 43
STANDARD_ACCESS_DATUM("explorer", ACCESS_GENERAL_EXPLORER, station/general/explorer, "Explorer")

#define ACCESS_GENERAL_PATHFINDER 44
STANDARD_ACCESS_DATUM("pathfinder", ACCESS_GENERAL_PATHFINDER, station/general/pathfinder, "Pathfinder")
	access_edit_list = list(
		/datum/prototype/access/station/general/explorer,
		/datum/prototype/access/station/general/pilot,
		/datum/prototype/access/station/general/pathfinder,
	)

#define ACCESS_GENERAL_GATEWAY 62
STANDARD_ACCESS_DATUM("gateway", ACCESS_GENERAL_GATEWAY, station/general/gateway, "Gateway")

#define ACCESS_GENERAL_PILOT 67
STANDARD_ACCESS_DATUM("pilot", ACCESS_GENERAL_PILOT, station/general/pilot, "Pilot")

#define ACCESS_GENERAL_ENTERTAINMENT 72
STANDARD_ACCESS_DATUM("entertainment", ACCESS_GENERAL_ENTERTAINMENT, station/general/entertainment, "Entertainment Backstage")

#define ACCESS_GENERAL_CLOWN 136
STANDARD_ACCESS_DATUM("clown", ACCESS_GENERAL_CLOWN, station/general/clown, "Clown Office")

#define ACCESS_GENERAL_MIME 138
STANDARD_ACCESS_DATUM("mime", ACCESS_GENERAL_MIME, station/general/mime, "Mime Office")

#define ACCESS_GENERAL_TOMFOOLERY 137
STANDARD_ACCESS_DATUM("tomfoolery", ACCESS_GENERAL_TOMFOOLERY, station/general/tomfoolery, "Tomfoolery Closet")

#define ACCESS_GENERAL_EDIT 305
STANDARD_ACCESS_DATUM("edit", ACCESS_GENERAL_EDIT, station/general/edit, "General - Access Edit")
	sort_order = -1000
	access_edit_region = ACCESS_REGION_GENERAL
	access_edit_type = ACCESS_TYPE_STATION

//? Command

#define ACCESS_COMMAND_CARDMOD 15
STANDARD_ACCESS_DATUM("cardmod", ACCESS_COMMAND_CARDMOD, station/command/cardmod, "ID Modification")
	access_edit_type = ACCESS_TYPE_STATION
	access_edit_region = ACCESS_REGION_ALL

#define ACCESS_COMMAND_UPLOAD 16
STANDARD_ACCESS_DATUM("upload", ACCESS_COMMAND_UPLOAD, station/command/upload, "AI Upload")

#define ACCESS_COMMAND_TELEPORTER 17
STANDARD_ACCESS_DATUM("teleporter", ACCESS_COMMAND_TELEPORTER, station/command/teleporter, "Teleporter")

// todo: rename / repath to general high-security storage for command
#define ACCESS_COMMAND_EVA 18
STANDARD_ACCESS_DATUM("eva", ACCESS_COMMAND_EVA, station/command/eva, "EVA")

#define ACCESS_COMMAND_BRIDGE 19
STANDARD_ACCESS_DATUM("bridge", ACCESS_COMMAND_BRIDGE, station/command/bridge, "Bridge")

#define ACCESS_COMMAND_CAPTAIN 20
STANDARD_ACCESS_DATUM("captain", ACCESS_COMMAND_CAPTAIN, station/command/captain, "Facility Director")

#define ACCESS_COMMAND_LOCKERS 21
STANDARD_ACCESS_DATUM("lockers", ACCESS_COMMAND_LOCKERS, station/command/lockers, "Personal Lockers")

#define ACCESS_COMMAND_IAA 38
STANDARD_ACCESS_DATUM("iaa", ACCESS_COMMAND_IAA, station/command/iaa, "Internal Affairs")

#define ACCESS_COMMAND_ANNOUNCE 59
STANDARD_ACCESS_DATUM("announce", ACCESS_COMMAND_ANNOUNCE, station/command/announce, "RC Announcements")

#define ACCESS_COMMAND_KEYAUTH 60 //Used for events which require at least two people to confirm them
STANDARD_ACCESS_DATUM("keyauth", ACCESS_COMMAND_KEYAUTH, station/command/keyauth, "Keycard Authentication")

#define ACCESS_COMMAND_HOP 57
STANDARD_ACCESS_DATUM("hop", ACCESS_COMMAND_HOP, station/command/hop, "Head of Personnel")

#define ACCESS_COMMAND_VAULT 53
STANDARD_ACCESS_DATUM("vault", ACCESS_COMMAND_VAULT, station/command/vault, "Main Vault")

#define ACCESS_COMMAND_BANKING 68
STANDARD_ACCESS_DATUM("banking", ACCESS_COMMAND_BANKING, station/command/bank_manage, "Account Uplink")

#define ACCESS_COMMAND_BLUESHIELD 69
STANDARD_ACCESS_DATUM("blueshield", ACCESS_COMMAND_BLUESHIELD, station/command/blueshield, "Blueshield")

//? Security

#define ACCESS_SECURITY_EQUIPMENT 1
STANDARD_ACCESS_DATUM("equipment", ACCESS_SECURITY_EQUIPMENT, station/security/equipment, "Security Equipment")

#define ACCESS_SECURITY_BRIG 2
STANDARD_ACCESS_DATUM("brig", ACCESS_SECURITY_BRIG, station/security/brig, "Brig")

#define ACCESS_SECURITY_ARMORY 3
STANDARD_ACCESS_DATUM("armory", ACCESS_SECURITY_ARMORY, station/security/armory, "Armory")

#define ACCESS_SECURITY_FORENSICS 4
STANDARD_ACCESS_DATUM("forensics", ACCESS_SECURITY_FORENSICS, station/security/forensics, "Forensics")

#define ACCESS_SECURITY_MAIN 63 // Security front doors
STANDARD_ACCESS_DATUM("main", ACCESS_SECURITY_MAIN, station/security/main, "Security")

#define ACCESS_SECURITY_HOS 58
STANDARD_ACCESS_DATUM("hos", ACCESS_SECURITY_HOS, station/security/hos, "Head of Security")

#define ACCESS_SECURITY_GENPOP_ENTER 111
STANDARD_ACCESS_DATUM("genpop", ACCESS_SECURITY_GENPOP_ENTER, station/security/genpop_enter, "Genpop - Enter")

#define ACCESS_SECURITY_GENPOP_EXIT 112
STANDARD_ACCESS_DATUM("genpop", ACCESS_SECURITY_GENPOP_EXIT, station/security/genpop_exit, "Genpop - Exit")


#define ACCESS_SECURITY_EDIT 306
STANDARD_ACCESS_DATUM("edit", ACCESS_SECURITY_EDIT, station/security/edit, "Security - Access Edit")
	sort_order = -1000
	access_edit_region = ACCESS_REGION_SECURITY
	access_edit_type = ACCESS_TYPE_STATION

//? Engineering

#define ACCESS_ENGINEERING_MAIN 10
STANDARD_ACCESS_DATUM("main", ACCESS_ENGINEERING_MAIN, station/engineering/main, "Engineering")

#define ACCESS_ENGINEERING_ENGINE 11
STANDARD_ACCESS_DATUM("engine", ACCESS_ENGINEERING_ENGINE, station/engineering/engine, "Engine Room")

#define ACCESS_ENGINEERING_MAINT 12
STANDARD_ACCESS_DATUM("maint", ACCESS_ENGINEERING_MAINT, station/engineering/maint, "Maintenance")

#define ACCESS_ENGINEERING_AIRLOCK 13
STANDARD_ACCESS_DATUM("airlock", ACCESS_ENGINEERING_AIRLOCK, station/engineering/airlock, "External Airlocks")

#define ACCESS_ENGINEERING_TRIAGE 14
STANDARD_ACCESS_DATUM("triage", ACCESS_ENGINEERING_TRIAGE, station/engineering/triage, "Engineering Triage")

#define ACCESS_ENGINEERING_TECHSTORAGE 23
STANDARD_ACCESS_DATUM("techstorage", ACCESS_ENGINEERING_TECHSTORAGE, station/engineering/techstorage, "Technical Storage")

#define ACCESS_ENGINEERING_ATMOS 24
STANDARD_ACCESS_DATUM("atmos", ACCESS_ENGINEERING_ATMOS, station/engineering/atmos, "Atmospherics")

#define ACCESS_ENGINEERING_CONSTRUCTION 32
STANDARD_ACCESS_DATUM("construction", ACCESS_ENGINEERING_CONSTRUCTION, station/engineering/construction, "Construction Areas")

#define ACCESS_ENGINEERING_TELECOMMS 61 // has access to the entire telecomms satellite / machinery
STANDARD_ACCESS_DATUM("telecomms", ACCESS_ENGINEERING_TELECOMMS, station/engineering/tcomsat, "Telecomms")

#define ACCESS_ENGINEERING_CE 56
STANDARD_ACCESS_DATUM("ce", ACCESS_ENGINEERING_CE, station/engineering/ce, "Chief Engineer")

#define ACCESS_ENGINEERING_EDIT 303
STANDARD_ACCESS_DATUM("edit", ACCESS_ENGINEERING_EDIT, station/engineering/edit, "Engineering - Access Edit")
	sort_order = -1000
	access_edit_region = ACCESS_REGION_ENGINEERING
	access_edit_type = ACCESS_TYPE_STATION

//? Medical

#define ACCESS_MEDICAL_MAIN 5
STANDARD_ACCESS_DATUM("main", ACCESS_MEDICAL_MAIN, station/medical/main, "Medical")

#define ACCESS_MEDICAL_MORGUE 6
STANDARD_ACCESS_DATUM("morgue", ACCESS_MEDICAL_MORGUE, station/medical/morgue, "Morgue")

#define ACCESS_MEDICAL_CHEMISTRY 33
STANDARD_ACCESS_DATUM("chemistry", ACCESS_MEDICAL_CHEMISTRY, station/medical/chemistry, "Chemistry Lab")

#define ACCESS_MEDICAL_VIROLOGY 39
STANDARD_ACCESS_DATUM("virology", ACCESS_MEDICAL_VIROLOGY, station/medical/virology, "Virology")

#define ACCESS_MEDICAL_CMO 40
STANDARD_ACCESS_DATUM("cmo", ACCESS_MEDICAL_CMO, station/medical/cmo, "Chief Medical Officer")

#define ACCESS_MEDICAL_SURGERY 45
STANDARD_ACCESS_DATUM("surgery", ACCESS_MEDICAL_SURGERY, station/medical/surgery, "Surgery")

#define ACCESS_MEDICAL_PSYCH 64 // Psychiatrist's office
STANDARD_ACCESS_DATUM("psych", ACCESS_MEDICAL_PSYCH, station/medical/psych, "Phychiatrist's Office")

#define ACCESS_MEDICAL_EQUIPMENT 66
STANDARD_ACCESS_DATUM("equipment", ACCESS_MEDICAL_EQUIPMENT, station/medical/equipment, "Medical Equipment")

#define ACCESS_MEDICAL_EDIT 302
STANDARD_ACCESS_DATUM("edit", ACCESS_MEDICAL_EDIT, station/medical/edit, "Medical - Access Edit")
	sort_order = -1000
	access_edit_region = ACCESS_REGION_MEDBAY
	access_edit_type = ACCESS_TYPE_STATION

//? Science

#define ACCESS_SCIENCE_FABRICATION 7
STANDARD_ACCESS_DATUM("fabrication", ACCESS_SCIENCE_FABRICATION, station/science/fabrication, "Fabrication")

#define ACCESS_SCIENCE_TOXINS 8
STANDARD_ACCESS_DATUM("toxins", ACCESS_SCIENCE_TOXINS, station/science/toxins, "Toxins Lab")

#define ACCESS_SCIENCE_GENETICS 9
STANDARD_ACCESS_DATUM("genetics", ACCESS_SCIENCE_GENETICS, station/science/genetics, "Genetics Lab")

#define ACCESS_SCIENCE_ROBOTICS 29
STANDARD_ACCESS_DATUM("robotics", ACCESS_SCIENCE_ROBOTICS, station/science/robotics, "Robotics")

#define ACCESS_SCIENCE_RD 30
STANDARD_ACCESS_DATUM("rd", ACCESS_SCIENCE_RD, station/science/rd, "Research Director")

#define ACCESS_SCIENCE_EXONET 42
STANDARD_ACCESS_DATUM("exonet", ACCESS_SCIENCE_EXONET, station/science/exonet, "Station Network")

#define ACCESS_SCIENCE_MAIN 47
STANDARD_ACCESS_DATUM("main", ACCESS_SCIENCE_MAIN, station/science/main, "Science")

#define ACCESS_SCIENCE_XENOBIO 55
STANDARD_ACCESS_DATUM("xenobio", ACCESS_SCIENCE_XENOBIO, station/science/xenobiology, "Xenobiology Lab")

#define ACCESS_SCIENCE_XENOARCH 65
STANDARD_ACCESS_DATUM("xenoarch", ACCESS_SCIENCE_XENOARCH, station/science/xenoarch, "Xenoarchaeology")

#define ACCESS_SCIENCE_XENOBOTANY 77
STANDARD_ACCESS_DATUM("xenobotany", ACCESS_SCIENCE_XENOBOTANY, station/science/xenobotany, "Xenobotany Garden")

#define ACCESS_SCIENCE_EDIT 307
STANDARD_ACCESS_DATUM("edit", ACCESS_SCIENCE_EDIT, station/science/edit, "Science - Access Edit")
	sort_order = -1000
	access_edit_region = ACCESS_REGION_RESEARCH
	access_edit_type = ACCESS_TYPE_STATION

//? Supply

#define ACCESS_SUPPLY_BAY 31
STANDARD_ACCESS_DATUM("bay", ACCESS_SUPPLY_BAY, station/supply/cargo, "Cargo Bay")

#define ACCESS_SUPPLY_MULEBOT 34
STANDARD_ACCESS_DATUM("mulebot", ACCESS_SUPPLY_MULEBOT, station/supply/mulebot, "Mulebot Access")

#define ACCESS_SUPPLY_QM 41
STANDARD_ACCESS_DATUM("qm", ACCESS_SUPPLY_QM, station/supply/qm, "Quartermaster")

#define ACCESS_SUPPLY_MINE 48
STANDARD_ACCESS_DATUM("mine", ACCESS_SUPPLY_MINE, station/supply/mining, "Mining")

#define ACCESS_SUPPLY_MAIN 50
STANDARD_ACCESS_DATUM("main", ACCESS_SUPPLY_MAIN, station/supply/main, "Cargo Office")

#define ACCESS_SUPPLY_MINE_OUTPOST 54
STANDARD_ACCESS_DATUM("mine", ACCESS_SUPPLY_MINE_OUTPOST, station/supply/mining_outpost, "Mining EVA")

#define ACCESS_SUPPLY_EDIT 304
STANDARD_ACCESS_DATUM("edit", ACCESS_SUPPLY_EDIT, station/supply/edit, "Supply - Access Edit")
	sort_order = -1000
	access_edit_region = ACCESS_REGION_SUPPLY
	access_edit_type = ACCESS_TYPE_STATION
