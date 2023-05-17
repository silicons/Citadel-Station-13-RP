/datum/gbp_catalog/survey

/datum/gbp_catalog/survey/New()
	..()

	//* Equipment *//
	items += new /datum/gbp_catalog_item{
		name = "Binoculars";
		category = "Equipment";
		cost = 50;
		path = /obj/item/binoculars;
	}
	items += new /datum/gbp_catalog_item{
		name = "GPS Device";
		category = "Equipment";
		cost = 10;
		path = /obj/item/gps/explorer;
	}
	items += new /datum/gbp_catalog_item{
		name = "Marker Beacons";
		category = "Equipment";
		cost = 1;
		path = /obj/item/stack/marker_beacon;
	}

	//* Experimental *//
	items += new /datum/gbp_catalog_item{
		name = "Personal Translocator";
		category = "Experimental";
		cost = 500;
		path = /obj/item/perfect_tele;
	}

	//* Food & Drinks - Alcohol *//
	items += new /datum/gbp_catalog_item{
		name = "Absinthe";
		category = "Food & Drinks";
		cost = 10;
		path = /obj/item/reagent_containers/food/drinks/bottle/absinthe;
	}
	items += new /datum/gbp_catalog_item{
		name = "Whiskey";
		category = "Food & Drinks";
		cost = 10;
		path = /obj/item/reagent_containers/food/drinks/bottle/whiskey;
	}

	//* Logistics *//
	items += new /datum/gbp_catalog_item{
		name = "Fulton Beacon";
		category = "Logistics";
		cost = 50;
		path = /obj/item/fulton_core;
	}
	items += new /datum/gbp_catalog_item{
		name = "Fulton Pack";
		category = "Logistics";
		cost = 25;
		path = /obj/item/extraction_pack;
	}

	//* Medical *//
	items += new /datum/gbp_catalog_item{
		name = "Autoinjector - Glucose";
		category = "First-Aid";
		cost = 10;
		path = /obj/item/reagent_containers/hypospray/autoinjector/biginjector/glucose;
	}
	items += new /datum/gbp_catalog_item{
		name = "Autoinjector - Rad/Tox";
		category = "First-Aid";
		cost = 15;
		path = /obj/item/reagent_containers/hypospray/autoinjector/biginjector/purity;
	}
	items += new /datum/gbp_catalog_item{
		name = "Autoinjector - Bicaridine";
		category = "First-Aid";
		cost = 15;
		path = /obj/item/reagent_containers/hypospray/autoinjector/biginjector/brute;
	}
	items += new /datum/gbp_catalog_item{
		name = "Nanopaste";
		category = "First-Aid";
		cost = 2;
		path = /obj/item/stack/nanopaste;
	}

	//* Misc *//
	items += new /datum/gbp_catalog_item{
		name = "Laser Pointer";
		category = "Misc";
		cost = 25;
		path = /obj/item/laser_pointer;
	}
	items += new /datum/gbp_catalog_item{
		name = "Modular Tablet - Standard";
		cateogry = "Misc";
		cost = 35;
		path = /obj/item/modular_computer/tablet/preset/custom_loadout/standard;
	}
	items += new /datum/gbp_catalog_item{
		name = "Modular Tablet - Advanced";
		category = "Misc";
		cost = 70;
		path = /obj/item/modular_computer/tablet/preset/custom_loadout/advanced;
	}
	items += new /datum/gbp_catalog_item{
		name = "Plush Toy";
		category = "Misc";
		cost = 10;
		path = /obj/random/plushie;
	}
	items += new /datum/gbp_catalog_item{
		name = "Premium Havana Cigar";
		category = "Misc";
		cost = 10;
		path = /obj/item/clothing/mask/smokable/cigarette/cigar/havana;
	}
	items += new /datum/gbp_catalog_item{
		name = "Soap";
		category = "Misc";
		cost = 5;
		path = /obj/item/soap/nanotrasen;
	}
	items += new /datum/gbp_catalog_item{
		name = "Umbrella";
		category = "Misc";
		cost = 10;
		path = /obj/item/melee/umbrella/random;
	}

	//* Packs *//
	items += new /datum/gbp_catalog_item{
		name = "Gateway Guardian Pack";
		category = "Packs";
		cost = 1000;
		path = /obj/item/storage/lockbox/gateway;
	}
	items += new /datum/gbp_catalog_item{
		name = "Holy Crusade Pack";
		category = "Packs";
		cost = 500;
		path = /obj/item/storage/lockbox/crusade;
	}

	//* Shelters *//
	items += new /datum/gbp_catalog_item{
		name = "Shelter Capsule";
		category = "Shelters";
		cost = 35;
		path = /obj/item/survivalcapsule;
	}
	items += new /datum/gbp_catalog_item{
		name = "Shelter Capsule - Bar";
		category = "Shelters";
		cost = 750;
		path = /obj/item/survivalcapsule/luxurybar
	}
	items += new /datum/gbp_catalog_item{
		name = "Shelter Capsule - Luxury";
		category = "Shelters";
		cost = 400;
		path = /obj/item/survivalcapsule/luxury
	}

	//* Tools *//
	items += new /datum/gbp_catalog_item{
		name = "Beartrap";
		category = "Tools";
		cost = 25;
		path = /obj/item/beartrap;
	}
	items += new /datum/gbp_catalog_item{
		name = "Geiger Counter";
		category = "Tools";
		cost = 30;
		path = /obj/item/geiger_counter;
	}
	items += new /datum/gbp_catalog_item{
		name = "Shovel";
		category = "Tools";
		cost = 25;
		path = /obj/item/shovel;
	}

	//* Weapons *//
	items += new /datum/gbp_catalog_item{
		name = "Designated Marksman Box";
		category = "Weapons";
		cost = 1000;
		path = /obj/item/gunbox/marksman;
	}
	items += new /datum/gbp_catalog_item{
		name = "Kinetic Dagger";
		category = "Weapons";
		cost = 125;
		path = /obj/item/kinetic_crusher/dagger
	}
	items += new /datum/gbp_catalog_item{
		name = "Machete - Steel";
		category = "Weapons";
		cost = 65;
		path = /obj/item/material/knife/machete;
	}
