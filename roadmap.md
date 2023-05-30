# Development Roadmap

<style>
.ui-infobar, #doc.markdown-body { max-width: 75%; }
</style>

- Last update: 7/22/21
- **Any ideas, especially to increase departmental interaction and integration, are appreciated.**
- When necessary, we can translate this document almost line by line into GitHub Projects, for an actual project tracking board for the RP server.
- This is not strictly code-related. "Development" defines to code, administration, and lore here, not just "code features". Code is just one piece of the puzzle.

## THIS IS OUT OF DATE READ THIS

If you're stumbling on this I haven't updated it in a literal year.
Some of this stuff is either already done, indev, planned, etc

Our primary hackmd at @citadelstation13rp has more up to date stuff.

This document is left up to serve as a general idea of the *feel* of what we work on/are going towards.

It is no longer an accurate plan, since the only plan our server has ever had is not having much of a plan and more of an abstract direction and feel.

## Summary

- Tracks state of current/semi-current projects as well as some ideas/plans for various things
- **Anyone wanting to contribute, please read a good bit through this and see if you're willing to help draft or design anything.**
- Nothing is set in stone unless otherwise stated or already WIP
- For both ports and refactors/in house things, **the more shared code with Citadel Main, the better.** Anything generic enough to be used on both servers (jobs, departments, maploaders, inventory systems, mobcode) should be shared. It heavily reduces maintenance overhead, as any improvements on either server can be transferred over and unified interfaces make coding features easy.
- Anything with a (name) after it means that person is either working on it right now, or is organizing the system.
    - Much like with lore, unless a PR is already up, you don't need to yield for someone if you want to do something instead, although many times, that person likely has the experience necessary to operate/create that system with relative ease.

## "Current Projects"

- ~~"hardsync" is ongoing (silicons). We won't be syncing literally everything because we've deviated so far, but most things from virgo needs porting.~~
- ~~Getting Tethermap improved as *needed*~~
- **Driving up thematics for HRP - immersion, atmosphere, environment**
- Readding old exploration planets to provide filler while we work on things.
- Getting departmental improvements
- Preparing for light antagonism trials

