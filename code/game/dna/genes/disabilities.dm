/**
 * DISABILITY GENES
 *
 * These activate either a mutation, disability, or sdisability.
 *
 * Gene is always activated.
 *
 * TODO: Rewrite this crap from scratch, this is horrible. -Zandario
 */
/datum/legacy_gene/disability
	name = "DISABILITY"

	/// Mutation to give (or 0)
	var/mutation = 0
	/// Disability to give (or 0)
	var/disability = 0
	/// SDisability to give (or 0)
	var/sdisability = 0
	/// Activation message
	var/activation_message = ""
	/// Yay, you're no longer growing 3 arms
	var/deactivation_message = ""

/datum/legacy_gene/disability/can_activate(mob/M, flags)
	return 1 // Always set!

/datum/legacy_gene/disability/activate(mob/M, connected, flags)
	if(mutation && !(mutation in M.mutations))
		M.mutations.Add(mutation)
	if(disability)
		M.disabilities|=disability
	if(sdisability)
		M.sdisabilities|=sdisability
	if(activation_message)
		to_chat(M, SPAN_WARNING("[activation_message]"))
	else
		testing("[name] has no activation message.")

/datum/legacy_gene/disability/deactivate(mob/M, connected, flags)
	if(mutation && (mutation in M.mutations))
		M.mutations.Remove(mutation)
	if(disability)
		M.disabilities &= (~disability)
	if(sdisability)
		M.sdisabilities &= (~sdisability)
	if(deactivation_message)
		to_chat(M, SPAN_WARNING("[deactivation_message]"))
	else
		testing("[name] has no deactivation message.")

// Note: Doesn't seem to do squat, at the moment. // For at LEAST 4 years. -Zandario
/datum/legacy_gene/disability/hallucinate
	name = "Hallucinate"
	activation_message = "Your mind says 'Hello'."
	mutation = MUTATION_HALLUCINATION

/datum/legacy_gene/disability/hallucinate/New()
	block = DNABLOCK_HALLUCINATION

/datum/legacy_gene/disability/epilepsy
	name = "Epilepsy"
	activation_message = "You get a headache."
	disability = DISABILITY_EPILEPSY

/datum/legacy_gene/disability/epilepsy/New()
	block = DNABLOCK_HEADACHE

/datum/legacy_gene/disability/cough
	name = "Coughing"
	activation_message = "You start coughing."
	disability = DISABILITY_COUGHING

/datum/legacy_gene/disability/cough/New()
	block = DNABLOCK_COUGH

/datum/legacy_gene/disability/clumsy
	name = "Clumsiness"
	activation_message = "You feel lightheaded."
	mutation = MUTATION_CLUMSY

/datum/legacy_gene/disability/clumsy/New()
	block = DNABLOCK_CLUMSY

/datum/legacy_gene/disability/tourettes
	name = "Tourettes"
	activation_message = "You twitch."
	disability = DISABILITY_TOURETTES

/datum/legacy_gene/disability/tourettes/New()
	block = DNABLOCK_TWITCH

/datum/legacy_gene/disability/nervousness
	name = "Nervousness"
	activation_message = "You feel nervous."
	disability = DISABILITY_NERVOUS

/datum/legacy_gene/disability/nervousness/New()
	block = DNABLOCK_NERVOUS

/datum/legacy_gene/disability/blindness
	name = "Blindness"
	activation_message = "You can't seem to see anything."
	sdisability = SDISABILITY_NERVOUS

/datum/legacy_gene/disability/blindness/New()
	block = DNABLOCK_BLIND

/datum/legacy_gene/disability/deaf
	name = "Deafness"
	activation_message = "It's kinda quiet."
	sdisability = SDISABILITY_DEAF

/datum/legacy_gene/disability/deaf/New()
	block = DNABLOCK_DEAF

/datum/legacy_gene/disability/deaf/activate(mob/M, connected, flags)
	..(M,connected,flags)
	M.ear_deaf = 1

/datum/legacy_gene/disability/nearsighted
	name = "Nearsightedness"
	activation_message = "Your eyes feel weird..."
	disability = DISABILITY_NEARSIGHTED

/datum/legacy_gene/disability/nearsighted/New()
	block = DNABLOCK_GLASSES
