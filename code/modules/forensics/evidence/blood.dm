/**
 * Blood DNA module
 *
 * Touching something with bloody gloves/hands,
 * getting hit with a bleeding wound while wearing clothing,
 * making someone else bleed with an attack,
 * and some other factors will cause you to bleed onto items.
 *
 * This leaves your blood DNA on it.
 * Blood DNA can get fragmented/mixed if there's too many pieces of DNA on an object.
 *
 * This is by far the most easy piece of evidence to both leave and clean up.
 * However, this is also a very deterministic piece of evidence.
 */
/atom
	var/list/blood_DNA
	var/was_bloodied
	var/blood_color


//returns 1 if made bloody, returns 0 otherwise
/atom/proc/add_blood(mob/living/carbon/human/M as mob)

	if(flags & NOBLOODY)
		return 0

	if(!blood_DNA || !istype(blood_DNA, /list))	//if our list of DNA doesn't exist yet (or isn't a list) initialise it.
		blood_DNA = list()

	was_bloodied = 1
	if(!blood_color)
		blood_color = "#A10808"
	if(istype(M))
		if (!istype(M.dna, /datum/dna))
			M.dna = new /datum/dna(null)
			M.dna.real_name = M.real_name
		M.check_dna()
		blood_color = M.species.get_blood_colour(M)
	. = 1
	return 1

/atom/proc/clean_blood()
	if(!simulated)
		return
	fluorescent = 0
	src.germ_level = 0
	if(istype(blood_DNA, /list))
		blood_DNA = null
		return 1
