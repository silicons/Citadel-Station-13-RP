
proc/dd_sortedtextlist(list/incoming, case_sensitive = 0)
	// Returns a new list with the text values sorted.
	// Use binary search to order by sortValue.
	// This works by going to the half-point of the list, seeing if the node in question is higher or lower cost,
	// then going halfway up or down the list and checking again.
	// This is a very fast way to sort an item into a list.
	var/list/sorted_text = new()
	var/low_index
	var/high_index
	var/insert_index
	var/midway_calc
	var/current_index
	var/current_item
	var/list/list_bottom
	var/sort_result

	var/current_sort_text
	for (current_sort_text in incoming)
		low_index = 1
		high_index = sorted_text.len
		while (low_index <= high_index)
			// Figure out the midpoint, rounding up for fractions.  (BYOND rounds down, so add 1 if necessary.)
			midway_calc = (low_index + high_index) / 2
			current_index = round(midway_calc)
			if (midway_calc > current_index)
				current_index++
			current_item = sorted_text[current_index]

			if (case_sensitive)
				sort_result = sorttextEx(current_sort_text, current_item)
			else
				sort_result = sorttext(current_sort_text, current_item)

			switch(sort_result)
				if (1)
					high_index = current_index - 1	// current_sort_text < current_item
				if (-1)
					low_index = current_index + 1	// current_sort_text > current_item
				if (0)
					low_index = current_index		// current_sort_text == current_item
					break

		// Insert before low_index.
		insert_index = low_index

		// Special case adding to end of list.
		if (insert_index > sorted_text.len)
			sorted_text += current_sort_text
			continue

		// Because BYOND lists don't support insert, have to do it by:
		// 1) taking out bottom of list, 2) adding item, 3) putting back bottom of list.
		list_bottom = sorted_text.Copy(insert_index)
		sorted_text.Cut(insert_index)
		sorted_text += current_sort_text
		sorted_text += list_bottom
	return sorted_text


proc/dd_sortedTextList(list/incoming)
	var/case_sensitive = 1
	return dd_sortedtextlist(incoming, case_sensitive)


/datum/proc/dd_SortValue()
	return "[src]"

/obj/machinery/dd_SortValue()
	return "[sanitize_old(name)]"

/obj/machinery/camera/dd_SortValue()
	return "[c_tag]"

/datum/alarm/dd_SortValue()
	return "[sanitize_old(last_name)]"


//creates every subtype of prototype (excluding prototype) and adds it to list L.
//if no list/L is provided, one is created.
/proc/init_subtypes(prototype, list/L)
	if(!istype(L))	L = list()
	for(var/path in subtypesof(prototype))
		L += new path()
	return L

//creates every subtype of prototype (excluding prototype) and adds it to list L as a type/instance pair.
//if no list/L is provided, one is created.
/proc/init_subtypes_assoc(prototype, list/L)
	if(!istype(L))	L = list()
	for(var/path in subtypesof(prototype))
		L[path] = new path()
	return L
