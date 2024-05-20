//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 silicons                             *//

GLOBAL_LIST_EMPTY(clockwork_subnets)

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

/datum/clockwork_subnet/process(delta_time)
	// micro-opt for avoiding an exponential if unnecessary.
	if(delta_time != 1)
		stored_power = round(stored_power * (1 - power_dissipation) ** delta_time, 0.01)
	else
		stored_power = round(stored_power * (1 - power_dissipation), 0.01)

/**
 * tl;dr "our level is no longer a real level can everything gtfo please"
 */
/datum/clockwork_subnet/proc/evict_everything()
	#warn impl

/**
 * give power to the network
 */
/datum/clockwork_subnet/proc/provide_power(kj)
	stored_power += kj

/**
 * draw power from the network
 *
 * @return amount drawn
 */
/datum/clockwork_subnet/proc/draw_power(kj)
	. = min(stored_power, kj)
	stored_power -= kj

/**
 * draw power from the network; draws nothing if we don't have enough
 *
 * @return amount drawn
 */
/datum/clockwork_subnet/proc/draw_checked_power(kj)
	if(stored_power < kj)
		return 0
	stored_power -= kj
	return kj
