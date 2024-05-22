/**
 * @file
 * @copyright 2020 Aleksej Komarov
 * @license MIT
 */

import { BooleanLike } from "./types";

/**
 * Helper for conditionally adding/removing classes in React
 */
export const classes = (classNames: (string | BooleanLike)[]) => {
  let className = '';
  for (let i = 0; i < classNames.length; i++) {
    const part = classNames[i];
    if (typeof part === 'string') {
      className += part + ' ';
    }
  }
  return className;
};

/**
 * Normalizes children prop, so that it is always an array of VDom
 * elements.
 */
export const normalizeChildren = <T>(children: T | T[]) => {
  if (Array.isArray(children)) {
    return children.flat().filter(value => value) as T[];
  }
  if (typeof children === 'object') {
    return [children];
  }
  return [];
};

/**
 * Shallowly checks if two objects are different.
 * Credit: https://github.com/developit/preact-compat
 */
export const shallowDiffers = (a: object, b: object) => {
  let i;
  for (i in a) {
    if (!(i in b)) {
      return true;
    }
  }
  for (i in b) {
    if (a[i] !== b[i]) {
      return true;
    }
  }
  return false;
};

/**
 * Default inferno hooks for pure components.
 */
export const pureComponentHooks = {
  onComponentShouldUpdate: (lastProps, nextProps) => {
    return shallowDiffers(lastProps, nextProps);
  },
};

/**
 * A helper to determine whether the object is renderable by React.
 */
export const canRender = (value: unknown) => {
  return value !== undefined
    && value !== null
    && typeof value !== 'boolean';
};


