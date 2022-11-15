/**
 * handles language translation
 */
/datum/translation_context

/**
 * returns if we can translate something
 * partial/wrong translations are still translations
 */
/datum/translation_context/proc/can_translate(datum/language/L, atom/movable/speaker)
	CRASH("not implemented")

/**
 * translates a message
 * **warning**: translation doesn't always handle mid-message spans/formatting
 * we split words using the " " space character.
 *
 * should have **zero** side effects
 *
 * @return the translated message
 */
/datum/translation_context/proc/translate(datum/language/L, atom/movable/speaker, msg)
	CRASH("not implemented")

/**
 * attempts to translate a message
 * has possible side effects like learning the language gradually
 */
/datum/translation_context/proc/attempt_translation(datum/language/L, atom/movable/speaker, msg)
	CRASH("not implemented")

/**
 * todo: for future implementation
 * directly modifies
 */

/**
 * directly translates languages; it either succeeds or fails
 */
/datum/translation_context/simple
	/// classes we can translate
	var/translation_class = NONE
	/// lazy assoclist of ids we can translate (secondary lookup)
	var/list/translated_ids

/**
 * variable language translator
 *
 * it can either fully translate,
 * fail to translate,
 * or partially translate
 */
/datum/translation_context/variable
	/// classes we can translate directly
	var/translation_class
	/// lazy assoclist of ids we can translate (secondary lookup)
	var/list/translated_ids

/**
 * copy all our knowledge to another if it can receive it
 */
/datum/translation_context/variable/proc/copy_knowledge(datum/translation_context/variable/other)
	other.receive_knowledge(src)

/**
 * copy all our knowledge to another if it can receive it
 */
/datum/translation_context/variable/proc/receive_knowledge(datum/translation_context/variable/giver)

/**
 * variable language translator
 *
 * it can either fully translate,
 * fail to translate,
 * or partially translate.
 *
 * it will learn over time supported languages.
 */
/datum/translation_context/variable/learning
	/// classes we automatically try to learn
	var/translation_class_learnable
	/// lazy assoclist of ids we can learn (secondary lookup)
	var/list/learnable_ids

/**
 * translates everything
 */
/datum/translation_context/omni

/datum/translation_context/omni/can_translate(datum/language/L, atom/movable/speaker)
	return TRUE

/datum/translation_context/omni/translate(datum/language/L, atom/movable/speaker, msg)
	return msg

/datum/translation_context/omni/attempt_translation(datum/language/L, atom/movable/speaker, msg)
	return translate(L, speaker, msg)
