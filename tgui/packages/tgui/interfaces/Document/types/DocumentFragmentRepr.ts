/**
 * @file
 * @license MIT
 */

export type DocumentFragmentRepr =
  DocumentFragmentRepr_Markdown |
  DocumentFragmentRepr_HTML |
  DocumentFragmentRepr_Polyline;

type DocumentFragmentBase = {
  key: string;
}

export type DocumentFragmentRepr_Markdown = DocumentFragmentBase & {
  key: "markdown"
  content: string
  pos_x: number
  pos_y: number
  angle: number | null
  color: string | null
}

export type DocumentFragmentRepr_HTML = DocumentFragmentBase & {
  key: "html"
  content: string
  pos_x: number
  pos_y: number
}

export type DocumentFragmentRepr_Polyline = DocumentFragmentBase & {
  key: "polyline";
  style: "solid";
  color: string;
  vertices: string;
}
