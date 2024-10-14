#warn CF_ATMOS_PIPENET_VISUALS

/datum/pipenet
	/// all pipelines in us
	var/list/datum/pipeline/pipelines = list()
	/// are we queued for update?
	var/update = TRUE

/datum/pipenet/Destroy()
	STOP_PROCESSING_PIPENET(src)
	for(var/datum/pipeline/line_member in line_members)
		line_member.network = null
	for(var/obj/machinery/atmospherics/normal_member in normal_members)
		normal_member.reassign_network(src, null)
	gases.Cut()  // Do not qdel the gases, we don't own them
	return ..()

/datum/pipenet/process(delta_time)
	update = FALSE
	reconcile_air()

/datum/pipenet/proc/build_network(obj/machinery/atmospherics/start_normal, obj/machinery/atmospherics/reference)
	//Purpose: Generate membership roster
	//Notes: Assuming that members will add themselves to appropriate roster in network_expand()

	if(!start_normal)
		qdel(src)
		return

	start_normal.network_expand(src, reference)

	update_network_gases()

	if((normal_members.len>0)||(line_members.len>0))
		START_PROCESSING_PIPENET(src)
	else
		qdel(src)

/datum/pipenet/proc/merge(datum/pipenet/giver)
	if(giver==src) return 0

	normal_members |= giver.normal_members

	line_members |= giver.line_members


	for(var/obj/machinery/atmospherics/normal_member in giver.normal_members)
		normal_member.reassign_network(giver, src)

	for(var/datum/pipeline/line_member in giver.line_members)
		line_member.network = src

	update_network_gases()
	return 1

/datum/pipenet/proc/update_network_gases()
	//Go through membership roster and make sure gases is up to date

	gases = list()
	volume = 0

	for(var/obj/machinery/atmospherics/normal_member in normal_members)
		var/result = normal_member.return_network_air(src)
		if(result) gases += result

	for(var/datum/pipeline/line_member in line_members)
		gases += line_member.air

	for(var/datum/gas_mixture/air in gases)
		volume += air.volume


//*          Reconciliation        *//

/**
 * equalize all airs inside us
 *
 * * process reactions as well
 * * does not take group_multiplier into account, as we're entirely operating in pipes!
 */
/datum/pipenet/proc/reconcile_air()
	// special equalization-reaction proc
	var/list/gases = list()
	var/thermal_energy = 0
	var/heat_capacity = 0
	var/volume = 0

	var/list/datum/gas_mixture/collected = list()

	// collect
	for(var/datum/pipeline/pipeline in pipelines)
		var/datum/gas_mixture/line_air = pipeline.line_air
		var/line_heat_capacity = line_air.heat_capacity_singular()
		collected += line_air
		for(var/gas in line_air.gas)
			gases[gas] += line_air.gas
		thermal_energy += line_heat_capacity * line_air.temperature
		heat_capacity += line_heat_capacity
		volume += line_air.volume

		for(var/datum/gas_mixture/mixture in pipeline.edge_airs)
			var/mixture_heat_capacity = mixture.heat_capacity_singular()
			collected += mixture
			for(var/gas in mixture.gas)
				gases[gas] += mixture.gas[gas]
			thermal_energy += mixture_heat_capacity * mixture.temperature
			heat_capacity += mixture_heat_capacity
			volume += mixture.volume

	// if we're empty, bail
	if(!heat_capacity)
		return

	// combine
	var/datum/gas_mixture/total = new(volume)
	total.gas = collected
	total.temperature = thermal_energy / heat_capacity

	// react
	total.react()

	// average out gases so that we can multiply it out later with one operation
	for(var/gas in total.gas)
		total.gas[gas] /= volume

	// send back out to collected
	for(var/datum/gas_mixture/out_air in collected)
		out_air.gas = total.gas.Copy()
		out_air.temperature = total.temperature
		out_air.multiply(out_air.volume)
