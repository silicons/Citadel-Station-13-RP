# Storyteller

The heavily in-dev work-in-progress automated game-mastering system for Citadel RP.

## Requirements

- Overmap is required, even if there's only one entity.
  - The entire backend depends on the overmap for distancing; if you're doing a (wink wink) hellish grimdark medieval server or something, just don't allow overmap access and have it be a 1x1 overmap with one entity, lol.

## Architecture

-- WIP --

Storyteller is a cooperative _storyteller_.

- The reason it requires overmap being active is because overmap & overmap entities
  are a good way to abstract game distances. As an example, if it wants to spawn pirates,
  it can check overmap entity distance to determine nominal difficulty in reaching another
  map.
- Storyteller API must be implemented on a given overmap & entity for storyteller to work.
  - The storyteller evaluates the API to determine what it wants, and the job of the engine
    is to spawn/instance sensical things to fulfill that request.

### broadphase

The storyteller calls a broadphase evaluation proc on:

- Overmaps
- Overmap entities

This determines if they are storyteller-compatible and injection-compatible.

- Entities
