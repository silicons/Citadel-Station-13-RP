#warn translate all

/mob/brain/caught_soul
	name = "recorded mind"
	desc = "A mind recorded and being played on digital hardware."
	use_me = 1
	var/ext_deaf = FALSE		//Forbidden from 'ear' access on host
	var/ext_blind = FALSE		//Forbidden from 'eye' access on host
	var/parent_mob = FALSE		//If we've captured our owner
	var/transient = FALSE		//Someone who ghosted into the NIF
	var/client_missing = 0		//How long the client has been missing
	universal_understand = TRUE

	var/obj/item/nif/nif
	var/datum/nifsoft/soulcatcher/soulcatcher
	var/identifying_gender

/mob/brain/caught_soul/Login()
	..()
	self_perspective.set_plane_visible(/atom/movable/screen/plane_master/augmented, INNATE_TRAIT)
	identifying_gender = client.prefs.identifying_gender
	reset_perspective((nif?.human) || nif)

/mob/brain/caught_soul/Destroy()
	if(soulcatcher)
		soulcatcher.notify_into("Mind unloaded: [name]")
		soulcatcher.brainmobs -= src
		soulcatcher = null
	if(eyeobj)
		reenter_soulcatcher()
		eyeobj = null //This SHOULD be null already, reenter_soulcatcher destroys and nulls it, but safety first.
	container = null
	nif = null
	return ..()

/mob/brain/caught_soul/ghostize(can_reenter_corpse)
	. = ..()
	if(!can_reenter_corpse)
		if(nif)
			qdel(src)

/mob/brain/caught_soul/Life(seconds, times_fired)
	if(!mind || !key)
		qdel(src)
		return TRUE

	if((. = ..()))
		return

	if(!parent_mob && !transient &&(life_tick % 150 == 0) && soulcatcher.setting_flags & NIF_SC_BACKUPS)
		SStranscore.m_backup(mind,0) //Passed 0 means "Don't touch the nif fields on the mind record"

	life_tick++

	if(!client)
		if(++client_missing == 300)
			qdel(src)
		return
	else
		client_missing = 0

	if(parent_mob)
		return

	//If they're blinded
	if(ext_blind)
		apply_status_effect(/datum/status_effect/sight/blindness, 5 SECONDS)
		client.screen.Remove(GLOB.global_hud.whitense)
		overlay_fullscreen("blind", /atom/movable/screen/fullscreen/scaled/blind)
	else
		remove_status_effect(/datum/status_effect/sight/blindness)
		clear_fullscreen("blind")
		client.screen.Add(GLOB.global_hud.whitense)

	//If they're deaf
	if(ext_deaf)
		ear_deaf = 5
	else
		ear_deaf = 0

/mob/brain/caught_soul/hear_say()
	if(ext_deaf || !client)
		return FALSE
	..()

/mob/brain/caught_soul/show_message(msg, type, alt, alt_type)
	if(ext_blind || !client)
		return FALSE
	..()

/mob/brain/caught_soul/me_verb_subtle()
	set hidden = TRUE

	return FALSE

/mob/brain/caught_soul/whisper()
	set hidden = TRUE

	return FALSE

/mob/brain/caught_soul/face_atom(var/atom/A)
	if(eyeobj)
		return eyeobj.face_atom(A)
	else
		return ..(A)

/mob/brain/caught_soul/setDir(var/direction)
	if(eyeobj)
		return eyeobj.setDir(direction)
	else
		return ..(direction)

/mob/brain/caught_soul/say(var/message, var/datum/language/speaking = null, var/verb="says", var/alt_name="", var/whispering = 0)
	if(silent)
		return FALSE
	soulcatcher.say_into(message,src,eyeobj)

/mob/brain/caught_soul/eastshift()
	eyeobj?.eastshift()

/mob/brain/caught_soul/westshift()
	eyeobj?.westshift()

/mob/brain/caught_soul/northshift()
	eyeobj?.northshift()

