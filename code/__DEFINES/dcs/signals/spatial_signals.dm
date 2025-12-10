//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2025 Citadel Station Developers           *//

//* spatial signals piggyback off of component signals for their lifecycle management *//
//* thus they are actually translated into comsigs internally.                        *//
//* this works as long as their string keys do not collide with any local comsigs.    *//

/**
 * Sent before a particle burst is emitted omnidirectionally.
 * * args: (atom/emitter, datum/prototype/exotic_particle_projection/projection)
 */
#define COMSIG_SPATIAL_EXOTIC_PARTICLE_PRE_PULSE ""

/**
 * Sent before a particle burst is emitted in a targeted manner.
 * * args: (atom/emitter, datum/prototype/exotic_particle_projection/projection, atom/maybe_target, maybe_angle)
 * * if specified, angle is clockwise of north
 * * if specified, target is what they clicked on / are trying to attack
 */
#define COMSIG_SPATIAL_EXOTIC_PARTICLE_PRE_EMIT ""

#warn impl
