/datum/emote/species
	/// species allowed list - list to overrides deny + allow only, null to allow all (doesn't override deny)
	var/list/species_allowed
	/// species denied list
	var/list/species_denied

/datum/emote/species/is_valid(mob/M)
	if(!ishuman(M))
		return FALSE
	var/mob/living/carbon/human/H = M
	if(!species_allowed)
		return !(H.species.get_master_id() in species_denied)
	return (H.species.get_master_id() in species_allowed)

/datum/emote/species/collides(datum/emote/other)
	. = ..()
	if(.)
		return
	// sorry no species heuristics without whitelist
	if(!species_allowed || !other.species_allowed)
		return TRUE
	// otherwise..
	return !!length(species_allowed & other.species_allowed)
