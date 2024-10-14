//* /obj/machinery/atmospherics pipe_static_flags; these never change at runtime *//

/// intended to connect with all layers, check for all instead of just one.
#define PIPE_STATIC_FLAG_ALL_LAYER (1<<0)
/// can only be built if nothing else with this flag is on the tile already.
#define PIPE_STATIC_FLAG_ONE_PER_TURF (1<<1)
/// can only exist at PIPING_LAYER_DEFAULT
#define PIPE_STATIC_FLAG_DEFAULT_LAYER_ONLY (1<<2)
/// north/south east/west doesn't matter, auto normalize on build.
#define PIPE_STATIC_FLAG_CARDINAL_AUTONORMALIZE (1<<3)
/// this is a border member.
///
/// * makes pipelines query this machine when rebuilding networks
/// * use this on things like valves or anything that conditionally joins two pipelines
///   together, but will not allow a pipeline to form across it.
#define PIPE_STATIC_FLAG_BORDER_MEMBER (1<<4)

//* /obj/machinery/atmospherics pipe_flags; these do change at runtime *//

/// we're currently joined to the network.
#define PIPE_FLAG_NETWORK_JOINED (1<<0)
/// queued for rebuild
#define PIPE_FLAG_REBUILD_QUEUED (1<<1)