/mob/brain/caught_soul/southshift()
	eyeobj?.southshift()

/mob/brain/caught_soul/allow_examine(atom/A)
	return TRUE

/mob/brain/caught_soul/emote(var/act,var/m_type=1,var/message = null)
	if(silent)
		return FALSE
	if (act == "me")
		if(silent)
			return
		if (src.client)
			if (client.prefs.muted & MUTE_IC)
				to_chat(src, SPAN_WARNING("You cannot send IC messages (muted)."))
				return
		if (stat)
			return
		if(!(message))
			return
		return custom_emote(m_type, message)
	else
		return FALSE

/mob/brain/caught_soul/custom_emote(var/m_type, var/message)
	if(silent)
		return FALSE
	soulcatcher.emote_into(message,src,eyeobj)

/mob/brain/caught_soul/resist()
	set name = "Resist"
	set category = VERB_CATEGORY_IC

	to_chat(src,SPAN_WARNING("There's no way out! You're stuck in VR."))

/mob/brain/caught_soul/set_typing_indicator(state)
	return eyeobj?.set_typing_indicator(state)

/mob/brain/caught_soul/update_mobility(blocked, forced)
	return ..(blocked, ALL)

///////////////////
//Verbs for soulbrains
/mob/brain/caught_soul/verb/examine_surroundings()
	set name = "Examine Surroundings"
	set desc = "Examine the interior of the soulcatcher you're in."
	set category = "Soulcatcher"

	to_chat(src, "Around you, you see...<br>[soulcatcher?.inside_flavor]")

/mob/brain/caught_soul/verb/ar_project()
	set name = "AR Project"
	set desc = "Project your form into Augmented Reality for those around your predator with the appearance of your loaded character."
	set category = "Soulcatcher"

	if(eyeobj)
		to_chat(src,"<span class='warning'>You're already projecting in AR!</span>")
		return

	if(!(soulcatcher.setting_flags & NIF_SC_PROJECTING))
		to_chat(src,"<span class='warning'>Projecting from this NIF has been disabled!</span>")
		return

	if(!client || !client.prefs)
		return //Um...

	eyeobj = new/mob/observer/eye/ar_soul(src, src, nif.human)
	soulcatcher.notify_into("[src] now AR projecting.")

/mob/brain/caught_soul/verb/jump_to_owner()
	set name = "Jump to Owner"
	set desc = "Jump your projection back to the owner of the soulcatcher you're inside."
	set category = "Soulcatcher"

	if(!eyeobj)
		to_chat(src,"<span class='warning'>You're not projecting into AR!</span>")
		return

	eyeobj.forceMove(get_turf(nif))

/mob/brain/caught_soul/verb/reenter_soulcatcher()
	set name = "Re-enter Soulcatcher"
	set desc = "Leave AR projection and drop back into the soulcatcher."
	set category = "Soulcatcher"

	if(!eyeobj)
		to_chat(src,"<span class='warning'>You're not projecting into AR!</span>")
		return

	QDEL_NULL(eyeobj)
	soulcatcher.notify_into("[src] ended AR projection.")

/mob/brain/caught_soul/verb/nsay(message as text|null)
	set name = "NSay"
	set desc = "Speak into the NIF's Soulcatcher (circumventing AR speaking)."
	set category = "Soulcatcher"

	if(!message)
		message = input("Type a message to say.","Speak into Soulcatcher") as text|null
	message = sanitize(message)
	if(message)
		soulcatcher.say_into(message,src,null)

/mob/brain/caught_soul/verb/nme(message as text|null)
	set name = "NMe"
	set desc = "Emote into the NIF's Soulcatcher (circumventing AR speaking)."
	set category = "Soulcatcher"

	if(!message)
		message = input("Type an action to perform.","Emote into Soulcatcher") as message|null
	message = sanitize(message)
	if(message)
		soulcatcher.emote_into(message,src,null)
