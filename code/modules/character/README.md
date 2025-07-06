# Characters

WIP characters 2.0; more info to come.

This is the in-progress framework for a 'strongly-typed character creator',
with far more modularity and control and potential injection points for persistence.

## Hierarchy / Flow

Here's how characters are made.

- `/datum/prototype/character_faction` determines what `/datum/prototype/species`' you can pick.
- `/datum/prototype/species` determines the `/datum/prototype/character_background_type`s' you can pick.
- `/datum/prototype/character_background`s' must be picked for each type, which then cross-checks each other for compatibility.
