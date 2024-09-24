# Datanet System

An experimental and efficient packet/socket simulation plane for the game.

## Concepts

- Packets - simulated data packets with arbitrary K-V fields.
- Sockets - simulated data sockets with arbitrary K-V fields.
- Packets & Sockets are both 'datanet routables', with one distinct source and one-or-many distinct destinations.

## Axioms

- Routing must be deterministic.
  - This means that routing must never, ever backtrack.
  - This allows for optimized / precomputed, event-driven routing graphs.
- Processing should be bounded time.
  - Avoid NTSL-like handling.

## This readme is bad.

Yeah, this readme is bad.

Uh.

Read the code comments honestly.
It's better documented than telecomms, but also a good bit more complicated.
