Knightfall5:
Core: ejectable matter-antimatter machine that jumpstarts the fusion process to instantly sustainable levels when you are ready to start the reactor. Fusion plasma contained in electromagnetic fields, the device making it has to be kept cooled down to function. Over a certain temperature they'll begin to degrade, causing fusion plasma to escape and damage the core. If it gets too damaged the stored antimatter would cause a large explosion.

Fuel: Would be fueled by machines that are fed fusion materials and can be adjusted to then pump this into the fusion plasma at certain rates depending on how much energy you want to produce. Different reactions produce more power at higher temperatures and need a minimum temperature to begin reacting at all. Starting reactions would be deuterium-deuterium, deuterium-He3, and deuterium-tritium like the RUST uses now. Mid-tier ones could move on to using materials like lithium and boron, while the end-game would be proton-proton fusion like what occurs in the core of a star. 

Cooling: Electromagnetic fields carry metal dust into space to cool off, and then bring it back into the ship in a loop. Yes, I have been playing a bit too much Terra Invicta lately and am stealing this idea from them. Better parts equals better electromagnetic fields that can hold more resources, and more exotic materials radiate heat better. Losing power would result in a steady loss of resources over time as it drifts off into space out of range. 

Mechanics: The hotter the reaction gets the more waste heat you need to deal with, but the more/hotter plasma you'll generate for the EPS network, and the more efficient the reactions you can use become, which then creates more heat you need to deal with. Once you achieve proton-proton fusion you'd be able to sustain it with relatively little resources due to how efficient the reaction is. Maybe integrate the crypto miner into the reactor to turn excess plasma into even more heat for points


