/**
 * @file
 * @license MIT
 */

import { DocumentFragment_Markdown } from "./fragments/DocumentFragment_Markdown";
import { DocumentFragmentRepr } from "./types/DocumentFragmentRepr";

export const DocumentFragment = (fragmentRepr: DocumentFragmentRepr) => {
  switch (fragmentRepr.key) {
    case "markdown":
      return DocumentFragment_Markdown(fragmentRepr);
  }
};
