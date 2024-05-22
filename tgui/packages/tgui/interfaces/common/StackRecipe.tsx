/**
 * @file
 * @license MIT
 */

import { BooleanLike } from "common/types";

export interface StackRecipeData {
  sortOrder: number;
  name: string;
  category?: string;
  resultType: string;
  resultAmt: number;
  time: number;
  noAutoSanity: BooleanLike;
  isStack: BooleanLike;
  ref: string;
  maxAmount?: number;
  cost: number;
}
