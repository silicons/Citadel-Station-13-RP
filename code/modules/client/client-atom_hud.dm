//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

/client/proc/add_atom_hud(datum/atom_hud/hud, source)
	ASSERT(istext(source))
	if(isnull(atom_hud_providers))
		atom_hud_providers = list()
	var/list/datum/atom_hud_provider/providers = hud.resolve_providers()
	for(var/datum/atom_hud_provider/provider as anything in providers)
		var/already_there = atom_hud_providers[provider]
		if(already_there)
			atom_hud_providers[provider] |= source
		else
			atom_hud_providers[provider] = list(source)
			provider.add_client(src)

/client/proc/remove_atom_hud(datum/atom_hud/hud, source)
	ASSERT(istext(source))
	if(!length(atom_hud_providers))
		return
	if(!hud)
		// remove all of source
		for(var/datum/atom_hud_provider/provider as anything in atom_hud_providers)
			if(!(source in atom_hud_providers[provider]))
				continue
			atom_hud_providers[provider] -= source
			if(!length(atom_hud_providers[provider]))
				atom_hud_providers -= provider
				provider.remove_client(src)
		return
	hud = fetch_atom_hud(hud)
	var/list/datum/atom_hud_provider/providers = hud.resolve_providers()
	for(var/datum/atom_hud_provider/provider as anything in providers)
		if(!length(atom_hud_providers[provider]))
			continue
		atom_hud_providers[provider] -= source
		if(!length(atom_hud_providers[provider]))
			atom_hud_providers -= provider
			provider.remove_client(src)

// todo: add_atom_hud_provider, remove_atom_hud_provider

/client/proc/clear_atom_hud_providers()
	for(var/datum/atom_hud_provider/provider as anything in atom_hud_providers)
		provider.remove_client(src)
	atom_hud_providers = null
