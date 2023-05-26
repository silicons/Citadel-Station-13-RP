
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

with this in mind, we'll probably do the following:

- single point pool for traits / whatever. starting amount determined by species
- traits are for global/intrinsic modifiers that can't be "taken away" from someone. for now, it'll also have limb/whatever specific physiology stuff, but in the long term, we want traits and augments to be different
  - in-fact, even stuff like bio-reactors will eventually be transitioned to the composition of someone's organs.
- traits have a list of mutually-exclusivity enums, allowing you to designate certain groups as "pick one of this".
- traits can also have species whitelist / blacklists, and species has the same for traits.
  - we'll probably need a better system for replacing traits with their species variants: see, Auril flight
  - species can have a list of "forced" traits much like languages that are always taken
    - cultures cannot, unlike with languages, as it doesn't make sense to overload cultures even more instead of just having snowflake cultures be subspecies.
    - cultures: learned opinions. species: physicality & physiology.

traits will come with a few classes:

- **intrinsic / stat modifiers**: multiplicative modifiers to what someone's capabilities are.
  - for "base" / core stats as well as global modifiers to damage/speed, this must cap out at +- 15%. e.g. if someone's already taking 20% more damage from burn, it'd be 1.2 * 1.15 = 1.38.
  - these generally apply multiplicatively, hence why they're so hardcapped
    - furthermore, this prevents too much minmaxing.
- **features**: things that are less quantitative and more qualitative, or at least feel that way
  - general: more forgiveness to things like genetic/radiation/augmentation damage/capacity overrun, better senses, colorblindness, slightly better nightvision, claws, glowing, etc
  - synthetics: bio-reactors, higher charging capacity, inbuilt sensors, etc
  - organics: metabolism modifiers, chemical incompatibilites / dependencies, etc
  - a lot of these are better off as hardware/augmentation/organs later
- **uniques**: things that greatly change the paradigm of what someone's character is, can do, or experiences.
  - each species has a separate **unique limit**
  - flight - would still require wings later on
    - honestly i want to murder flight in its current form but we'll leave it alone i guess
  - vetalan
  - species uniques / exclusions like:
    - no flying prometheans but they can glow superbright, be limited stargazers/luminescents, have species modifications, etc
  - ngl these are probably due to be cut. most of these can easily just be subspecies except for vetalans and we really don't want to overload uniques with stuff that **should** be a subspecies thing.