## Next Big Thing/Development Direction
- ~~TBA, planet exploration-based map with an unique take on overmaps. If you want to see the brief, semi-technical writeup, it's on the hackmd under the same org that this document is under, but more information will be released as things fall into place.~~
    - ~~If you want to help make this faster (or atleast faster to find out if this is feasible), help with major ports (or refactors, if you're extra brave).~~
    - on hold due to byond being horrible
- ~~Planetstation as our permanent home~~
    - Current planet map: Atlas
    - Still need a shipmap, we really do want to go to overmaps at some point again.
- The server's direction will generally be going towards **HRP exploration/intrigue**
    - Eventual addition of **HRP "antagonists"**.
    - **Exploration** does not refer to the department, but to the concept. The department's central role in this will, infact, be lessened over time by ongoing processes and refactors, to be the dedicated team for spearheading it, but not the only ones involved in it.
- [Science System](https://hackmd.io/TOw18lhATIqBSvs13C6ljA)

## Frameworks/Design Flows - By Area

### General
~~- Lore codex system (silicons)
    - Customizable, disk-loadable lore, allowing for secret documents to be discowered ICly
    - Codex will contain all common pages, synced to current lore documents on wiki~~
- Get ingame species selection fluff up
    - Add stuff like vatgrown/spacer/etc variants, good for variety IMO.

### Exploration
- Readd Triumph planets as overmap filler until long-term plans are done.
- **Scan-points**
    - Refactor catalogue system (silicons)
        - Do NOT require datums for "simple" catalogues. Only items requiring more than one catalogue should require datum typepaths (NOT new datums, just assign typepath, efficient lookups without more memory) for "catalogue_data" which then is read from a global cache.
        - Main block/parry data system for reference, highly memory-efficient
    - Most onstation items should not give catalogue points
        - Give exploration a 600 point thing in PF locker
    - All catalogue items other than things like mobs should be fast to scan but give little points
        - Emphasis on lore/story, emphasis on scanning a lot of items to gain access to the information
    - Cataloguers should have a network, techweb-style. All cataloguers should share the same information
        - **DO NOT** duplicate points for however many people are holding them
        - Central point bank to withdraw from to redeem things. Logs who does it to prevent abuse ICly and OOCly.
        - No more "wait for everyone to get here" before scanning. This is stupid.
    - **Add catalogue entries to most things you can find, rather than just literally spiders crystals and alien tech.**
- Xenoarch refactor will make explo have a bit more fun, probably
    - Add lots of stuff to dig up in exploration zones
- **Port main identification components**
    - Locked exploration loot with partial/no/malfunctioning functionality until either
        - Researched
        - Used enough to auto unlock
        - Abuse the SHIT out of component signals, upgrade identification components to allow knowledge gain through usage (silicons)
        - Per person when not fully unlocked via R&D scanning? TBD, code overhead, etc, potentially handleable (silicons)
        - Anomaly scanner minigame used to fully unlock items - finally, a reason to go through that awful process
            - See xenoarch section
- Exploration gear/weaponry is already normalized, no worries there
    - A final, combat balancing pass when we start focusing on that in the future will bring everything in line (another draft will be required to describe combat paradigms, or it'll be added to this one)

### Security
- Reactive department - not much here
- Port stun vs shock vs kill mode for energy guns/carbines
- Aurora had something nice where stun weapons relied on electrocute_act backend. Would be useful to unify conductivity defenses.
- As much as it pains me, reconsider if disablers are needed vs tasers. Reason: Disabler requires energy defense (armor flag), while tasers use conductivity.

### Cargo/Mining
- **Economy**
    - Supply points replaced with thalers
    - Station main vault contains bank terminal, like on Main
        - Can deposit/withdraw to accounts from here
        - Logged access for IC audits and bank heists!
    - **Scale money per person with station account**
    - Decide on auto-paycheck, goon style, with 15 minute intervals, or current static/fixed amount
        - Current is probably better to balance, auto paychecks are more fun
        - Current is also far more realistic which is good here
    - Regardless of the above, **cargo** specifically will have a static income equivalent to around the same purchasing power they have now
        - Exports will be easier to do yet less powerful than now (no selling 350 plasma sheets to not have to do anything for the rest of the round). ~~Alternatively, make ores not literally so abundant you can just sell 350 phoron sheets without a single fuck given~~
    - Income focused on non-auto, semi-static, centralized/gameloop induced methods like cargo points, research shipping, engineering PTL, etc etc (??? more later)
- **Trading**
    - trade pads a la nebula
    - overmap + planet map integration (?) 
    - more on this soon (tm)
    - Hook it to whatever lore system flavor of the month we decide on
- **Datumized exports**
    - Everything should be exportable
        - Generalized export datums for materials in something, as well as chemicals
        - k-elasticity to prevent spamming one item
            - Directly exporting sheets will have low elasticity
            - Chemical exports will have very high elasticity, or shouldn't exist outside of bounties
        - Specific things having export datums that also modify generic material exports to either prevent materials from being taken into account, or augment how much it is
- **Cargo bounties**
    - Randomly generated bounties that gets cargo to acquire items to ship off for money into their account
    - Hard to make this make sense ICly but I'm sure we'll find a way, gives cargo something to do too
- **Drop pods**
    - Port this from /tg/
    - Holy shit, these are so fun, why don't we have them?
    - Totally won't be used to adminbomb.
    - Express order console - order 10x crate, droppod only
    - Unfortunately this'll be adminbus only on non planet maps, and on planet maps, should still have a higher delay than instant, for realism (tm) purposes
- **Factions**
    - Multiple suppliers
        - TSCs selling weapons, suits, etc
        - **Every TSC having their own gimmick**
            - The H one that I can't spell making good, reliable weapons but average to poor everything else
            - Vey-Med isn't going to sell a lot of weapons but their medical gear, although pricey, would be very high quality
            - NT, the station's company (set in map define for modularity), having a discount on average value because the station is part of NT (alternatively, we could even have station budget + supply points being internal requisition, but that's more complicated), but not having the *best* in everything
    - **Station relations with suppliers tracked** - based on how much you buy, time elapsed, etc
        - **Only if we have persistence.**
    - Could even tie into codex/ATC systems.
        - Passing ships traders, etc, although this is a serious, serious stretch goal.
- Mining
    - Goal - clickspam mining should be more effective than set-and-wait mining, but shouldn't be the only way to do well
    - Perlin generation for ore is inbound, saving absolute truckloads of memory + init generation time
    - Buff static drills a **lot**
        - Explosions only generate around 1/20 of the available ore in an area, per explosion
        - High-powered TTVs and seismic charges will peel off multiple layers
            - Seismic charges should probably be highly effective
            - TTVs only near center
        - **Static drills should have a near screen wide radius**
            - You're exchanging set and forget for speed
    - Slightly nerf ore amounts from blasting normal rock but still make it viable
    - Make a full evaluation of ore scarcity vs machine efficiency
        - How I did it on tg with tier 4 being 60% cost is good, everything else should rely on mat scarcity
        - This means efficiency upgrades are important but are not the literal end all, and makes balancing material usage easier
        - Currently, ore is a little abundant. The argument is so miners can be done with their job, but if we do proper balancing for static drills and make it a viable alternative, *maybe it shouldn't be necessary to have 1000 of every sheet, every round?*
        - This is all heavily WIP, we don't want to make miners have to spend hours and hours every round to get a "nominal" amount
    - Maybe some minigames to make it less boring for the click-spam players beyond just "I got more ore"
    - See xenoarch

### Engineering
- Major refactor - Atmospherics
    - Thermaldynamics will no longer be broken willy-nilly
    - Not going to outline the rest of the changes, but rest assured, it will be *!fun!.*
- Major port - Radiation
    - tg radiation allows for contamination and wave behavior
    - Lead lined windows that block radiation
- Port bay networks and computers but that's about it
- Engineering is a reactive department, like medbay
- Nebula materials port (eventually) will naturally give engineering some more fun too
- For now, **ensure as many things as possible are constructable and deconstructable.** This means engineering can actually build and teardown as necessary.

### Medical

#### [Medical](/wrAMdjiYTJC5SPjJ9anA-A)

- ~~Major port - Brainmed - covers most possible needed reworks, as well as providing more engagement~~ SEE THE LINK ABOVE FOR THE NEW DOCUMENT
    - The rest of the department's dynamic requirements will come from roleplaying and in-round circumstances. We can make the health system interesting and revival always possible, but if nothing bad ever happens and no one ever comes in for exams, medical will not have anything to do, simple as that.
- Ensure resleeving as a system (where resleeving is defined by ckey-transferring a ghost into a body either via backup or via mirror) is never **required** as long as you have the brain - no matter how convoluted, complicated, or how difficult/ICly unreasonable it is to revive someone without
    - Adding surgeries for all damage types to be repaired
    - Ensuring all organs can be repaired with enough effort
    - "We can rebuild him, we have the technology" is in full effect here - not requiring resleeving always gives medical a way, ICly, to restore someone
    - Gives a path for future balancing regarding dying in-game.
    - **Nanite Chamber revival for Proteans** - the only unrevivable species at the moment
        - Port main's chambers and control computers for this
        - Require 25 steel base, as well as 10 gold/silver + 5 verdantium/durasteel if orchestrator is missing, and 5 plasteel/mhydrogen/diamond if refactory missing. **Posibrain missing = no revival in round. Proteans CANNOT be mirrored/resleeved.**
- Speed up tend-wound type (damage fix) surgeries a bit
    - Lower limb maxium health to 350-500 for head/torso/groin instead of 800+
- Virology
    - This is one of the few featuresets, along with ideas for cargo, xenoarch, R&D, - okay actually there's a lot, that can be shared with main if done modularly enough
    - Entirely rework virology. I believe it to be a fun system when done right.
    - Spread types (bitflag, can have more than one, with strengths)
        - Touch (direct)
        - Fluid (spreads to blood/vomit/reagents touched)
        - **Colonizing** - colonizes items and other things a victim touches. Has strengths, decays, etc - sneezing on something for 5 minutes is going to make it far more of a threat when someone picks it up than if you lightly bumped into a door.
        - Airborne (range() with permeability checks and rng)
        - Direct (always exists, blood injection)
        - For all of these, options to have "resistance" checks - being attempt-infected multiple times heavily decreases your chances of avoiding it.
    - Refactors
        - Globally cache viruses by ID for the love of all that is holy, do not generate per mob instances
        - When a mob is infected, **track necessary state data like progression, not duplicate the virus.**
        - Same for object colonizing.
    - Symptoms
        - **Ideas are required for a symptom and progression system.**
    - Cures
        - **Ideas are required for a cure/treatment/suppression system.**
    - In both of the above, /tg/'s is too gamey, while old bay's is just flat out boring.
    - Stats
        - Infectable mobs (biotype flags)
        - Resistane data
        - Strength, progression
        - Stealth data (hide scanner, hide bodyscanner, hide disease analyzer - third should be nearly nonexistant because that means it's not scannable at all)
        - Per-mob tracked state data to provide variance
- Chemistry
    - Add more pyrotechnics/harmful/helpful/utility reactions
        - Goon/goofchem pyrotechnics?
    - More poisons, specialized medicines (not replacing surgery) post-brainmed.
### Science
* Xenoarchaeology
    - Refactor xenoarch completely
        - Componentize finds, large and small, entirely
        - Datumize anomaly effects
            - Allow applying to both small finds and large finds
            - Hopefully componentize the holder object to not require specific subtypes for this to work.
        - Small find = item finds, not necessarily small in size
        - Large find = structure/machine
        - Fix the "anomaly batteries"
            - Harvest particles from things to charge.
            - Apply effect in a structured/targeted/controlled way.
    - Small finds
        - See exploration section - items that are useful but require unlocking/experimentation to use
        - Aesthetic-only items
        - Can have anomaly effects generated on it, regardless of what kind of item it is
        - Rarity generation - functional items with anomaly effects are rarest, functional items OR anomaly items are middle of the road, aesthetic items are common
    - Large finds
        - Rarity generation like above
        - Randomly roll special, functional machinery (should almost never be just something found on station)
        - Always nearly indestructible
        - Always has anomalous effects
            - Can have more than two, "wired" up in complex, procedural ways.
    - Scanner machines
        - Scanner pads used to scan machinery
        - The spectrometer-thingy is used to unlock/scan small items
            - For **all but the most complicated, rare items, make the minigame very, very forgiving, or just skip it entirely**
            - Let's be entirely honest NO ONE wants to play that crappy game on NanoUI. Fight me.
    - Rarity
        - Find rarity determined by Zlevel
        - In general more common
        - Radiation leakage more common but lesser
            - **Rework radiation first** - small amounts of radiation will be trivial/ignored entirely, only when you stick around a radiation leakage for a while do you start getting hurt.
    - Extra
        - Need a good way to handle custom stuff - admin events hooking into these things would be amazing.
* **R&D**
    - First, **add categories for crying out loud, this is QoL**
    - Going onwards, if cargo is dealt with proper, R&D should focus on a core set of items to produce that are reliable and quality, with the rest being wacky situational (yet, sometimes even more powerful) prototypes.
        - The core set will not be any less than it is now, not to worry.
* **Science System**
    - Oh boy. Out of all of these, this is the craziest idea.
    - Rename R&D to Fabrication
    - Forget R&D levels as the "science system"
    - Fabrication gets matrix levels from deconstructing things as well as other sources - This is the "levels" system, and determines print speed and efficiency per category. This is highly important but isn't the end all.
        - To simulate a bit of time burned getting levels up, items can still have minimum levels to print.
    - Let's be honest, it's entirely unengaging to have to speedrun clicksmash for 10 minutes a round.
    - **Persistent hybrid techtrees.**
        - All or almost all current items are "default" - get fabricator matrix levels up to print.
            - New items added that are trivial can just be shoved in the "base" node, which embodies designs **that the station knows by default by, you know, being a spacefaring crew.**
        - New and powerful, niche, or just silly prototypes gated behind tech nodes, as well as weak-but-stacking global upgrades for the station
    - Tech nodes are **very** hard to get
        - Persistent when you get them
        - Partial unlocks to work up to them
    - This should **almost never** require admin involvement, outside of events unlocking nodes
        - Administration-event unlocks are frankly just too subjective for a persistent system. We'll have to fall back to this anyways no matter how hard we try, but we should opt to not.
    - **Node storage, erasure.**
        - Coders will never out-code the pace of player exploration
        - Central reserach mainframe on station stores nodes
        - Sabotage and damage loses nodes
        - Losing power, losing **cooling** will make there need to be a slight process to "restore" nodes
            - We often don't get power at deadpop, etc, so this restore process shouldn't take very long at all, it's just a token thing.
    - The magic of "techwebs 2.0" - **This doesn't just store item nodes.** Abstract concepts like knowledge of operation for certain items/machinery can be stored in this, lorecards for codex system can be stored in this, etc.
    - **Persistence problems**
        - Balancing persistent systems is way too hard
        - SS13's round nature is far easier to play around and doesn't make people who sink all too many hours into the game have too much advantages over others
        - May initially use this as storage for stuff like lore/knowledge codexes, and not touch R&D until a fully fledged plan can be put in place for how to balance this sort of thing in a way that doesn't make the game too awful for people who don't have infinite free time to waste.
* Robotics
    - Cybernetics/Cybermod system
        - Compact bionic modules, CDDA style?
        - Synthetic integration - easier to install, etc
        - The problem with this still being that HRP surgery is not something to do lightly, and making it persistent isn't a huge option right now because of balancing
        - See loadout installations, etc?
    - Cyborgs
        - Make dogborgs just a resprite/reflavoring of normal modules
        - Make cyborgs less awful to play, port QoL, etc
        - Blackmajor cyborg rework?
    - Drones
        - Just make them main drones for the love of all that is holy, stop with the "they're a cyborg module"
        - Lost drones can stay the same way though because they have a specific gameplay paradigm that relies on being a cyborg.
    - Mecha
        - Modular mecha maybe someday but for now literally just refactor mechs to make them less godawful
        - Add /tg/ mech ballistic ammo system
        - In exchange, up the usability of mechs in general - durand defense mode, strafing, cooldowns, armor, etc.
* Toxins
    - Nothing much to do here outside of atmospherics as toxins is gas based.
* Xenobiology
    - Add crossbreeding, port effects, etc
        - 3-5 extracts per crossbreed, instead of 10
    - Add monkey recycler upgrades
        - 25%, to 33.3%, to 50%, to 75% efficiency tiers 1 to 4
    - Make slime processor wrenchable
        - No upgrades - RP server should not rely on quantity over quality.
    - Maybe port cytology
    - Insert semi-joke here about making breedable spiders that have similar AI like slimes (feed, docility, discipline, etc) if grown from eggs (because normal spiders just try to kill you no matter what)
* Xenobotany
    - Pretty good as is
    - Maybe deobfuscate **numerical** traits like potency/nutrition usage/etc to make it easier to manipulate
    - Add plant genemodding - these genes, are, however, obfuscated, to make it not too easy
    - Erisbotany?
* Nanites
    - Port nanites from main
    - Limit usefulness for powergaming for now
        - Don't add program unlocks but keep them in codebase
    - Nanite pathogens that spread to people from nanite horrors
        - Much like with viruses, only even more thematic - object colonization
        - Nanites spreading onto objects
        - Programming that causes them to consume materials + damage objects while replicating and spreading
        - Sentient hostile nanite viruses :^)
        - ~consume enhance replicate~
    - Potential for researched usage later
    - Proteans are naturally immune to full infection for long, but hostile nanites can still cause issues for them (see: short term damage/ill effects as they are purged)

### Command
- More controls from the bridge for various systems
    - Dear lord give bridge officers a point other than being anime bridge bunnies **please**
- Admin side - more engagement with CC without physical CC presence
    - CCOs arriving should be absolute last resort
    - This also means declining to handle trivial issues. Give IAAs and heads a job, they should know how to mitigate issues.
- Bay holopads?
    - Cross-ship capable holocalls with /tg/ holocall backend
    - Admin/CCO holocalls? Either with custom "spawn as holo avatar" or just put a holopad at CC.

### Service/Civillian
- Botany is in a .. good? state? Genemodding should be a bit easier - while guessing unknowns is a .. "fun" system, we don't want people to have to spend hours and hours brute forcing.
    - Eris botany?
- Cooking is in a good spot other than code refactor wise but it really isn't a priority
    - Maybe chefs should be a bit more important? I feel that having protein shakes everywhere with zero downside to them **that also regenerate blood at a ridiculous rate** ruins the point of cooking.
- Make alcohol less trivial in poisoning cases
    - No really, IVing multiple bottles of beer into yourself should have an impact.
- More things to do for regular joes would be nice, without havinig to be in a department

### Species
- Species balancing paradigm
    - Species with a required lore behavior should be whitelisted. They **may receive advantages that put them a good bit above a baseline human, for this reason - their behaviors are guided by their species paradigm, outside of specific exceptions.**
    - Species should otherwise have a set of upsides/downsides that make them at the end of the day comparable to humans with everything taken into account
        - As a HRP server, we shouldn't focus too hard on the statistics of how these play out in combat, given that most people are expected to not jump into combat willy nilly just because they can.
    - Certain, rare species may exist as a whitelist with the above taken into account, as long as they aren't **insanely combat-effective compared to humans** - They shouldn't be too hard to *take out* of a fight (different from full death).
- Proteans addressed in antagonism section because they're that awful.
- Ensure **established species-lore behaviors are enforced.**
- Xenochimera
    - Buff to have proper regen + a bit of resistance
        - Death revival?
    - Lore behavior - pain/debilitation takes away logic (feral state), shouldn't be perfectly logical rampage machines
- Xenohybrids
    - High resistance to cold + shock, heat vulnerability/debilitation
    - No lore behavior (?) TBD
- Diona
    - Very high resistances overall, hard to kill.
        - They're slow. They're *walking trees.*
    - Lore behavior - Inherently pacifistic. Shouldn't be out of their way to cause damage
        - This doesn't mean they can't cause harm, this means they shouldn't be jumping for reasons to cause harm
- Prometheans
    - Water damage port from upstream
    - Add a bit more health to make them (full puns intended) slightly less squishy
- Everything else is more or less perfect at this time (to my knowledge). 

### Other
- Off duty hours
    - Serverwide reset.
    - 0.5 hour per hour played, as well as 0.25-0.5 hours accumulated for "off station time"?
- **Player Housing**
    - Extremely possible once ghost role system is ported
    - Custom DMM parser/loader allowing for custom maps from players loading into dynamic transit - **no administrative overhead required.**
    - To limit amount of time spent in here, make "housing" connected to the CC Residential District - Entering here, or housing, requires accumulated "Off Station" off duty hours or a per-round override set by admins.
    - silicons - "i won't write the entire system myself but if someone wants to do this i'll write them literally everything outside of most people's skill levels, which is just the dmm parser/loader and off duty hours system, as well as the actual house-loading and datastructures. someone should port ghost role system for me though, would rather not have to do it myself but could always bandaid and make it a verb until it's done"
- Clockwork Cult
    - Faction/Lore design
        - discuss with RP staff as a whole before anything is approved - do not risk a cult rerun.
    - "Neutral" generally-antagonistic faction
    - Port assets/items - lore/faction unnecessary, leave as adminspawn until needed.

## Antagonism
* Addition of antagonism should be considered whenever convenient - start slow, **keep things low chaos outside of announced events.**
* Adminspawn for the time being
* Antagonists should be thematic towards why they're there
    - Anyone playing them should take this into account
    - A nice example is a rescued pod survivor being a mercenary from a previous planetary bombing by the crew out to get escape/get revenge, etc
* On station antags
    - Persistence is a problem
        - New characters aren't trusted
        - Existing characters aren't decanonized per round - they can't feasibly be plants from other corporations
            - Not all players are willing to play sleeper agents
            - Perhaps have some people who are willing play antag-like characters that usually are nonantags (laying low) and assist in small ways on antag rounds
            - If anyone actually is up to it, throwaway characters work. Most won't be.
        - Bay just makes antag rounds non canon
            - Making the whole round non canon would be pretty bad if we want this to be a frequent thing any time soon
            - Making it noncanon for who was an antag can be annoying to keep track of
        - Discussion pending
    - Easy filler - pentester antags during start of this phase to keep security and station engaged without much issues character-wise
* Off station antags
    - Incorporate into map
    - Off-map factions screwing around near the station
    - Overmaps ships?
* This is undoubtly going to strain administrative resources and expose the horrid state of combat and HRP being a dice roll.
    - A lot of people on the server have protagonist syndrome. If they are not willing to give this up (or are forced to if they don't), this **will never get off the ground.**
    - HRP antagonists are **expected** to aim for a story, rather than blow things up and kill people at random **without rhyme or reason** for a short laugh.
        - An agent planning around defeating corporate security during a stealth run is expected, perhaps someone throwing a few punches or someone else threatening them a bit. They aren't realistically going to have to prepare for noncombatants suddenly arming up to kill/neutralize them unless the station is already going to hell
    - HRP guidelines likely need to be re-set for the server
        - "Wide Skillset" characters - slightly problematic, but not overly obnoxious as long as they aren't doing others' jobs for them or going out of their way to suppress any wrongdoing
        - Fear of death - There's been lengthy arguments regarding it. Something concrete has to be set regardless of where we stand on this to not have people throwing themselves at antags because "I can just be mirrored"
        - Non combatants should be avoiding combat.
    - Given the high restrictions on antagonist behavior, people should assist but stay in their lane and not jump to validhunting - it will be impossible to play on either side otherwise.
        - In some situations it would be perfectly expected for non-security to be physically involving themselves in the line of fire. Something needs to be set that gives a guideline of when this is a good idea, and when it isn't.
* Combat balance will suddenly matter.
    - This doesn't bode well given the codebase's complete lack of standards up until recent date
    - Can be handled as necessary
    - Quick list of things that'll probably have to go: R&D weapons reevaluation for ballisticspam vs cargo, modular weapons, NIF thermals/nvg (replace with R&D nvg + maybe roundstart nvgs, thermals **should only ever be on antagonists for the time being**)
    - **HASTE**, as a trait, **is going to be removed.** This is not negotiable.
        - Hardsuit sprinters changed to 0.5 speedup if already at 0 (speeding up user entirely), otherwise 1 speedup (nullifying additional delay) and tile-based energy drain.
    - Most species customization traits will be dealt with as necessary
    - Proteans
        - Worst current offender of whitelist species balance - nanite chambers will likely be done by the time these efforts are in full swing
        - Fail state = blobform. Full kill = destroyed + drop organs
        - Full kills are hard - easy to get away from things to regenerate
        - Fail state is easy - taking a bit over human damage = blob, taking a bit more than that = **stuck as blob to do costly regeneration**, or reform with high damage modifiers (making death or knockdown easy). **Entirely** combat-ineffective for 2-5 minutes *without assistance from another* if this happens.
    - **Teleportation**
        - Fast, instant, perfect teleportation like translocators are going to go.
            - Wormhole jaunters from main can exist - you can follow through them for miners
            - Hand teles instead for captain, add another teleporter for destination memes
            - Teleportation should be made rare or risky to make it not a fall-back that's too common.

## Persistence
- Ongoing discussions regarding persistence + side ideas for the future:
- ~~Replacing NIFs with only having soulcatcher/commlink~~ augments system
- All other NIF functionality in cyberware? With auto-degrading?
- How much persistence is too much persistence
    - Durability/resource cost system?
    - Max points? Tie into loadout "utility" points + genetic traits?
        - How much minmax is too much?
    - Station level persistence vs personal persistence?
- Map persistence?
    - NBT (Next Big Thing) planet-level large-scale persistence?
    - Persistent tech trees?
    - Persistent records?
        - Autofade much like admin notes, indexed by character name
- Factional relations between the station and other TSCs?
- Long term effects of round actions?
- Preventing metagrudging/similar from becoming a serious issue
- Preventing persistence from being used to apply **personal minmaxing** - results in too much powergaming

## --- Everything beneath here you can ignore unless you're a coder - please help out ---

## Major Ports
- Ideally port anything not specified from Nebula, which is a known-good modern baycode/HRP codebase
- ~~**Brainmed** - Nebula (With all attached systems)~~ we'll be doing this in house
- Materials/Chemical system - Nebula, goes right into Brainmed
- ~~Adherents - Nebula~~ done (love you papalus)
- **Projectile backend** - /tg/
- ~~Character Setup - Vorestation~~ done in house
- ~~Species Backend Changes - Vorestation~~ needs to be done in house
- ~~Storage Components~~ atom storage datums - main/tg-ish
    - Requires a refactor to attack_hand, shouldn't be overly difficult if you're at the skill level to be porting these anyways.
- ~~**update_appearance()** - /tg/. Not hard to get started, used for icon update backend
- Vorestation/Nebula shields. May be replaced in the future, but they're the best option right now.~~ done
- ~~**Inventory System** - /tg/. Extraordinarily important to get rid of some current bugs and cement new system in place~~ replaced in house
- ~~**Ghost Role/Spawner System** - main. Includes the new join-game menu that allows spawning directly into it, as well as the spawners menu~~ done
- ~~Piggyback Riding/Fireman Carrying - **/tg/station riding components.**~~ in house
~~- Radiation - /tg/~~ done
- Deterministic Explosions - main. Low priority, allows for better designs in the future.

## --- Everything beneath here you can ignore unless you want to *code*, not just code - please help out ---

## WIP Refactors/Backend
- Some ports are in here because it's less "port" and more "rewrite existing things to fit"
- **Special Note:** I've put my name (silicons#4133 on discord) on the things I'm actively working on. At the time of writing, however, please talk to me if anyone is intending to work on these, as most of them have specific structures/design points necessary - ***ALL* of these are cross-compatible with Main if coded right, and it would help reduce maintenance overhead *greatly* if they were done right the first time.**
    - **TBD isn't truly TBD.** Talk to me if you want to help, as we **do** need help on these. It just means there's no hard plans yet, though I do know exactly **what** we need to make it work.
- Gun backend - WIP
- Overmaps - Sync with main's when finished (silicons)
- Atmospherics
    - Machinery/Pipenets - Sync with main's when finished (silicons)
    - Gas mixtures - Somewhat done (?) (silicons)
    - Fire - WIP in house hybrid reagent/gas fire (silicons)
    - Gas reactions - WIP hybrid xgm/tgstation (silicons)
    - Environmental/ZAS - ??? too complicated to explain for now (silicons)
- ~~DCS (Datum Component System) signals - Sync with tg's signals optimally, not a real "refactor" as much as implement signals as needed~~ not needed 
- Character Setup - TBD
- Species Backend - TBD
- **Map datums/Runtime Maploading** - Convert codebase to this as we go along, backend is already there
    - Runtime maploaing will require a final push to get it operational
- Rigsuits - Sync with main's when finished (silicons)
- ~~Baseturfs - TBD - need to analyze /decl/flooring system fully and decide on a paradigm between the two (like flooring for aesthetics on-top-of-plating, while typepaths are for entirely different types for flooring. only some typepaths allowing flooring to be appliied? etc)~~ done
- Shuttlecode - TBD, probably going to be synced to main's when overmaps are done (silicons)
- Z-level manager - TBD - too complicated to explain
- Planets - TBD
- ~~Dynamic World - ??? (silicons) - tl;dr 2d open map system incorporating virtualmap/chunks into overmaps to give a gigantic playable space by only loading in chunks being used~~ impossible
- Job Backend - TBD - main's is a good start but we'll need to write our own for datumized departments and probably backport to main after
- Grabs - TBD
- **Event Driven Health Updates** - /tg/ and main - see below
- **Status Effects** - /tg/ - speeds up combat processing and makes the server more tick-driven
- **Mobility Refactor** - /tg/ - same as above, less bugs when done
- ~~**Movespeed Modifiers** - /tg/ - same as above, less bugs when done~~ done, just needs implementation of modifiers
- **check_block()/run_block()** - main - more structured system allowing for interesting combat paradigms in the future.
- EMPs - TBD (silicons) - minor thing but good for combat balance
- emags - TBD (silicons)


