//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

//*                                        Nutrient Types                                         *//
//* These are not necessarily real 'nutrients'. As an example, 'fruit' is a tpye, despite 'fruit' *//
//* actually being a complex combination of other types.                                          *//
//*                                                                                               *//
//* This is mostly to make everything stem from a single list, rather than having separate        *//
//* trackers for nutrients and food groups.                                                       *//
//*                                                                                               *//
//* Nutrient types do not have any effect in of themselves. Your biology's interactions with it   *//
//* determines what happens.                                                                      *//
//*                                                                                               *//
//* Nutrient types are additive. Read the below categories carefully.                             *//

//* metabolism - checked for energy satiety *//

/// Just generic nutrition. This just stands for 'has some kind of energy most organics can break down'.
#define NUTRIENT_METABOLIZE_ORGANIC "m-generic"
/// Nutritious for hemovores. Aka vampires.
#define NUTRIENT_METABOLIZE_HEMOVORE "m-hemovore"
/// Able to be bio-reacted regardless.
#define NUTRIENT_METABOLIZE_REACTOR "m-reactor"
/// Some kind of energy medium synthetic-likes can absorb in certain cases
#define NUTRIENT_METABOLIZE_ELECTRIC "m-electric"

//* food groups - checked for satiety rewards *//

#define NUTRIENT_FOOD_FRUIT "f-fruit"
#define NUTRIENT_FOOD_VEGETABLE "f-vegetable"
#define NUTRIENT_FOOD_GRAIN "f-grain"
#define NUTRIENT_FOOD_DAIRY "f-dairy"
#define NUTRIENT_FOOD_PROTEIN "f-protein"
#define NUTRIENT_FOOD_








//*                                      Nutrient Flags                                            *//
//* Quick & dirty nutrient flags, used to quickly check for specific things. Can have one or more. *//
//* These do not replace nutrient types.                                                           *//

#warn do we need flags?

#warn define enum/bitfield
