//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers          *//

#warn woo

//*                         particle polarity datatypes                            *//

#define EXOTIC_POLARITY_DATATYPE_STRING "string"
#define EXOTIC_POLARITY_DATATYPE_NUMBER "number"
#define EXOTIC_POLARITY_DATATYPE_COLOR "color"
#define EXOTIC_POLARITY_DATATYPE_TOGGLE "toggle"

#warn DEFINE_BITFIELD_NEW

//*                          particle qualities                                    *//
//*                                                                                *//
//* these are k-v (key-value) flags that describe something                        *//
//* unlike effects, these do not directly act on things themselves,                *//
//* instead, the receiving entity can handle this, and certain machines            *//
//* (like a transmitter that can send messages interacting with psionic-transmit)  *//
//* may require certain qualities to do certain things.                            *//

/// particle can transmit data psionically, usually to a person
///
/// * high value = can transmit clear messages
/// * low value = can transmit only garbled messages
#define EXOTIC_PARTICLE_QUALITY_PSIONIC_TRANSMISSION "psionic-message"
/// particle can cause (positive or negative) disruption via psionic effects
///
/// * value is disruption power
#define EXOTIC_PARTICLE_QUALITY_PSIONIC_JAMMING "psionic-jamming"
