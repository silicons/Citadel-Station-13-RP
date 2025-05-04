MOVABLE_WITH_ADJACENCY_GROUP(/obj/structure/table/adj_test, test_group, )
/obj/structure/table/adj_test

/obj/structure/table/adj_test/movable_adjacency_group_join(datum/adjacency_group_holder/holder, datum/adjacency_group/group, adjacent_dirs, adjacent_overlap)
	maptext = MAPTEXT_CENTER("[length(group.holders)]-[adjacent_dirs]-[adjacent_overlap]")

/obj/structure/table/adj_test/movable_adjacency_group_merge(datum/adjacency_group_holder/holder, datum/adjacency_group/staying_intact, datum/adjacency_group/group/merging_in, adjacent_dirs, adjacent_overlap)
	maptext = MAPTEXT_CENTER("[length(group.holders)]-[adjacent_dirs]-[adjacent_overlap]")

/obj/structure/table/adj_test/movable_adjacency_group_leave(datum/adjacency_group_holder/holder, datum/adjacency_group/group, adjacent_dirs, adjacent_overlap)
	maptext = null

#warn delete when done testing groups
