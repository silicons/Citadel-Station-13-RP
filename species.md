
# species

blah blah im not even trying at this point here's your design doc for the thing i doubt anyone will code other than me

- **Implementation of all of these can technically be separate, other than biologies needing to be injected before all of them.**
- **Implementation of 'traits' rework can be entirely separate if needed.**
- this basically lets us split up a massive project into chunks of updates to appease players without having to do it all at once.

## biologies

- organic
- synthetic
- nanoswarm
- chimeric
- promethean

you can guess what each of these is

these all have different default handling of health, to be done by (undecided method)

## physiology

limbs all have a biology.

- /datum/global_physiology at the /carbon level
- /datum/local_physiology at the /organ/external level

/datum/physiology_modifier now has target biologies to target.

only limbs of that biology get it applied to their local physiologies.

## brains

everyone is housed in their brain (duh)
brains have a biology.
this biology determines what your brain can 1. survive in and 2. control

## species

species (and potentially whitelisting in the case of protean/chimera) now determine what primary physiology you can pick

this is abstracted, you aren't actually picking your physiology, you're basically picking your primary physiology + brain type

this in turns determines what limbs you can pick.

## organs

too complex to talk about in this draft. tl;dr composition and organ biologies and all kinds of yikes abstraction levels

## augmentations

for all biologies, you can have a /datum/robolimb augmentation.

this does different things on different biologies (e.g it shields nanoswarm less than say, chimera)

this basically represents you being a cyborg where most of the outer bits of your body are a prosthetic but you still have blood and flesh / whatever underneath.

this is different from synthetic - normal people can have entirely prosthetic limbs or augmented limbs.

in most cases, people would have fully synthetic limbs and augmented chest/head, as people (not MMIs/positronics) still need their organs to live.

health system wise (for later): augmentations change outside physiology but not inside, and how we model this is you can still take "proper" deep tissue / organ damage on augmented areas, but the outside layer basically acts like an overshield. however, having your arms half broken is obviously not great for you. as an example: proteans just fully have this as an overshield, but they can't really operate with this outer layer broken unless they actively eject it and fall back onto their nanoswarm - which is by far, an inferior physiology to fully prosthetic augmentations.

## Traits / Quirks / Etc

and now the moment you've all been waiting for:

### custom species

is removed as a species datum.

### traits, points, augments, features

customization on citadel rp will always be a priority at a certain level - a lot of our niche is focused on this, and, frankly, if it makes the player feel better without causing a ton of issues, `why not`?
