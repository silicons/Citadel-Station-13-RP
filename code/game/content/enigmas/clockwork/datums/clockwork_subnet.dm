//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 silicons                             *//

/**
 * tracks a specific segment of the hierophant network
 * this is generally shared across the same planet/overmap entity/etc
 * it's possible for the whole of the game world to be only one
 *
 * this is so power systems can simulate subdivision / distance losses
 * it's assumed resouces like power are quantum-entangled on the same subnet
 *
 * across subnets, resolve procs are used to establish linkages
 */
/datum/clockwork_subnet
	/// name
	var/name
	/// stored power in kilojoules
	/// because we're not animals here and don't measure storage in watts you heathens
	///
	/// * you might run into precision issues if doing stuff with fractionals. try to have machines emitting multiples of 0.5 kj.
	var/stored_power
	/// power dissipation fraction per second
	///
	/// this is a % of current power.
	/// 0.01, means lose 1% of current power per second.
	var/power_dissipation = 0.005 // 0.5% = 1 MW input --> can only hold *way less than* 200MJ.

	/// sigils, except for
	/// * transmission sigils
	var/list/obj/effect/clockwork_sigil/sigils = list()
	/// transmission sigils
	var/list/obj/effect/clockwork_sigil/transmission/transmission_sigils = list()
	#warn hook

	/// machinery, except for
	/// * stargazers
	var/list/obj/machinery/clockwork/machines = list()
	/// stargazers
	var/list/obj/machinery/clockwork/stargazer/stargazer_machines = list()

	/// all integration cogs
	var/list/obj/item/clockwork_cog/integration_cogs = list()
	#warn hook
