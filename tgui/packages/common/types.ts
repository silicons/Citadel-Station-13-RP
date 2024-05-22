//* Types *//

/**
 * A common case in tgui, when you pass a value conditionally, these are
 * the types that can fall through the condition.
 */

export type BooleanLike = number | boolean | null | undefined;
/**
 * To make bool && str easier.
 * This is not valid for anything involving exact string syntax.
 * This is only valid for directly rendered / interpolated strings!
 */

export type StrictlyStringLike = string | boolean | null | undefined;

//* Type Operations *//

/**
 * Returns the arguments of a function F as an array.
 */
export type ArgumentsOf<F extends Function>
  = F extends (...args: infer A) => unknown ? A : never;
