/proc/make_datum_reference_lists()
	//* Keybindings
	init_keybindings()

	//* Emotes
	_initialize_emotes()

	//* Circuits
	initialize_integrated_circuits_list()

	//* Recipes
	init_subtypes(/datum/crafting_recipe, GLOB.crafting_recipes)

	var/list/paths

	//Hair - Initialise all /datum/sprite_accessory/hair into an list indexed by hair-style name
	paths = typesof(/datum/sprite_accessory/hair) - /datum/sprite_accessory/hair
	hair_styles_list = list()
	for(var/path in paths)
		var/datum/sprite_accessory/hair/H = new path
		if(!istext(H.name))
			qdel(H)
			continue
		if(hair_styles_list[H.name])
			stack_trace("Duplicate name [H.name] detected - [hair_styles_list[H.name]] vs [H]")
			continue
		hair_styles_list[H.name] = H
		switch(H.gender)
			if(MALE)	hair_styles_male_list += H.name
			if(FEMALE)	hair_styles_female_list += H.name
			else
				hair_styles_male_list += H.name
				hair_styles_female_list += H.name
	sortTim(hair_styles_list, /proc/cmp_name_asc, associative = TRUE)

	//Facial Hair - Initialise all /datum/sprite_accessory/facial_hair into an list indexed by facialhair-style name
	paths = typesof(/datum/sprite_accessory/facial_hair) - /datum/sprite_accessory/facial_hair
	facial_hair_styles_list = list()
	for(var/path in paths)
		var/datum/sprite_accessory/facial_hair/H = new path()
		if(!istext(H.name))
			qdel(H)
			continue
		if(facial_hair_styles_list[H.name])
			stack_trace("Duplicate name [H.name] detected - [facial_hair_styles_list[H.name]] vs [H]")
			continue
		facial_hair_styles_list[H.name] = H
		switch(H.gender)
			if(MALE)	facial_hair_styles_male_list += H.name
			if(FEMALE)	facial_hair_styles_female_list += H.name
			else
				facial_hair_styles_male_list += H.name
				facial_hair_styles_female_list += H.name
	sortTim(facial_hair_styles_list, /proc/cmp_name_asc, associative = TRUE)

	//Body markings - Initialise all /datum/sprite_accessory/marking into an list indexed by marking name
	paths = typesof(/datum/sprite_accessory/marking) - /datum/sprite_accessory/marking
	body_marking_styles_list = list()
	for(var/path in paths)
		var/datum/sprite_accessory/marking/M = new path()
		if(!istext(M.name))
			qdel(M)
			continue
		if(body_marking_styles_list[M.name])
			stack_trace("Duplicate name [M.name] detected - [body_marking_styles_list[M.name]] vs [M]")
			continue

		body_marking_styles_list[M.name] = M
	sortTim(body_marking_styles_list, /proc/cmp_name_asc, associative = TRUE)

	//List of job. I can't believe this was calculated multiple times per tick!
	paths = typesof(/datum/job)-/datum/job
	paths -= exclude_jobs
	for(var/T in paths)
		var/datum/job/J = new T
		joblist[J.title] = J

	if(!length(GLOB.species_meta))	// yeah i hate it too but hey
		initialize_static_species_cache()
	// SScharacter_setup handling static caches and body markings and sprit eaccessories when?? this is all awful

	//Languages and species.
	paths = subtypesof(/datum/language)
	for(var/T in paths)
		var/datum/language/L = T
		if(initial(L.abstract_type) == T)
			continue
		L = new T
		GLOB.all_languages[L.name] = L

	for (var/language_name in GLOB.all_languages)
		var/datum/language/L = GLOB.all_languages[language_name]
		if(!(L.flags & NONGLOBAL))
			GLOB.language_keys[L.key] = L

	for(var/datum/species/S as anything in all_static_species_meta())
		if(!(S.spawn_flags & SPECIES_IS_RESTRICTED))
			GLOB.playable_species += S.name
		if(S.spawn_flags & SPECIES_IS_WHITELISTED)
			GLOB.whitelisted_species += S.name

	//Posters
	paths = typesof(/datum/poster) - /datum/poster
	paths -= typesof(/datum/poster/nanotrasen)
	for(var/T in paths)
		var/datum/poster/P = new T
		poster_designs += P

	paths = typesof(/datum/poster/nanotrasen)
	for(var/T in paths)
		var/datum/poster/P = new T
		NT_poster_designs += P

	//Custom Ears
	paths = typesof(/datum/sprite_accessory/ears) - /datum/sprite_accessory/ears
	for(var/path in paths)
		var/obj/item/clothing/head/instance = new path()
		ear_styles_list[path] = instance

	//Custom Tails
	paths = typesof(/datum/sprite_accessory/tail) - /datum/sprite_accessory/tail - /datum/sprite_accessory/tail/taur
	for(var/path in paths)
		var/datum/sprite_accessory/tail/instance = new path()
		tail_styles_list[path] = instance

	//Custom Wings
	paths = typesof(/datum/sprite_accessory/wing) - /datum/sprite_accessory/wing
	for(var/path in paths)
		var/datum/sprite_accessory/wing/instance = new path()
		wing_styles_list[path] = instance

	// Custom species traits
	paths = typesof(/datum/trait) - /datum/trait - /datum/trait/negative - /datum/trait/neutral - /datum/trait/positive
	for(var/path in paths)
		var/datum/trait/instance = new path()
		if(!instance.name)
			continue //A prototype or something
		var/cost = instance.cost
		traits_costs[path] = cost
		all_traits[path] = instance
		switch(cost)
			if(-INFINITY to -0.1)
				negative_traits[path] = instance
			if(0)
				neutral_traits[path] = instance
			if(0.1 to INFINITY)
				positive_traits[path] = instance

	// Custom species icon bases
	var/list/blacklisted_icons = list(SPECIES_CUSTOM, SPECIES_PROMETHEAN)
	var/list/whitelisted_icons = list(SPECIES_VULPKANIN, SPECIES_XENOHYBRID)
	for(var/species_name in GLOB.playable_species)
		if(species_name in blacklisted_icons)
			continue
		var/datum/species/S = name_static_species_meta(species_name)
		if(S.spawn_flags & SPECIES_IS_WHITELISTED)
			continue
		GLOB.custom_species_bases += species_name
	for(var/species_name in whitelisted_icons)
		GLOB.custom_species_bases += species_name

	return 1 // Hooks must return 1
