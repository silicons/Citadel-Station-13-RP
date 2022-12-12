/datum/controller/subsystem/networks
	/// network lookup by id
	var/static/list/network_lookup = list()
	/// node lookup by id
	var/static/list/node_lookup = list()

/datum/controller/subsystem/networks/proc/assign_datanet_id()
	#warn impl

/datum/controller/subsystem/networks/proc/assign_datanode_id()
	#warn impl

/datum/controller/subsystem/networks/proc/register_datanet(datum/data_network/network)

/datum/controller/subsystem/networks/proc/register_datanode(datum/data_node/node)

/datum/controller/subsystem/networks/proc/dispose_datanet(datum/data_network/network)

/datum/controller/subsystem/networks/proc/dispose_datanode(datum/data_node/node)
