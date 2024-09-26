//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

/datum/datachain_context
	/// kkv stores
	///
	/// * format: key = list(key = value)
	var/list/keyed_maps
	/// stacks
	///
	/// * format: key = list(v1, v2, ...); list[list.len] is top element.
	var/list/keyed_stacks

	/// max map size
	var/max_map_size = 64
	/// max map amount
	var/max_map_amount = 5
	/// max stack size
	var/max_stack_size = 128
	/// max stack amount
	var/max_stack = 5
