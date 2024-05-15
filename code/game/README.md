# Game

Implementation of the game world goes in here.

* /area: core /area, and subtypes. map-specific subtypes should, for now, go to `code/modules/maps/*`, though.
* /atoms: core /atom, /atom/movable code, world physics/movement handling, etc
* /click: clickchain handling
* /landmarks: eventually to be moved to `code/modules/mapping/*` or something. for now, they're map landmarks that denote things on the map for code. 
* /machinery: core /obj/machinery, and subtypes
* /objects: core /obj, /obj/item, and /obj/structure, and subtypes.
* /rendering: client rendering, VFX, planes, handling, etc.
* /turfs: core /turf, /turf/simulated/wall, /turf/simulated/floor, flooring systems, and subtypes.

and then there's:

* /antagonist: to be deprecated for the /datum/role system.
* /dna: to be deprecated for new dna system in character system rewrites.
* /gamemodes: to be deprecated for new unified gamemode-storyteller system. storytellers will require a way to act 'like' a gamemode (ending when things are complete, as opposed to basically forever-dynamic).
* /legacy_html_uis: to be deprecated / reworked with tgui refactor after 516.
* /magic: to be deprecated/reworked.
* /mecha: to be reworked for modular mecha under the /obj/vehicle system.

and then there's:

* /content/enigmas: one-off systems meant to represent weird world mechanics, like hierophant/vortex magic (to be added later), cults, the clockwork cult, etc
* /content/factions: code for specific factions, nanotrasen included

content subfolders should have their icons and sounds mapped to `icons/content/...` and `sound/content/...` respectively.

## todo

/game/backend/* that's just used to organize things like /obj/item's `item.dm`?

we could potentially have a split system; probably unnecessary though
