/datum/keybinding/item
	category = CATEGORY_ITEM
	weight = WEIGHT_ITEM

/datum/keybinding/item/unique_action
	full_name = "Unique Action"
	name = "item_unique_action"
	description = "Trigger the unique action on the item you're holding, if applicable."
	hotkey_keys = list("C")

/datum/keybinding/item/unique_action/key_down(key, client/user)
	. = ..()
	#warn finish
