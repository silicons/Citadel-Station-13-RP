//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

//* /datum/simulation_core - hypervisor flags *//

/// narrate, build world images, etc
#define SIMULATION_CORE_HYPERVISOR_WORLD (1<<0)
/// control / add / delete controller mobs
#define SIMULATION_CORE_HYPERVISOR_PUPPET (1<<1)
/// evict residents that can be evicted
#define SIMULATION_CORE_HYPERVISOR_EVICTION (1<<2)
/// transfer residents to another simulation core
#define SIMULATION_CORE_HYPERVISOR_TRANSFER (1<<3)
/// control passthrough / simulation options
/// * e.g. "pass outside sound in", "allow projection"
#define SIMULATION_CORE_HYPERVISOR_ENVIRONMENT (1<<4)
/// control non-controller mobs' flags
/// * does not allow acting/speaking as a player mob
/// * for stuff like controlling if they're allowed to project
#define SIMULATION_CORE_HYPERVISOR_IO (1<<5)
/// accept / deny entry
#define SIMULATION_CORE_HYPERVISOR_FIREWALL (1<<6)
/// see all residents, including hidden ones, and other potentially hidden stats
#define SIMULATION_CORE_HYPERVISOR_INSPECTION (1<<7)

#warn declare / assign bitfield if needed