Fol: 
Sorry but going to textwall for a suggestion. Since we already have R-UST as a well-established tokamak/magnetic confinement fusion engine, I feel like we should have an inertial confinement engine. This is going to be out of order to make (some) sense.
For "powering" it, you'd use lasers (they're already absurdly powerful in-universe anyways). I think mechanics here are pretty blank slate, how much flash-lamp/amplifier/mirrors/etc there needs to be, or the geometry of the engine, but I will point out this would make the main engine require a base amount of power stored to even start running (backup engine?). Would probably be the kind of thing you set up carefully, check well, and then flip on and hopefully don't watch it cut holes into the walls (rather than a slow-burn start of most engines that heat up etc.).
Now if we just did ICF that would be pretty robust and realistic etc but then doesn't meet the criteria (:meowsad:), so my suggestion is to give it a core mcguffin. Instead of shooting a fuel pellet in flight, give it a final lens/reflector/giant holhraum "Core" that the lasers fire into, and into which the fuel also goes, and out of which comes the Supercharged Plasma, and we just don't consider the specific physics and geometry of how you're actually compressing the fuel inside of it.
Obviously this would be the thing you eject and I guess we can assume it holds the fusing gas inside it for some time, so even if the lasers can be cut off instantaneously, it would still be hot and fusing for some as-of-now-indeterminate amount of time. You'd probably also want to focus the cooling on this, though maybe the big person-sized laser equipment should also get cooling, I don't know.
Finally, this could run continuously, since we're ignoring the critical design consideration of ICF and keeping aesthetics, but for the sake of such aesthetics I would argue the lasers be pulsed and the reaction constant. (Like emitter for the SM)
I think in that form, it should hit the goals:
You can have a default easy textbook configuration that's probably already set up and only needs securing the parts and putting the fuel Core and piping fuel into to run.
Expandable since in my mind you'd have some kind of puzzle or mechanic with the different laser stages/machines to either make it more energy efficient to run, or safer, or more powerful, etc?
Dangerous, in both a, should take some thought to change the setup and keep it able to be run safely (see: stray lasers, or just explode too much fuel at once on startup, or too little and it can't sustain it at all and just wastes your laser power, etc), and also should be dangerous in-operation if operated carelessly (core melts, etc).
Variable fuel level/power level. Almost inherent to using a thing that takes power to start, there would be a minimum power to run, but there's probably a window of energies you could run it at, with that window probably getting taller and more rewarding if (to go back to #2) expanded.
It needs the core mcguffin to become an ejectable concept, but, it is.
Last requirement also met as you just crush the fuel into a fusion plasma, there needs be no electricity generated.

Murphy:

!(https://media.discordapp.net/attachments/1071527583352627315/1071527785723613244/20221223_220610.png?width=1135&height=1513)

Mazian:

i want it to be extensible and flexible so people can fuck with it, but also make it simple and basically run itself
so engineers can baby it if they want for more power/preformance, but people who wanna do other stuff can fuck off

so the engine should be:
-easy to run, but also tweakable
-dangerous when damaged or messed with, but very powerful in the right hands
-probably the sole concern of engineering when things are going really, really, really badly.

so, i am thinking the engine has an integrity that's affected by the state of the plasma network to some degree
the plasma network at a certain point will begin to consume power to maintain itself if you're pushing it beyond certain limits
and the engine will take damage (maybe negatable through upgrades?) if you're running it too hard and something on the plasma network happens, like an emp, a conduit fails, etc
but it should be durable, and able to recover from a fuckup to some degree

so initial stages of fuckup would be like
minor power fluxuations, random EMPs focused on parts of the plasma network, a computer complaining on the engineering radio about stability issues
moving to 'the reactor is now taking damage',
the reactor has an automatic purge feature which can dump the entirety of the plasma network, at the cost of knocking the entire ship offline for a prolonged period of time
because ejecting the engine is like, ICly, a shipyard-level repair, so you want to avoid that at all costs; but the automatic core dump only works if the reactor is damaged and there's enough plasma to power [macguffin magnetic coils or something], but the dump also has a chance to fail because of damage (maybe add a manual process that's INSANELY DANGEROUS so if the automatic fails, someone can be a hero and dump the core)
anyway, ejecting the core is a last resort for good reasons, and dumping it is bad, but not unrecoverable, and an engineer's tool to handle 'we have fucked up' is going to be trying to minimize the reactor's output without shutting it down entirely (which, an unplanned shutdown would be very bad and maybe cause similar issues to a core dump) until the plasma network is stabilized

and the above would normally be an automatic process that tries to match output with demand

consider: ship-wide cooling loop, plasma 2 energy converters require cooling which goes to a big radiator, without it they'll begin to break down and cause issues with the plasma network

silicons-draft:

i should probably emphasize that this is open to modifications since this is just another idea built off all of the above

### initial stuff

- ship-wide cooling loops are epic but i don't know if we can do this performantly without negatively impacting everyone potentially
- core is meant to be able to be ejected (potentially stolen) and retrieved without incident
  - this is like, under optimal conditions. ejecting a core that's critical is different from just jettisoning it and putting it back
- plasma network is a lossy capacitor, not a battery. it loses power over time, as canonically it *takes* its own power to contain the plasma, and the more energy you have contained inside, the more energy it siphons to maintain containment
  - you **physically turn the engine up** when you need more power, e.g. during evasive ship maneuvers that sacrifice power for efficiency. fun!

### plasma network

- producers, consumers, capacitors, one-way transfer valves, limiter valves
- usually you wouldn't want capacitors at all since the network has natural capacitance and capacitors are still lossy (even if a bit less so)
- draw is averaged
- we don't necessarily want to punish overcharging as much as having super high power itself
  - though we can have machines that draw have an upper limit, and maybe vent a bit of heat / cause unpleasant effects if overheated
  - or better, just making running everything at high powers a bit inefficient and quite a bit dangerous
  - if we did punish for having high power itself (or really, at all) we'd have to be strategic where we put plasma lines so it seems bad but it doesn't actually just start killing everyone
  - it'd also give a reason to put plasma lines *away* from frequently travelled areas, so in maints/substations
- rapid unplanned disassemblies (so shit breaking)
  - ranging in effects from:
  - a nasty shock and some heat (enough to warm a small room to 50-60C) at low energies
  - a *lot* of heat
  - small explosions
  - large explosions that tear open the conduits around the line for violent decompositions
    - network has a throttling system for this, so you can't have a chain reaction
- overloads
  - plasma machinery breaking/being overloaded, like reactor fluxes, can travel down the network like a "packet" and cause all sorts of nasty effects like
  - flashes
  - radiation
  - small time emps
  - machinery hit by the packet doing more powerful versions of this

### core

5x5 object. we are going to need sprites.

- positioned above a big mass driver
- supporting machinery is attached to it
- contains the fusion reaction and serves as an intrinsic buffer of energy, radiation, and *mishaps*
- probably placed very close to the main sublight engine
  - we might even want a direct line for this purpose
- this shit is
  - **heavy**: only able to be pushed slowly by mechs, or multiple people. this is nullified if it's entirely on space tiles - in that case, you can drag it slowly solo. **theft of the engine is very possible.**
  - **climbable**: i'll code in ~~/datum/element/climbable~~ climbing at /obj level because we're not deranged enough to use elements for this shit
  - **highly valuable**: adminspawn only initially, we'll add a way to build it later (unless mazian vetos me by just coding in a way to do so lol)

### supporting machinery

supporting machinery attach to the core by being adjacent

they can be controlled via the control plane and linked consoles

#### plasma tap

- removes plasma from the core
- can inject plasma into the core but this is, obviously, usually not worth it
  - lol jumpstarting another ship?
- configurable rate

#### fuel injector

- takes fuel
- injects it
- shrimple as

#### control plane

- provides an interface for control
  - control consoles need this basically - link the ids together
  - in the Future we might wanna look into making it use network cables instead but for now don't worry about it that's a Silicons Insanity Project
- provides power to the core
  - if any core functions require power this is where it's input from.
  - this takes power from a wire. so yes, losing engine power bad
  - on the bright side, cutting the apc doesn't just fuck the engine now lol
  - **all supporting machinery receive power 

#### pipenet adapter

#### LASERS



### fuel

we have a few options here

#### solid / reagent fuel

- fuels are stored in containers
- containers are stored in injectors and, well, injected
- if/when we get plumbing we can use that for the reagents

#### gaseous fuel

- fuels are stored in canisters
- fuels can be piped into injectors
- fuels can also be put into the pipenet adapter but this is Potentially A Very Bad Idea

#### both

- both. we start off by coding solid / reagent fuels, then add in translations for it to become gas / become reagent from gas
- we should optimally make solid a thing first, this is minimal effort for minimum viable product

### startup, mechanics, reactions, output


### accidents

### ejecting

- core is next to a set of shutters
- we have a massive driver that can shoot it into space
- you **cannot easily** order a new core. lose it, and it's admin intervention
  - eventually when it goes off level it'll turn into an overmap entity, and you can send a shuttle out to grab it later.
  - eventually we may add a way to assemble a new core because we *do* like "we can rebuild it" mentality
- if machinery is not safely detached, you basically just rip machinery apart and it might even cause back-flow overloads or bad network behaviors.
- the core is **heavy**. ejecting it without any power at all is difficult.
